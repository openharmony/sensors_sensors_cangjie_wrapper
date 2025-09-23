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

/**
 * Created on 2024/9/18
 */
package ohos_app_cangjie_entry

import std.unittest.testmacro.*
import std.sync.*
import std.time.*
import BasicServicesKit.*
import SensorServiceKit.*
//import kit.AccountKit.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import ohos.base.*
import ohos.business_exception.*
import ohos.callback_invoke.*
import ohos.hilog.*


class OrientationSensorCallback <: Callback1Argument<OrientationResponse> {
    var invokedCount = 0
    init() {}
    public func invoke(err: ?BusinessException, arg: OrientationResponse): Unit {
        invokedCount++
    }
}

@Test
class TestSensorOnOff {
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func Once_IsCallOnce_Success(): Unit {
        let callback = OrientationSensorCallback()
        try {
            once(SensorId.Orientation, callback)
            sleepFor(300.milliSecond)
            @Expect(callback.invokedCount, 1)
        } catch (e: BusinessException) {
            failExpect("once failed, ${e}")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_DefaultInternal_CallMultipleTimes(): Unit {
        let callback = OrientationSensorCallback()
        try {
            on(SensorId.Orientation, callback) // default report interval 200ms
            sleepFor(450.milliSecond)
            @Expect(callback.invokedCount >= 2)
            off(SensorId.Orientation, callback: callback)
        } catch (e: BusinessException) {
            failExpect("on failed, ${e}")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_Internal400MS_Success(): Unit {
        let callback = OrientationSensorCallback()
        try {
            on(SensorId.Orientation, callback, option: Options(interval: IntervalOption.SensorNumber(400_000_000))) // default report interval 200ms
            sleepFor(1.second)
            @Expect(callback.invokedCount, 3)
            off(SensorId.Orientation)
        } catch (e: BusinessException) {
            failExpect("on failed, ${e}")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_InternalGameMode_Success(): Unit {
        let callback = OrientationSensorCallback()
        try {
            on(SensorId.Orientation, callback, option: Options(interval: IntervalOption.GameMode))
            sleepFor(1.second)
            @Expect(callback.invokedCount > 3)
            off(SensorId.Orientation)
        } catch (e: BusinessException) {
            failExpect("on failed, ${e}")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testOnInternalGameModeWithParam(): Unit {
        let callback = OrientationSensorCallback()
        try {
            let param = SensorInfoParam(deviceId: 1i32, sensorIndex: 1i32)
            on(SensorId.Orientation, callback, option: Options(interval: IntervalOption.GameMode, sensorInfoParam: param))
            sleepFor(1.second)
            @Expect(callback.invokedCount > 3)
            off(SensorId.Orientation)
        } catch (e: BusinessException) {
            failExpect("on failed, ${e}")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_InternalUIMode_Success(): Unit {
        let callback = OrientationSensorCallback()
        try {
            on(SensorId.Orientation, callback, option: Options(interval: IntervalOption.UIMode))
            sleepFor(1.second)
            @Expect(callback.invokedCount > 3)
            off(SensorId.Orientation)
        } catch (e: BusinessException) {
            failExpect("on failed, ${e}")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_InternalNormalMode_Success(): Unit {
        let callback = OrientationSensorCallback()
        try {
            on(SensorId.Orientation, callback, option: Options(interval: IntervalOption.NormalMode))
            sleepFor(1.second)
            @Expect(callback.invokedCount > 3)
            off(SensorId.Orientation)
        } catch (e: BusinessException) {
            failExpect("on failed, ${e}")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_DuplicateSubscription_Success(): Unit {
        let callback = OrientationSensorCallback()
        try {
            on(SensorId.Orientation, callback)
            sleepFor(1.second)
            @Expect(callback.invokedCount >= 4)
            off(SensorId.Orientation)
        } catch (e: BusinessException) {
            failExpect("once failed, ${e}")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func Off_OffOneCallback_Success(): Unit {
        let callback1 = OrientationSensorCallback()
        let callback2 = OrientationSensorCallback()
        try {
            on(SensorId.Orientation, callback1)
            off(SensorId.Orientation, callback: callback1)
            sleepFor(201.milliSecond)
            let offcallback1InvokeCnt = callback1.invokedCount
            sleepFor(201.milliSecond)
            @Expect(offcallback1InvokeCnt, callback2.invokedCount)
            off(SensorId.Orientation)
        } catch (e: BusinessException) {
            failExpect("on failed, ${e}")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func Off_OffAllCallbacks_Success(): Unit {
        let callback1 = OrientationSensorCallback()
        let callback2 = OrientationSensorCallback()
        try {
            on(SensorId.Orientation, callback1)
            on(SensorId.Orientation, callback2)
            off(SensorId.Orientation)
            sleepFor(201.milliSecond)
            let offcallback1InvokeCnt = callback1.invokedCount
            let offcallback2InvokeCnt = callback2.invokedCount
            sleepFor(201.milliSecond)
            @Expect(offcallback1InvokeCnt, callback1.invokedCount)
            @Expect(offcallback2InvokeCnt, callback2.invokedCount)
        } catch (e: BusinessException) {
            failExpect("on failed, ${e}")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_ACCELEROMETER_Success_Or_Not_Exist() {
        let sensors = getSensorList()
        var isSensorExist = false
        for (index in 0..sensors.size) {
            if (sensors[index].sensorId == Accelerometer.getValue()) {
                isSensorExist = true
            }
        }
        let callback = AccelerometerResponseCallback()
        if (isSensorExist == true) {
            on(Accelerometer, callback)
            sleepFor(3.second)
            Hilog.info(0, "testtag", "AccelerometerResponseCallback invokedCount ${callback.invokedCount}")
            @Expect(callback.invokedCount > 0, true)
        } else {
            expectBusinessException(401) { on(Accelerometer, callback) }
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_ACCELEROMETER_UNCALIBRATED_Success_Or_Not_Exist() {
        let sensors = getSensorList()
        var isSensorExist = false
        for (index in 0..sensors.size) {
            if (sensors[index].sensorId == AccelerometerUncalibrated.getValue()) {
                isSensorExist = true
            }
        }
        let callback = AccelerometerUncalibratedResponseCallback()
        if (isSensorExist == true) {
            on(AccelerometerUncalibrated, callback)
            sleepFor(3.second)
            Hilog.info(0, "testtag", "AccelerometerUncalibratedResponseCallback invokedCount ${callback.invokedCount}")
            @Expect(callback.invokedCount > 0, true)
        } else {
            expectBusinessException(401) { on(AccelerometerUncalibrated, callback) }
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_AMBIENT_LIGHT_Success_Or_Not_Exist() {
        let sensors = getSensorList()
        var isSensorExist = false
        for (index in 0..sensors.size) {
            if (sensors[index].sensorId == AmbientLight.getValue()) {
                isSensorExist = true
            }
        }
        let callback = LightResponseCallback()
        if (isSensorExist == true) {
            on(AmbientLight, callback)
            sleepFor(3.second)
            Hilog.info(0, "testtag", "LightResponseCallback invokedCount ${callback.invokedCount}")
            @Expect(callback.invokedCount > 0, true)
        } else {
            expectBusinessException(401) { on(AmbientLight, callback) }
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_AMBIENT_TEMPERATURE_Success_Or_Not_Exist() {
        let sensors = getSensorList()
        var isSensorExist = false
        for (index in 0..sensors.size) {
            if (sensors[index].sensorId == AmbientTemperature.getValue()) {
                isSensorExist = true
            }
        }
        let callback = AmbientTemperatureResponseCallback()
        if (isSensorExist == true) {
            on(AmbientTemperature, callback)
            sleepFor(3.second)
            Hilog.info(0, "testtag", "AmbientTemperatureResponseCallback invokedCount ${callback.invokedCount}")
            @Expect(callback.invokedCount > 0, true)
        } else {
            expectBusinessException(401) { on(AmbientTemperature, callback) }
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_BAROMETER_Success_Or_Not_Exist() {
        let sensors = getSensorList()
        var isSensorExist = false
        for (index in 0..sensors.size) {
            if (sensors[index].sensorId == Barometer.getValue()) {
                isSensorExist = true
            }
        }
        let callback = BarometerResponseCallback()
        if (isSensorExist == true) {
            on(Barometer, callback)
            sleepFor(3.second)
            Hilog.info(0, "testtag", "BarometerResponseCallback invokedCount ${callback.invokedCount}")
            @Expect(callback.invokedCount > 0, true)
        } else {
            expectBusinessException(401) { on(Barometer, callback) }
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_GRAVITY_Success_Or_Not_Exist() {
        let sensors = getSensorList()
        var isSensorExist = false
        for (index in 0..sensors.size) {
            if (sensors[index].sensorId == Gravity.getValue()) {
                isSensorExist = true
            }
        }
        let callback = GravityResponseCallback()
        if (isSensorExist == true) {
            on(Gravity, callback)
            sleepFor(3.second)
            Hilog.info(0, "testtag", "GravityResponseCallback invokedCount ${callback.invokedCount}")
            @Expect(callback.invokedCount > 0, true)
        } else {
            expectBusinessException(401) { on(Gravity, callback) }
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_GYROSCOPE_Success_Or_Not_Exist() {
        let sensors = getSensorList()
        var isSensorExist = false
        for (index in 0..sensors.size) {
            if (sensors[index].sensorId == Gyroscope.getValue()) {
                isSensorExist = true
            }
        }
        let callback = GyroscopeResponseCallback()
        if (isSensorExist == true) {
            on(Gyroscope, callback)
            sleepFor(3.second)
            Hilog.info(0, "testtag", "GyroscopeResponseCallback invokedCount ${callback.invokedCount}")
            @Expect(callback.invokedCount > 0, true)
        } else {
            expectBusinessException(401) { on(Gyroscope, callback) }
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_GYROSCOPE_UNCALIBRATED_Success_Or_Not_Exist() {
        let sensors = getSensorList()
        var isSensorExist = false
        for (index in 0..sensors.size) {
            if (sensors[index].sensorId == GyroscopeUncalibrated.getValue()) {
                isSensorExist = true
            }
        }
        let callback = GyroscopeUncalibratedResponseCallback()
        if (isSensorExist == true) {
            on(GyroscopeUncalibrated, callback)
            sleepFor(3.second)
            Hilog.info(0, "testtag", "GyroscopeUncalibratedResponseCallback invokedCount ${callback.invokedCount}")
            @Expect(callback.invokedCount > 0, true)
        } else {
            expectBusinessException(401) { on(GyroscopeUncalibrated, callback) }
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_HALL_Success_Or_Not_Exist() {
        let sensors = getSensorList()
        var isSensorExist = false
        for (index in 0..sensors.size) {
            if (sensors[index].sensorId == Hall.getValue()) {
                isSensorExist = true
            }
        }
        let callback = HallResponseCallback()
        if (isSensorExist == true) {
            on(Hall, callback)
            sleepFor(3.second)
            Hilog.info(0, "testtag", "HallResponseCallback invokedCount ${callback.invokedCount}")
            @Expect(callback.invokedCount > 0, true)
        } else {
            expectBusinessException(401) { on(Hall, callback) }
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_HEART_RATE_Success_Or_Not_Exist() {
        let sensors = getSensorList()
        var isSensorExist = false
        for (index in 0..sensors.size) {
            if (sensors[index].sensorId == HeartRate.getValue()) {
                isSensorExist = true
            }
        }
        let callback = HeartRateResponseCallback()
        if (isSensorExist == true) {
            on(HeartRate, callback)
            sleepFor(3.second)
            Hilog.info(0, "testtag", "HeartRateResponseCallback invokedCount ${callback.invokedCount}")
            @Expect(callback.invokedCount > 0, true)
        } else {
            expectBusinessException(401) { on(HeartRate, callback) }
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_HUMIDITY_Success_Or_Not_Exist() {
        let sensors = getSensorList()
        var isSensorExist = false
        for (index in 0..sensors.size) {
            if (sensors[index].sensorId == Humidity.getValue()) {
                isSensorExist = true
            }
        }
        let callback = HumidityResponseCallback()
        if (isSensorExist == true) {
            on(Humidity, callback)
            sleepFor(3.second)
            Hilog.info(0, "testtag", "HumidityResponseCallback invokedCount ${callback.invokedCount}")
            @Expect(callback.invokedCount > 0, true)
        } else {
            expectBusinessException(401) { on(Humidity, callback) }
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_LINEAR_ACCELEROMETER_Success_Or_Not_Exist() {
        let sensors = getSensorList()
        var isSensorExist = false
        for (index in 0..sensors.size) {
            if (sensors[index].sensorId == LinearAccelerometer.getValue()) {
                isSensorExist = true
            }
        }
        let callback = LinearAccelerometerResponseCallback()
        if (isSensorExist == true) {
            on(LinearAccelerometer, callback)
            sleepFor(3.second)
            Hilog.info(0, "testtag", "LinearAccelerometerResponseCallback invokedCount ${callback.invokedCount}")
            @Expect(callback.invokedCount > 0, true)
        } else {
            expectBusinessException(401) { on(LinearAccelerometer, callback) }
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_MAGNETIC_FIELD_Success_Or_Not_Exist() {
        let sensors = getSensorList()
        var isSensorExist = false
        for (index in 0..sensors.size) {
            if (sensors[index].sensorId == MagneticField.getValue()) {
                isSensorExist = true
            }
        }
        let callback = MagneticFieldResponseCallback()
        if (isSensorExist == true) {
            on(MagneticField, callback)
            sleepFor(3.second)
            Hilog.info(0, "testtag", "MagneticFieldResponseCallback invokedCount ${callback.invokedCount}")
            @Expect(callback.invokedCount > 0, true)
        } else {
            expectBusinessException(401) { on(MagneticField, callback) }
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_MAGNETIC_FIELD_UNCALIBRATED_Success_Or_Not_Exist() {
        let sensors = getSensorList()
        var isSensorExist = false
        for (index in 0..sensors.size) {
            if (sensors[index].sensorId == MagneticFieldUncalibrated.getValue()) {
                isSensorExist = true
            }
        }
        let callback = MagneticFieldUncalibratedResponseCallback()
        if (isSensorExist == true) {
            on(MagneticFieldUncalibrated, callback)
            sleepFor(3.second)
            Hilog.info(0, "testtag", "MagneticFieldUncalibratedResponseCallback invokedCount ${callback.invokedCount}")
            @Expect(callback.invokedCount > 0, true)
        } else {
            expectBusinessException(401) { on(MagneticFieldUncalibrated, callback) }
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_ORIENTATION_Success_Or_Not_Exist() {
        let sensors = getSensorList()
        var isSensorExist = false
        for (index in 0..sensors.size) {
            if (sensors[index].sensorId == Orientation.getValue()) {
                isSensorExist = true
            }
        }
        let callback = OrientationResponseCallback()
        if (isSensorExist == true) {
            on(Orientation, callback)
            sleepFor(3.second)
            Hilog.info(0, "testtag", "OrientationResponseCallback invokedCount ${callback.invokedCount}")
            @Expect(callback.invokedCount > 0, true)
        } else {
            expectBusinessException(401) { on(Orientation, callback) }
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_NoPermissionSensorId_ThrowException() {
        // user granted permission: ACTIVITY_MOTION
        expectBusinessException(201) {
            on(Pedometer, PedometerResponseCallback())
        }
        expectBusinessException(201) {
            on(PedometerDetection, PedometerDetectionResponseCallback())
        }
    }

    func getActivityMotionPermission() {
        Hilog.info(0, "testtag", "get user granted permission ohos.permission.DISTRIBUTED_DATASYNC")
        try {
            getRequiredPermissions(["ohos.permission.ACTIVITY_MOTION"])
            sleep(Duration.second * 1i64)
            click(at: Screen.getTheOnlyUiComponentWhoseTextEqualsTo("允许").centerPoint)
            sleep(Duration.second * 1i64)
        } catch (_: Exception) {
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_PEDOMETER_Success_Or_Not_Exist() {
        let sensors = getSensorList()
        var isSensorExist = false
        for (index in 0..sensors.size) {
            if (sensors[index].sensorId == Pedometer.getValue()) {
                isSensorExist = true
            }
        }
        let callback = PedometerResponseCallback()
        if (isSensorExist == true) {
            getActivityMotionPermission()
            on(Pedometer, callback)
            sleepFor(3.second)
            Hilog.info(0, "testtag", "PedometerResponseCallback invokedCount ${callback.invokedCount}")
            @Expect(callback.invokedCount > 0, true)
        } else {
            expectBusinessException(401) { on(Pedometer, callback) }
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_PEDOMETER_DETECTION_Success_Or_Not_Exist() {
        let sensors = getSensorList()
        var isSensorExist = false
        for (index in 0..sensors.size) {
            if (sensors[index].sensorId == PedometerDetection.getValue()) {
                isSensorExist = true
            }
        }
        let callback = PedometerDetectionResponseCallback()
        if (isSensorExist == true) {
            getActivityMotionPermission()
            on(PedometerDetection, callback)
            sleepFor(3.second)
            Hilog.info(0, "testtag", "PedometerDetectionResponseCallback invokedCount ${callback.invokedCount}")
            @Expect(callback.invokedCount == 0, true) //PEDOMETER_DETECTION 需要手动模拟步行触发回调 手机静置不会触发回调
        } else {
            expectBusinessException(401) { on(PedometerDetection, callback) }
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_PROXIMITY_Success_Or_Not_Exist() {
        let sensors = getSensorList()
        var isSensorExist = false
        for (index in 0..sensors.size) {
            if (sensors[index].sensorId == Proximity.getValue()) {
                isSensorExist = true
            }
        }
        let callback = ProximityResponseCallback()
        if (isSensorExist == true) {
            on(Proximity, callback)
            sleepFor(3.second)
            Hilog.info(0, "testtag", "ProximityResponseCallback invokedCount ${callback.invokedCount}")
            @Expect(callback.invokedCount > 0, true)
        } else {
            expectBusinessException(401) { on(Proximity, callback) }
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_ROTATION_VECTOR_Success_Or_Not_Exist() {
        let sensors = getSensorList()
        var isSensorExist = false
        for (index in 0..sensors.size) {
            if (sensors[index].sensorId == RotationVector.getValue()) {
                isSensorExist = true
            }
        }
        let callback = RotationVectorResponseCallback()
        if (isSensorExist == true) {
            on(RotationVector, callback)
            sleepFor(3.second)
            Hilog.info(0, "testtag", "RotationVectorResponseCallback invokedCount ${callback.invokedCount}")
            @Expect(callback.invokedCount > 0, true)
        } else {
            expectBusinessException(401) { on(RotationVector, callback) }
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_SIGNIFICANT_MOTION_Success_Or_Not_Exist() {
        let sensors = getSensorList()
        var isSensorExist = false
        for (index in 0..sensors.size) {
            if (sensors[index].sensorId == SignificantMotion.getValue()) {
                isSensorExist = true
            }
        }
        let callback = SignificantMotionResponseCallback()
        if (isSensorExist == true) {
            on(SignificantMotion, callback)
            sleepFor(3.second)
            Hilog.info(0, "testtag", "SignificantMotionResponseCallback invokedCount ${callback.invokedCount}")
            @Expect(callback.invokedCount > 0, true)
        } else {
            expectBusinessException(401) { on(SignificantMotion, callback) }
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_WEAR_DETECTION_Success_Or_Not_Exist() {
        let sensors = getSensorList()
        var isSensorExist = false
        for (index in 0..sensors.size) {
            if (sensors[index].sensorId == WearDetection.getValue()) {
                isSensorExist = true
            }
        }
        let callback = WearDetectionResponseCallback()
        if (isSensorExist == true) {
            on(WearDetection, callback)
            sleepFor(3.second)
            Hilog.info(0, "testtag", "WearDetectionResponseCallback invokedCount ${callback.invokedCount}")
            @Expect(callback.invokedCount > 0, true)
        } else {
            expectBusinessException(401) { on(WearDetection, callback) }
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_NotSupportedSensorId_ThrowException() {
        expectBusinessException(401) {
            on(AmbientTemperature, AmbientTemperatureResponseCallback())
        }
        expectBusinessException(401) {
            on(HeartRate, HeartRateResponseCallback())
        }
        expectBusinessException(401) {
            on(Humidity, HumidityResponseCallback())
        }
        expectBusinessException(401) {
            on(WearDetection, WearDetectionResponseCallback())
        }
        expectBusinessException(401) {
            on(SignificantMotion, SignificantMotionResponseCallback())
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func On_NotMatchSensorId_ThrowException() {
        expectBusinessException(401) {
            on(Accelerometer, SignificantMotionResponseCallback())
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func Off_SupportedSensorId_Success() {
        off(Accelerometer)
        off(AccelerometerUncalibrated)
        off(AmbientLight)
        off(Barometer)
        off(Gravity)
        off(Gyroscope)
        off(GyroscopeUncalibrated)
        off(Hall)
        off(LinearAccelerometer)
        off(MagneticField)
        off(MagneticFieldUncalibrated)
        off(Orientation)
        off(Proximity)
        off(RotationVector)
        off(Pedometer)
        off(PedometerDetection)
        off(AmbientTemperature)
        off(HeartRate)
        off(Humidity)
        off(WearDetection)
        off(SignificantMotion)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func Off_NotMatchSensorId_ThrowException() {
        on(Accelerometer, AccelerometerResponseCallback())
        expectBusinessException(401) {
            off(Accelerometer, callback: SignificantMotionResponseCallback())
        }
        off(Accelerometer)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func Once_NotMatchedSensorId_ThrowException() {
        expectBusinessException(401) {
            once(Accelerometer, SignificantMotionResponseCallback())
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func Once_OnedSensorId_ThrowException() {
        let callback1 = AccelerometerResponseCallback()
        let callback2 = AccelerometerResponseCallback()
        on(Accelerometer, callback1)
        once(Accelerometer, callback2)
        off(Accelerometer, callback: callback1)
        off(Accelerometer, callback: callback2)
    }
}

class AccelerometerResponseCallback <: Callback1Argument<AccelerometerResponse> {
    public var invokedCount: Int64 = 0
    public AccelerometerResponseCallback() {}
    public func invoke(err: ?BusinessException, arg: AccelerometerResponse) {
        invokedCount++
        Hilog.info(0, "testtag", "AccelerometerResponseCallback execute")
    }
}

class AccelerometerUncalibratedResponseCallback <: Callback1Argument<AccelerometerUncalibratedResponse> {
    public var invokedCount: Int64 = 0
    public AccelerometerUncalibratedResponseCallback() {}
    public func invoke(err: ?BusinessException, arg: AccelerometerUncalibratedResponse) {
        invokedCount++
        Hilog.info(0, "testtag", "AccelerometerUncalibratedResponseCallback execute")
    }
}

class LightResponseCallback <: Callback1Argument<LightResponse> {
    public var invokedCount: Int64 = 0
    public LightResponseCallback() {}
    public func invoke(err: ?BusinessException, arg: LightResponse) {
        invokedCount++
        Hilog.info(0, "testtag", "LightResponseCallback execute")
    }
}

class AmbientTemperatureResponseCallback <: Callback1Argument<AmbientTemperatureResponse> {
    public var invokedCount: Int64 = 0
    public AmbientTemperatureResponseCallback() {}
    public func invoke(err: ?BusinessException, arg: AmbientTemperatureResponse) {
        invokedCount++
        Hilog.info(0, "testtag", "AmbientTemperatureResponseCallback execute")
    }
}

class BarometerResponseCallback <: Callback1Argument<BarometerResponse> {
    public var invokedCount: Int64 = 0
    public BarometerResponseCallback() {}
    public func invoke(err: ?BusinessException, arg: BarometerResponse) {
        invokedCount++
        Hilog.info(0, "testtag", "BarometerResponseCallback execute")
    }
}

class GravityResponseCallback <: Callback1Argument<GravityResponse> {
    public var invokedCount: Int64 = 0
    public GravityResponseCallback() {}
    public func invoke(err: ?BusinessException, arg: GravityResponse) {
        invokedCount++
        Hilog.info(0, "testtag", "GravityResponseCallback execute")
    }
}

class GyroscopeResponseCallback <: Callback1Argument<GyroscopeResponse> {
    public var invokedCount: Int64 = 0
    public GyroscopeResponseCallback() {}
    public func invoke(err: ?BusinessException, arg: GyroscopeResponse) {
        invokedCount++
        Hilog.info(0, "testtag", "GyroscopeResponseCallback execute")
    }
}

class GyroscopeUncalibratedResponseCallback <: Callback1Argument<GyroscopeUncalibratedResponse> {
    public var invokedCount: Int64 = 0
    public GyroscopeUncalibratedResponseCallback() {}
    public func invoke(err: ?BusinessException, arg: GyroscopeUncalibratedResponse) {
        invokedCount++
        Hilog.info(0, "testtag", "GyroscopeUncalibratedResponseCallback execute")
    }
}

class HallResponseCallback <: Callback1Argument<HallResponse> {
    public var invokedCount: Int64 = 0
    public HallResponseCallback() {}
    public func invoke(err: ?BusinessException, arg: HallResponse) {
        invokedCount++
        Hilog.info(0, "testtag", "HallResponseCallback execute")
    }
}

class HeartRateResponseCallback <: Callback1Argument<HeartRateResponse> {
    public var invokedCount: Int64 = 0
    public HeartRateResponseCallback() {}
    public func invoke(err: ?BusinessException, arg: HeartRateResponse) {
        invokedCount++
        Hilog.info(0, "testtag", "HeartRateResponseCallback execute")
    }
}

class HumidityResponseCallback <: Callback1Argument<HumidityResponse> {
    public var invokedCount: Int64 = 0
    public HumidityResponseCallback() {}
    public func invoke(err: ?BusinessException, arg: HumidityResponse) {
        invokedCount++
        Hilog.info(0, "testtag", "HumidityResponseCallback execute")
    }
}

class LinearAccelerometerResponseCallback <: Callback1Argument<LinearAccelerometerResponse> {
    public var invokedCount: Int64 = 0
    public LinearAccelerometerResponseCallback() {}
    public func invoke(err: ?BusinessException, arg: LinearAccelerometerResponse) {
        invokedCount++
        Hilog.info(0, "testtag", "LinearAccelerometerResponseCallback execute")
    }
}

class MagneticFieldResponseCallback <: Callback1Argument<MagneticFieldResponse> {
    public var invokedCount: Int64 = 0
    public MagneticFieldResponseCallback() {}
    public func invoke(err: ?BusinessException, arg: MagneticFieldResponse) {
        invokedCount++
        Hilog.info(0, "testtag", "MagneticFieldResponseCallback execute")
    }
}

class MagneticFieldUncalibratedResponseCallback <: Callback1Argument<MagneticFieldUncalibratedResponse> {
    public var invokedCount: Int64 = 0
    public MagneticFieldUncalibratedResponseCallback() {}
    public func invoke(err: ?BusinessException, arg: MagneticFieldUncalibratedResponse) {
        invokedCount++
        Hilog.info(0, "testtag", "MagneticFieldUncalibratedResponseCallback execute")
    }
}

class OrientationResponseCallback <: Callback1Argument<OrientationResponse> {
    public var invokedCount: Int64 = 0
    public OrientationResponseCallback() {}
    public func invoke(err: ?BusinessException, arg: OrientationResponse) {
        invokedCount++
        Hilog.info(0, "testtag", "OrientationResponseCallback execute")
    }
}

class PedometerResponseCallback <: Callback1Argument<PedometerResponse> {
    public var invokedCount: Int64 = 0
    public PedometerResponseCallback() {}
    public func invoke(err: ?BusinessException, arg: PedometerResponse) {
        invokedCount++
        Hilog.info(0, "testtag", "PedometerResponseCallback execute")
    }
}

class PedometerDetectionResponseCallback <: Callback1Argument<PedometerDetectionResponse> {
    public var invokedCount: Int64 = 0
    public PedometerDetectionResponseCallback() {}
    public func invoke(err: ?BusinessException, arg: PedometerDetectionResponse) {
        invokedCount++
        Hilog.info(0, "testtag", "PedometerDetectionResponseCallback execute")
    }
}

class ProximityResponseCallback <: Callback1Argument<ProximityResponse> {
    public var invokedCount: Int64 = 0
    public ProximityResponseCallback() {}
    public func invoke(err: ?BusinessException, arg: ProximityResponse) {
        invokedCount++
        Hilog.info(0, "testtag", "ProximityResponseCallback execute")
    }
}

class RotationVectorResponseCallback <: Callback1Argument<RotationVectorResponse> {
    public var invokedCount: Int64 = 0
    public RotationVectorResponseCallback() {}
    public func invoke(err: ?BusinessException, arg: RotationVectorResponse) {
        invokedCount++
        Hilog.info(0, "testtag", "RotationVectorResponseCallback execute")
    }
}

class SignificantMotionResponseCallback <: Callback1Argument<SignificantMotionResponse> {
    public var invokedCount: Int64 = 0
    public SignificantMotionResponseCallback() {}
    public func invoke(err: ?BusinessException, arg: SignificantMotionResponse) {
        invokedCount++
        Hilog.info(0, "testtag", "SignificantMotionResponseCallback execute")
    }
}

class WearDetectionResponseCallback <: Callback1Argument<WearDetectionResponse> {
    public var invokedCount: Int64 = 0
    public WearDetectionResponseCallback() {}
    public func invoke(err: ?BusinessException, arg: WearDetectionResponse) {
        invokedCount++
        Hilog.info(0, "testtag", "WearDetectionResponseCallback execute")
    }
}

func expectBusinessException(code: Int32, f: () -> Unit) {
    try {
        f()
        @Expect(false)
    } catch (e: BusinessException) {
        @Expect(e.code, code)
    }
}
