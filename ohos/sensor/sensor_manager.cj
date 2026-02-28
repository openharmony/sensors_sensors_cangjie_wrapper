/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

package ohos.sensor

import ohos.callback_invoke.{ CallbackObject, Callback1Argument}
import std.collection.{ArrayList, HashMap}
import std.sync.Mutex

let ON_ENHANCED_SENSOR_MANAGER = SensorManagerEnhanced()
let ONCE_ENHANCED_SENSOR_MANAGER = SensorManagerEnhanced()

class CallbackList {
    private let callbackList: ArrayList<CallbackObject>
    private let callBackMutex: Mutex

    init() {
        callbackList = ArrayList<CallbackObject>()
        callBackMutex = Mutex()
    }

    func off(target: CallbackObject): Unit {
        synchronized(callBackMutex) {
            callbackList.removeIf({callback => refEq(callback, target)})
        }
    }

    func on(target: CallbackObject): Unit {
        synchronized(callBackMutex) {
            for (callback in callbackList) {
                if (refEq(callback, target)) {
                    SENSOR_LOG.info("The callback has been subscribed.")
                    return
                }
            }
            callbackList.add(target)
        }
    }

    func clear(): Unit {
        synchronized(callBackMutex) {
            callbackList.clear()
        }
    }

    func contains(target: CallbackObject): Bool {
        synchronized(callBackMutex) {
            for (callback in callbackList) {
                if (refEq(callback, target)) {
                    return true
                }
            }
        }
        false
    }

    func isEmpty(): Bool {
        synchronized(callBackMutex) {
            callbackList.isEmpty()
        }
    }

    func size(): Int64 {
        synchronized(callBackMutex) {
            callbackList.size
        }
    }

    func getAllCallbacks(): Array<CallbackObject> {
        synchronized(callBackMutex) {
            return callbackList.toArray()
        }
    }
}

class SensorManagerEnhanced {
    private let sensorMap: HashMap<SensorDescription, CallbackList>
    private let mutex: Mutex

    init() {
        sensorMap = HashMap<SensorDescription, CallbackList>()
        mutex = Mutex()
    }

    func get(sensorDesc: SensorDescription): ?CallbackList {
        synchronized(mutex) {
            sensorMap.get(sensorDesc)
        }
    }

    func consume(sensorDesc: SensorDescription): ?CallbackList {
        synchronized(mutex) {
            sensorMap.remove(sensorDesc)
        }
    }

    func getOrCreate(sensorDesc: SensorDescription): CallbackList {
        synchronized(mutex) {
            if (let Some(v) <- sensorMap.get(sensorDesc)) {
                return v
            }
            let list = CallbackList()
            sensorMap.add(sensorDesc, list)
            list
        }
    }
    
    static func isMatchType(`type`: SensorId, callback: CallbackObject): Bool {
        match (`type`) {
            case Accelerometer => callback is Callback1Argument<AccelerometerResponse>
            case AccelerometerUncalibrated => callback is Callback1Argument<AccelerometerUncalibratedResponse>
            case AmbientLight => callback is Callback1Argument<LightResponse>
            case AmbientTemperature => callback is Callback1Argument<AmbientTemperatureResponse>
            case Barometer => callback is Callback1Argument<BarometerResponse>
            case Gravity => callback is Callback1Argument<GravityResponse>
            case Gyroscope => callback is Callback1Argument<GyroscopeResponse>
            case GyroscopeUncalibrated => callback is Callback1Argument<GyroscopeUncalibratedResponse>
            case Hall => callback is Callback1Argument<HallResponse>
            case HeartRate => callback is Callback1Argument<HeartRateResponse>
            case Humidity => callback is Callback1Argument<HumidityResponse>
            case LinearAccelerometer => callback is Callback1Argument<LinearAccelerometerResponse>
            case MagneticField => callback is Callback1Argument<MagneticFieldResponse>
            case MagneticFieldUncalibrated => callback is Callback1Argument<MagneticFieldUncalibratedResponse>
            case Orientation => callback is Callback1Argument<OrientationResponse>
            case Pedometer => callback is Callback1Argument<PedometerResponse>
            case PedometerDetection => callback is Callback1Argument<PedometerDetectionResponse>
            case Proximity => callback is Callback1Argument<ProximityResponse>
            case RotationVector => callback is Callback1Argument<RotationVectorResponse>
            case SignificantMotion => callback is Callback1Argument<SignificantMotionResponse>
            case WearDetection => callback is Callback1Argument<WearDetectionResponse>
            case _ => false
        }
    }

    func isSensorCallbackSubscribed(sensorDesc: SensorDescription, callback: CallbackObject): Bool {
        if (let Some(v) <- sensorMap.get(sensorDesc)) {
            if (v.contains(callback)) {
                return true
            }
        }
        return false
    }

    func isSensorSubscribed(sensorDesc: SensorDescription): Bool {
        if (let Some(v) <- sensorMap.get(sensorDesc)) {
            return true
        } else {
            return false
        }
    }


    func removeAllCallback(sensorDesc: SensorDescription): Unit {
        synchronized(mutex) {
            sensorMap.remove(sensorDesc)
        }
    }
}

func dataCallbackImpl(data: CPointer<CSensorCallbackData>): Unit {
    if (data.isNull()) {
        SENSOR_LOG.error("CSensorCallbackData is nullptr.")
        return
    }

    let callbackData = unsafe { data.read() }
    let responseData = match (callbackData.convertToResponseOption()) {
        case None =>
            SENSOR_LOG.error("convertToResponse error")
            return
        case Some(v) => v
    }

    let desc = SensorDescription(callbackData.deviceId, callbackData.sensorTypeId, callbackData.sensorId, callbackData.location)
    let onCallbackListOpt = ON_ENHANCED_SENSOR_MANAGER.get(desc)?.getAllCallbacks()
    emitSensorCallback(desc, onCallbackListOpt, responseData)

    let onceCallbackListOpt = ONCE_ENHANCED_SENSOR_MANAGER.consume(desc)?.getAllCallbacks()
    emitSensorCallback(desc, onceCallbackListOpt, responseData)
    if (!ON_ENHANCED_SENSOR_MANAGER.isSensorSubscribed(desc)) {
        let cParam = unsafe { CSensorDescription(desc) }
        let ret = unsafe { FfiSensorUnSubscribeSensorEnhanced(cParam) }
        if (ret != 0) {
            SENSOR_LOG.error("dataCallbackImpl Unsubscribe failed, ret=${ret}.")
        }
    }
}

func emitSensorCallback(sensorDesc: SensorDescription, callbackListOpt: ?Array<CallbackObject>, responseData: Response): Unit {
    if (let Some(callbackList) <- callbackListOpt) {
        try {
            emitOneSensorTypeCallbacks(sensorDesc, callbackList, responseData)
        } catch (e: Exception) {
            SENSOR_LOG.error("convertToResponse error, callbackList sensorid:${sensorDesc.sensorType}")
            return
        }
    } else {
        SENSOR_LOG.debug("Fail to find sensor onceCallback id:${sensorDesc.sensorType} or callbackList is empty.")
    }
}

func emitOneSensorTypeCallbacks(sensorDesc: SensorDescription, callbackList: Array<CallbackObject>, responseData: Response): Unit {
    for (callback in callbackList) {
        match (sensorDesc.sensorType) {
            case 1 => emitCallbackFunc<AccelerometerResponse>(callback, responseData)
            case 2 => emitCallbackFunc<GyroscopeResponse>(callback, responseData)
            case 5 => emitCallbackFunc<LightResponse>(callback, responseData)
            case 6 => emitCallbackFunc<MagneticFieldResponse>(callback, responseData)
            case 8 => emitCallbackFunc<BarometerResponse>(callback, responseData)
            case 10 => emitCallbackFunc<HallResponse>(callback, responseData)
            case 12 => emitCallbackFunc<ProximityResponse>(callback, responseData)
            case 13 => emitCallbackFunc<HumidityResponse>(callback, responseData)
            case 256 => emitCallbackFunc<OrientationResponse>(callback, responseData)
            case 257 => emitCallbackFunc<GravityResponse>(callback, responseData)
            case 258 => emitCallbackFunc<LinearAccelerometerResponse>(callback, responseData)
            case 259 => emitCallbackFunc<RotationVectorResponse>(callback, responseData)
            case 260 => emitCallbackFunc<AmbientTemperatureResponse>(callback, responseData)
            case 261 => emitCallbackFunc<MagneticFieldUncalibratedResponse>(callback, responseData)
            case 263 => emitCallbackFunc<GyroscopeUncalibratedResponse>(callback, responseData)
            case 264 => emitCallbackFunc<SignificantMotionResponse>(callback, responseData)
            case 265 => emitCallbackFunc<PedometerDetectionResponse>(callback, responseData)
            case 266 => emitCallbackFunc<PedometerResponse>(callback, responseData)
            case 278 => emitCallbackFunc<HeartRateResponse>(callback, responseData)
            case 280 => emitCallbackFunc<WearDetectionResponse>(callback, responseData)
            case 281 => emitCallbackFunc<AccelerometerUncalibratedResponse>(callback, responseData)
            case _ => return
        }
    }
}

func emitCallbackFunc<T>(callback: CallbackObject, responseData: Response): Unit {
    let callbackInstOpt = (callback as Callback1Argument<T>)
    if (let Some(callbackInst) <- callbackInstOpt) {
        callbackInst.invoke(None, (responseData as T).getOrThrow())
    }
}