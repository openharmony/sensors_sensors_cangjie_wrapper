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

import ohos.business_exception.{BusinessException, ERR_PARAMETER_ERROR, ERR_NO_PERMISSION}
import ohos.callback_invoke.{CallbackObject, Callback1Argument}
import ohos.ffi.{Callback1Param, SUCCESS_CODE}
import std.deriving.Derive
import ohos.labels.APILevel

/**
 * Enum for obtain the type of sensor.
 *
 */
@Derive[ToString, Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public enum SensorId {
    /**
     * Acceleration sensor.
     *
     */
    | @!APILevel[
        since: "22",
        permission: "ohos.permission.ACCELEROMETER",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Accelerometer
    /**
     * Gyroscope sensor.
     *
     */
    | @!APILevel[
        since: "22",
        permission: "ohos.permission.GYROSCOPE",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Gyroscope
    /**
     * Ambient light sensor.
     *
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    AmbientLight
    /**
     * Magnetic field sensor.
     *
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    MagneticField
    /**
     * Barometric pressure sensor.
     *
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Barometer
    /**
     * Hall effect sensor.
     *
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Hall
    /**
     * Proximity sensor.
     *
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Proximity
    /**
     * Humidity sensor.
     *
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Humidity
    |
    @!Hide
    Color
    |
    @!Hide
    Sar
    /**
     * Orientation sensor.
     *
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Orientation
    /**
     * Gravity sensor.
     *
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Gravity
    /**
     * Linear acceleration sensor.
     *
     */
    | @!APILevel[
        since: "22",
        permission: "ohos.permission.ACCELEROMETER",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    LinearAccelerometer
    /**
     * Rotation vector sensor.
     *
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    RotationVector
    /**
     * Ambient temperature sensor.
     *
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    AmbientTemperature
    /**
     * Uncalibrated magnetic field sensor.
     *
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    MagneticFieldUncalibrated
    /**
     * Uncalibrated gyroscope sensor.
     *
     */
    | @!APILevel[
        since: "22",
        permission: "ohos.permission.GYROSCOPE",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    GyroscopeUncalibrated
    /**
     * Significant motion sensor.
     *
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    SignificantMotion
    /**
     * Pedometer detection sensor.
     *
     */
    | @!APILevel[
        since: "22",
        permission: "ohos.permission.ACTIVITY_MOTION",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    PedometerDetection
    /**
     * Pedometer sensor.
     *
     */
    | @!APILevel[
        since: "22",
        permission: "ohos.permission.ACTIVITY_MOTION",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Pedometer
    /**
     * Heart rate sensor.
     *
     */
    | @!APILevel[
        since: "22",
        permission: "ohos.permission.READ_HEALTH_DATA",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    HeartRate
    /**
     * Wear detection sensor.
     *
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    WearDetection
    /**
     * Uncalibrated acceleration sensor.
     *
     */
    | @!APILevel[
        since: "22",
        permission: "ohos.permission.ACCELEROMETER",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    AccelerometerUncalibrated
    | ...

    /**
     * Get the corresponding mapping value.
     *
     * @returns { Int32 } Returns the numeric ID corresponding to the sensor type.
     * @throws { BusinessException } 14500101 - Parameter error. The sensor type is not supported.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public func getValue(): Int32 {
        match (this) {
            case Accelerometer => 1
            case Gyroscope => 2
            case AmbientLight => 5
            case MagneticField => 6
            case Barometer => 8
            case Hall => 10
            case Proximity => 12
            case Humidity => 13
            case Orientation => 256
            case Gravity => 257
            case LinearAccelerometer => 258
            case RotationVector => 259
            case AmbientTemperature => 260
            case MagneticFieldUncalibrated => 261
            case GyroscopeUncalibrated => 263
            case SignificantMotion => 264
            case PedometerDetection => 265
            case Pedometer => 266
            case HeartRate => 278
            case WearDetection => 280
            case AccelerometerUncalibrated => 281
            case _ => throw BusinessException(14500101, "The type is not supported.")
        }
    }

    static func parse(v: Int32): SensorId {
        match (v) {
            case 1 => Accelerometer
            case 2 => Gyroscope
            case 5 => AmbientLight
            case 6 => MagneticField
            case 8 => Barometer
            case 10 => Hall
            case 12 => Proximity
            case 13 => Humidity
            case 256 => Orientation
            case 257 => Gravity
            case 258 => LinearAccelerometer
            case 259 => RotationVector
            case 260 => AmbientTemperature
            case 261 => MagneticFieldUncalibrated
            case 263 => GyroscopeUncalibrated
            case 264 => SignificantMotion
            case 265 => PedometerDetection
            case 266 => Pedometer
            case 278 => HeartRate
            case 280 => WearDetection
            case 281 => AccelerometerUncalibrated
            case _ => throw BusinessException(14500101, "The type is not supported.")
        }
    }
}

/**
 * Enumerates the accuracy levels of data reported by a sensor.
 *
 */
@Derive[ToString, Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public enum SensorAccuracy {
    /**
     * The sensor data is unreliable. It is possible that the sensor does not contact with the device to measure.
     *
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    AccuracyUnreliable
    /**
     * The sensor data is at a low accuracy level. The data must be calibrated based on the environment before being
     * used.
     *
     */
    |
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    AccuracyLow
    /**
     * The sensor data is at a medium accuracy level. You are advised to calibrate the data based on the environment
     * before using it.
     *
     */
    |
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    AccuracyMedium
    /**
     * The sensor data is at a high accuracy level. The data can be used directly.
     *
     */
    |
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    AccuracyHigh
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case AccuracyUnreliable => 0
                case AccuracyLow => 1
                case AccuracyMedium => 2
                case AccuracyHigh => 3
                case _ => throw BusinessException(14500101, "The type is not supported.")
            }
        }
    }

    static func parse(v: Int32): SensorAccuracy {
        match (v) {
            case 0 => AccuracyUnreliable
            case 1 => AccuracyLow
            case 2 => AccuracyMedium
            case 3 => AccuracyHigh
            case _ => AccuracyUnreliable
        }
    }
}

/**
 * Enumerates IntervalOption. 
 */
@Derive[ToString, Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public enum IntervalOption {
    /**
    * SensorNumber option.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    SensorNumber(Int64)
    /**
    * GameMode option.
    */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    GameMode
    /**
    * UIMode option.
    */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    UIMode
    /**
    * NormalMode option.
    */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    NormalMode
    | ...

    prop value: Int64 {
        get() {
            match (this) {
                case SensorNumber(v) => v
                case GameMode => 20_000_000
                case UIMode => 60_000_000
                case NormalMode => 200_000_000
                case _ => throw BusinessException(14500101, "The type is not supported.")
            }
        }
    }
}

/**
* Parameters of sensor on the device.
*
*/
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class SensorInfoParam {
    /**
    * Unique identifier for the device that contains one or multiple sensors.
    * By default, deviceId may default to querying or controlling the local default sensor.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var deviceId: Int32

    /**
    * Index of sensors of the same type. By default, it controls default sensors of the sensor type.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var sensorIndex: Int32

    /**
    * Options constructor.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public init(deviceId!: Int32 = -1, sensorIndex!: Int32 = 0) {
        this.deviceId = deviceId
        this.sensorIndex = sensorIndex
    }
}

/**
* Acceleration sensor event data.
*
*/
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class AccelerometerResponse <: Response {
    /**
    * Acceleration x-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32

    /**
    * Acceleration y-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32
    /**
    * Acceleration z-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var z: Float32

    init(x: Float32, y: Float32, z: Float32) {
        this.x = x
        this.y = y
        this.z = z 
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CAccelerometerResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
    }
}

/**
 * Subscribe to the sensor's optional parameters.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class Options {
    /**
    * Sensor event reporting event interval.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var interval: IntervalOption

    /**
    * Parameters of sensor on the device.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var sensorInfoParam: ?SensorInfoParam

    /**
    * Options constructor.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public init(interval!: IntervalOption = NormalMode, sensorInfoParam!: ?SensorInfoParam = None) {
        this.interval = interval
        this.sensorInfoParam = sensorInfoParam
    }
}

/**
 * The basic data structure of the sensor event.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public open class Response {
    /**
     * The timestamp of the reported sensor data.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var timestamp: Int64

    /**
     * The accuracy levels of data reported by a sensor.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var accuracy: SensorAccuracy

    private let impl_: ResponseImpl = ResponseImpl()

    init(timestamp: Int64, accuracy: SensorAccuracy) {
        this.timestamp = timestamp
        this.accuracy = accuracy
    }

    init() {
        this(0, SensorAccuracy.AccuracyUnreliable)
    }

    static func parseCResponseData<T>(data: CPointer<UInt8>, dataLen: Int32): T where T <: CType {
        let size = Int32(unsafe { sizeOf<T>() })
        if (size > dataLen) {
            throw BusinessException(14500101, "Data length mismatch, ${size}:${dataLen}.")
        }
        unsafe { CPointer<T>(data).read() }
    }
}

class ResponseImpl {}

/**
 * Acceleration uncalibrated sensor event data.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class AccelerometerUncalibratedResponse <: Response {
    /**
    * Acceleration uncalibrated x-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32

    /**
    * Acceleration uncalibrated y-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32

    /**
    * Acceleration uncalibrated z-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var z: Float32

    /**
    * Acceleration uncalibrated x-axis offset.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var biasX: Float32

    /**
    * Acceleration uncalibrated y-axis offset.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var biasY: Float32
    /**
    * Acceleration uncalibrated z-axis offset.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var biasZ: Float32

    init(x: Float32, y: Float32, z: Float32, biasX: Float32, biasY: Float32, biasZ: Float32) {
        this.x = x
        this.y = y
        this.z = z
        this.biasX = biasX
        this.biasY = biasY
        this.biasZ = biasZ
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CAccelerometerUncalibratedResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
        (biasX, biasY, biasZ) = (data.biasX, data.biasY, data.biasZ)
    }
}

/**
 * Light sensor event data.
 * 
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class LightResponse <: Response {
    /**
    * Indicates light intensity, in lux.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var intensity: Float32

    /**
    * Indicates color temperature, in kelvin.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var colorTemperature: ?Float32

    /**
    * Indicates infrared luminance, in cd/m2.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var infraredLuminance: ?Float32

    init(intensity: Float32, colorTemperature!: ?Float32 = None, infraredLuminance!: ?Float32 = None) {
        this.intensity = intensity
        this.colorTemperature = colorTemperature
        this.infraredLuminance = infraredLuminance
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CLightResponse>(v.data, v.dataLen)
        intensity = data.intensity
        colorTemperature = data.colorTemperature
        infraredLuminance = data.infraredLuminance
    }
}

/**
 * Ambient temperature sensor event data.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class AmbientTemperatureResponse <: Response {
    /**
    * Indicates ambient temperature, in celsius.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var temperature: Float32

    init(temperature: Float32) {
        this.temperature = temperature
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CAmbientTemperatureResponse>(v.data, v.dataLen)
        temperature = data.temperature
    }
}

/**
 * Barometer sensor event data.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class BarometerResponse <: Response {
    /**
    * Indicates the number of barometer, in hpa.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var pressure: Float32

    init(pressure: Float32) {
        this.pressure = pressure
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CBarometerResponse>(v.data, v.dataLen)
        pressure = data.pressure
    }
}

/**
 * Gravity sensor event data.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class GravityResponse <: Response {
    /**
    * Gravity x-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32
    /**
    * Gravity y-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32
    /**
    * Gravity z-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var z: Float32

    init(x: Float32, y: Float32, z: Float32) {
        this.x = x
        this.y = y
        this.z = z
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CGravityResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
    }
}

/**
 * Gyroscope sensor event data.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class GyroscopeResponse <: Response {
    /**
    * Gyroscope x-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32

    /**
    * Gyroscope y-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32

    /**
    * Gyroscope z-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var z: Float32

    init(x: Float32, y: Float32, z: Float32) {
        this.x = x
        this.y = y
        this.z = z
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CGyroscopeResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
    }
}

/**
 * Gyroscope uncalibrated sensor event data.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class GyroscopeUncalibratedResponse <: Response {
    /**
    * Gyroscope uncalibrated x-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32

    /**
    * Gyroscope uncalibrated y-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32

    /**
    * Gyroscope uncalibrated z-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var z: Float32

    /**
    * Gyroscope uncalibrated x-axis offset.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var biasX: Float32

    /**
    * Gyroscope uncalibrated y-axis offset.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var biasY: Float32

    /**
    * Gyroscope uncalibrated z-axis offset.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var biasZ: Float32

    init(x: Float32, y: Float32, z: Float32, biasX: Float32, biasY: Float32, biasZ: Float32) {
        this.x = x
        this.y = y
        this.z = z
        this.biasX = biasX
        this.biasY = biasY
        this.biasZ = biasZ
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CGyroscopeUncalibratedResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
        (biasX, biasY, biasZ) = (data.biasX, data.biasY, data.biasZ)
    }
}

/**
 * Hall sensor event data.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class HallResponse <: Response {
    /**
    * Indicates hall status, 0 indicates open, and greater than 0 indicates suction.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var status: UInt32

    init(status: UInt32) {
        this.status = status
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CHallResponse>(v.data, v.dataLen)
        status = UInt32(data.status)
    }
}

/**
 * Heart rate sensor event data.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class HeartRateResponse <: Response {
    /**
    * Indicates the number of heart rate.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var heartRate: UInt32

    init(heartRate: UInt32) {
        this.heartRate = heartRate
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CHeartRateResponse>(v.data, v.dataLen)
        heartRate = UInt32(data.heartRate)
    }
}

/**
 * Humidity sensor event data.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class HumidityResponse <: Response {
    /**
    * Indicates the number of humidity.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var humidity: Float32

    init(humidity: Float32) {
        this.humidity = humidity
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CHumidityResponse>(v.data, v.dataLen)
        humidity = data.humidity
    }
}

/**
 * Linear acceleration sensor event data.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class LinearAccelerometerResponse <: Response {
    /**
    * Linear acceleration x-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32

    /**
    * Linear acceleration y-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32

    /**
    * Linear acceleration z-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var z: Float32

    init(x: Float32, y: Float32, z: Float32) {
        this.x = x
        this.y = y
        this.z = z
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CLinearAccelerometerResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
    }
}

/**
 * Magnetic field sensor event data.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class MagneticFieldResponse <: Response {
    /**
    * Magnetic field x-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32

    /**
    * Magnetic field y-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32
    /**
    * Magnetic field z-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var z: Float32

    init(x: Float32, y: Float32, z: Float32) {
        this.x = x
        this.y = y
        this.z = z
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CMagneticFieldResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
    }
}

/**
 * Magnetic field sensor event data.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class MagneticFieldUncalibratedResponse <: Response {
    /**
    * Magnetic field uncalibrated x-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32

    /**
    * Magnetic field uncalibrated y-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32

    /**
    * Magnetic field uncalibrated z-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var z: Float32

    /**
    * Magnetic field uncalibrated x-axis offset.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var biasX: Float32

    /**
    * Magnetic field uncalibrated y-axis offset.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var biasY: Float32

    /**
    * Magnetic field uncalibrated z-axis offset.    *
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var biasZ: Float32

    init(x: Float32, y: Float32, z: Float32, biasX: Float32, biasY: Float32, biasZ: Float32) {
        this.x = x
        this.y = y
        this.z = z
        this.biasX = biasX
        this.biasY = biasY
        this.biasZ = biasZ
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CMagneticFieldUncalibratedResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
        (biasX, biasY, biasZ) = (data.biasX, data.biasY, data.biasZ)
    }
}

/**
 * Orientation sensor event data.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class OrientationResponse <: Response {
    /**
    * The device rotates at an angle around the Z axis.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var alpha: Float32

    /**
    * The device rotates at an angle around the X axis.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var beta: Float32

    /**
    * The device rotates at an angle around the Y axis.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var gamma: Float32

    init(alpha: Float32, beta: Float32, gamma: Float32) {
        this.alpha = alpha
        this.beta = beta
        this.gamma = gamma
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<COrientationResponse>(v.data, v.dataLen)
        (alpha, beta, gamma) = (data.alpha, data.beta, data.gamma)
    }
}

/**
 * Pedometer sensor event data.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class PedometerResponse <: Response {
    /**
    * Indicates the number of steps.
    *
    * relation steps: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var steps: Int64

    init(steps: Int64) {
        this.steps = steps
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CPedometerResponse>(v.data, v.dataLen)
        steps = Int64(data.steps)
    }
}

/**
 * Pedometer detection sensor event data.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class PedometerDetectionResponse <: Response {
    /**
    * Indicates the pedometer detection status, 1 indicates that a walking action has occurred,
    * and 0 indicates that no movement has occurred.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var scalar: UInt32

    init(scalar: UInt32) {
        this.scalar = scalar
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CPedometerDetectionResponse>(v.data, v.dataLen)
        scalar = UInt32(data.scalar)
    }
}

/**
 * Proximity sensor event data.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class ProximityResponse <: Response {
    /**
    * Indicates the degree of proximity, event 0 indicates proximity, and greater than 0 indicates distance.
    *
    * relation distance: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var distance: Float32

    init(distance: Float32) {
        this.distance = distance
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CProximityResponse>(v.data, v.dataLen)
        distance = data.distance
    }
}

/**
 * Rotation vector sensor event data.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class RotationVectorResponse <: Response {
    /**
    * Rotation vector x-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32

    /**
    * Rotation vector y-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32

    /**
    * Rotation vector z-axis component.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var z: Float32

    /**
    * Scalar quantity.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var w: Float32

    init(x: Float32, y: Float32, z: Float32, w: Float32) {
        this.x = x
        this.y = y
        this.z = z
        this.w = w 
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CRotationVectorResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
        w = data.w
    }
}

/**
 * Significant motion sensor event data.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class SignificantMotionResponse <: Response {
    /**
    * Indicates the degree of proximity, event 0 indicates proximity, and greater than 0 indicates distance.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var scalar: Int32

    init(scalar: Int32) {
        this.scalar = scalar
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CSignificantMotionResponse>(v.data, v.dataLen)
        scalar = Int32(data.scalar)
    }
}

/**
 * Wear detection sensor event data.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class WearDetectionResponse <: Response {
    /**
    * Indicates the status of wear detection, 1 for wearing, 0 for wearing not.
    *
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var value: UInt32

    init(value: UInt32) {
        this.value = value
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CWearDetectionResponse>(v.data, v.dataLen)
        value = UInt32(data.value)
    }
}

const DEFAULT_REPORTING_INTERVAL = 200_000_000

func removeCallback(sensorType: SensorId, callback: CallbackObject): Int64 {
    if (!SensorManager.isMatchType(sensorType, callback)) {
        throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
    }

    let list = ON_SENSOR_MANAGER.getOrCreate(sensorType)
    list.off(callback)
    if (list.isEmpty()) {
        ON_SENSOR_MANAGER.remove(sensorType)
        return 0
    }

    return list.size()
}

func removeAllCallback(sensorType: SensorId): Int64 {
    ON_SENSOR_MANAGER.remove(sensorType)
    0
}

/**
 * Indicates sensor information.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class Sensor {
    /**
     * Sensor name.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var sensorName: String

    /**
     * Sensor vendor.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var vendorName: String

    /**
     * Sensor firmware version.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var firmwareVersion: String

    /**
     * Sensor hardware version.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var hardwareVersion: String

    /**
     * Sensor type ID, {@code SensorType}.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var sensorId: Int32

    /**
     * Maximum measurement range of the sensor.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var maxRange: Float32

    /**
     * Minimum sample period allowed, in ns.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var minSamplePeriod: Int64

    /**
     * Maximum sample period allowed, in ns.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var maxSamplePeriod: Int64

    /**
     * Sensor accuracy.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var precision: Float32

    /**
     * Sensor power.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var power: Float32

    @!Hide
    internal var sensorIndex: ?Int32 = Option<Int32>.None

    @!Hide
    internal var deviceId: ?Int32 = Option<Int32>.None

    @!Hide
    internal var deviceName: ?String = Option<String>.None

    @!Hide
    internal var isLocalSensor: ?Bool = Option<Bool>.None

    init(sensorName: String, vendorName: String, firmwareVersion: String,
        hardwareVersion: String, sensorId: Int32, maxRange: Float32, minSamplePeriod: Int64,
        maxSamplePeriod: Int64, precision: Float32, power: Float32) {
        this.sensorName = sensorName
        this.vendorName = vendorName
        this.firmwareVersion = firmwareVersion
        this.hardwareVersion = hardwareVersion
        this.sensorId = sensorId
        this.maxRange = maxRange
        this.minSamplePeriod = minSamplePeriod
        this.maxSamplePeriod = maxSamplePeriod
        this.precision = precision
        this.power = power
    }

    init(data: CSensor) {
        sensorName = data.sensorName.toString()
        vendorName = data.vendorName.toString()
        firmwareVersion = data.firmwareVersion.toString()
        hardwareVersion = data.hardwareVersion.toString()
        sensorId = data.sensorId
        maxRange = data.maxRange
        minSamplePeriod = data.minSamplePeriod
        maxSamplePeriod = data.maxSamplePeriod
        precision = data.precision
        power = data.power
    }
}

/**
 * Subscribe to sensor data.
 *
 * @param { SensorId } sensorType - Indicates the sensor type to subscribe to.
 * @param { Callback1Argument<T> } callback - Indicates the callback function that returns sensor data.
 * @param { Options } option - Indicates the optional subscription parameters.
 * @throws { BusinessException } 201 - Permission verification failed. The application does not have permission to call
 * the API.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
 * 2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 14500101 - Service exception.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public func on<T>(sensorType: SensorId, callback: Callback1Argument<T>, option!: ?Options = None): Unit where T <: Response {
    if (!SensorManager.isMatchType(sensorType, callback)) {
        throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let interval = option?.interval.value ?? DEFAULT_REPORTING_INTERVAL
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(sensorType.getValue(), interval, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    // Due to interval, no need to check type is subscribed
    ON_SENSOR_MANAGER.getOrCreate(sensorType).on(callback)
}

/**
 * Subscribe to sensor data once.
 *
 * @param { SensorId } sensorType - Indicates the sensor type to subscribe to.
 * @param { Callback1Argument<T> } callback - Indicates the callback function that returns sensor data.
 * @throws { BusinessException } 201 - Permission verification failed. The application does not have permission to call
 * the API.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
 * 2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 14500101 - Service exception.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public func once<T>(sensorType: SensorId, callback: Callback1Argument<T>): Unit where T <: Response {
    if (!SensorManager.isMatchType(sensorType, callback)) {
        throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
    }

    if (ON_SENSOR_MANAGER.isSensorSubscribed(sensorType)) {
        ONCE_SENSOR_MANAGER.getOrCreate(sensorType).on(callback)
        return
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(sensorType.getValue(), DEFAULT_REPORTING_INTERVAL, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }

    ONCE_SENSOR_MANAGER.getOrCreate(sensorType).on(callback)
}

/**
 * Unsubscribe from sensor data.
 *
 * @param { SensorId } sensorType - Indicates the sensor type to unsubscribe from.
 * @param { CallbackObject } callback - Indicates the callback function to remove. If not provided, all callbacks for
 * the sensor type will be removed.
 * @throws { BusinessException } 201 - Permission verification failed. The application does not have permission to call
 * the API.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
 * 2. Incorrect parameter types; 3. Parameter verification failed.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public func off(sensorType: SensorId, callback!: ?CallbackObject = None): Unit {
    if (!ON_SENSOR_MANAGER.isSensorSubscribed(sensorType)) {
        return
    }

    let size = match (callback) {
        case Some(v) => removeCallback(sensorType, v)
        case None => removeAllCallback(sensorType)
    }

    if (size > 0) {
        return
    }

    let ret = unsafe { FfiSensorUnSubscribeSensor(sensorType.getValue()) }
    if (ret == ERR_PARAMETER_ERROR || ret == ERR_NO_PERMISSION) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
}

/**
 * Obtains all sensor information on the device.
 *
 * @returns { Array<Sensor> } Returns an array containing all available sensor information.
 * @throws { BusinessException } 14500101 - Service exception. Possible causes: 1. Sensor hdf service exception; 2.
 * Sensor service ipc exception; 3. Sensor data channel exception.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public func getSensorList(): Array<Sensor> {
    var result = CSensorArray()
    let ret = unsafe { FfiSensorGetAllSensors(inout result) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    try {
        result.asArray()
    } finally {
        result.free()
    }
}

/**
 * Obtains the sensor information of a specified type.
 *
 * @param { SensorId } sensorType - Indicates the sensor type to query.
 * @returns { Sensor } Returns the sensor information of the specified type.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
 * 2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 14500101 - Service exception. Possible causes: 1. Sensor hdf service exception; 2.
 * Sensor service ipc exception; 3. Sensor data channel exception.
 * @throws { BusinessException } 14500102 - The sensor is not supported by the device.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public func getSingleSensor(sensorType: SensorId): Sensor {
    let sensorList = getSensorList()
    for (sensor in sensorList) {
        if (sensor.sensorId == sensorType.getValue()) {
            return sensor
        }
    }

    throw BusinessException(SENSOR_NO_SUPPORT, getErrorMsg(SENSOR_NO_SUPPORT))
}
