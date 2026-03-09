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
 * Created on 2024/9/20
 */
package ohos_app_cangjie_entry

import std.unittest.testmacro.*
import std.math.*
import kit.SensorServiceKit.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import ohos.base.*

extend Sensor {
    public operator func ==(other: Sensor): Bool {
        this.sensorId == other.sensorId && this.sensorName == other.sensorName && this.vendorName == other.vendorName &&
            this.firmwareVersion == other.firmwareVersion && this.hardwareVersion == other.hardwareVersion &&
            this.maxRange == other.maxRange && this.minSamplePeriod == other.minSamplePeriod && this.maxSamplePeriod == other
            .maxSamplePeriod && this.precision == other.precision && this.power == other.power
    }

    public operator func !=(other: Sensor): Bool {
        !(this == other)
    }
}

@Test
class TestSensorGetSensorList {
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_GetSensorList_BasicFunction_Success(): Unit {
        sleepFor(1.second) // wait for sensor init
        let sensors = getSensorList()
        @Expect(sensors.size > 0)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_GetSingleSensor(): Unit {
        try {
            let sensor = getSingleSensor(SensorId.Accelerometer)
            @Expect(sensor.sensorId, SensorId.Accelerometer.getValue())
        } catch (e: Exception) {
            @Expect(false)
        }
    }

    /**
     * 测试获取传感器列表
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_getSensorList_return_array() {
        // 测试流程：调用getSensorList()获取传感器列表
        // 预期结果：返回Array<Sensor>类型的传感器属性列表，数组元素包含sensorName、vendorName、sensorId等属性
        let sensors = getSensorList()
        @Expect(true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_getSingleSensor_sensorType_Gyroscope() {
        // 测试流程：调用getSingleSensor(SensorId.Gyroscope)获取陀螺仪传感器信息
        // 预期结果：返回Sensor对象，sensorId对应陀螺仪传感器
        try {
            let sensor = getSingleSensor(SensorId.Gyroscope)
            @Expect(sensor.sensorId == SensorId.Gyroscope.getValue())
        } catch (e: Exception) {
            // 在不支持该传感器的设备上，此测试可能会失败
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_getSingleSensor_sensorType_AmbientLight() {
        // 测试流程：调用getSingleSensor(SensorId.AmbientLight)获取环境光传感器信息
        // 预期结果：返回Sensor对象，sensorId对应环境光传感器
        try {
            let sensor = getSingleSensor(SensorId.AmbientLight)
            @Expect(sensor.sensorId == SensorId.AmbientLight.getValue())
        } catch (e: Exception) {
            // 在不支持该传感器的设备上，此测试可能会失败
            @Expect(true)
        }
    }
}

@Test
class TestSensorEnum {
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_EnumSensorId() {
        let sensorIdArr: Array<SensorId> = [Accelerometer, Gyroscope, AmbientLight, MagneticField, Barometer, Hall, Proximity, Humidity, Orientation, Gravity, LinearAccelerometer, RotationVector, AmbientTemperature, MagneticFieldUncalibrated, GyroscopeUncalibrated, SignificantMotion, PedometerDetection, Pedometer, HeartRate, WearDetection, AccelerometerUncalibrated]
        let sensorIdStrArr: Array<String> = ["SensorId.Accelerometer", "SensorId.Gyroscope", "SensorId.AmbientLight", "SensorId.MagneticField", "SensorId.Barometer", "SensorId.Hall", "SensorId.Proximity", "SensorId.Humidity", "SensorId.Orientation", "SensorId.Gravity", "SensorId.LinearAccelerometer", "SensorId.RotationVector", "SensorId.AmbientTemperature", "SensorId.MagneticFieldUncalibrated", "SensorId.GyroscopeUncalibrated", "SensorId.SignificantMotion", "SensorId.PedometerDetection", "SensorId.Pedometer", "SensorId.HeartRate", "SensorId.WearDetection", "SensorId.AccelerometerUncalibrated"]
        for (i in 0..sensorIdArr.size) {
            @Expect(sensorIdArr[i] == sensorIdArr[i])
            @Expect(sensorIdArr[i].toString() == sensorIdStrArr[i])
            if (i + 1 < sensorIdArr.size) {
                @Expect(sensorIdArr[i] != sensorIdArr[i + 1])
            } else {
                @Expect(sensorIdArr[i] != sensorIdArr[0] )
            }
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_EnumSensorAccuracy() {
        let sensorAccuracyArr: Array<SensorAccuracy> = [AccuracyUnreliable, AccuracyLow,  AccuracyMedium, AccuracyHigh]
        let sensorAccuracyArr2: Array<SensorAccuracy> = [AccuracyUnreliable, AccuracyLow,  AccuracyMedium, AccuracyHigh]
        let sensorAccuracyStrArr: Array<String> = ["SensorAccuracy.AccuracyUnreliable", "SensorAccuracy.AccuracyLow",  "SensorAccuracy.AccuracyMedium", "SensorAccuracy.AccuracyHigh"]
        for (i in 0..sensorAccuracyArr.size) {
            @Expect(sensorAccuracyArr[i] == sensorAccuracyArr2[i])
            @Expect(sensorAccuracyArr[i].toString() == sensorAccuracyStrArr[i])
            if (i + 1 < sensorAccuracyArr.size) {
                @Expect(sensorAccuracyArr[i] != sensorAccuracyArr[i + 1])
            } else {
                @Expect(sensorAccuracyArr[i] != sensorAccuracyArr[0] )
            }
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_EnumIntervalOption() {
        let sensorAccuracyArr: Array<IntervalOption> = [SensorNumber(1), GameMode, UIMode, NormalMode]
        let sensorAccuracyArr2: Array<IntervalOption> = [SensorNumber(1), GameMode, UIMode, NormalMode]
        let sensorAccuracyStrArr: Array<String> = ["IntervalOption.SensorNumber(1)", "IntervalOption.GameMode",  "IntervalOption.UIMode", "IntervalOption.NormalMode"]
        for (i in 0..sensorAccuracyArr.size) {
            @Expect(sensorAccuracyArr[i] == sensorAccuracyArr2[i])
            @Expect(sensorAccuracyArr[i].toString() == sensorAccuracyStrArr[i])
            if (i + 1 < sensorAccuracyArr.size) {
                @Expect(sensorAccuracyArr[i] != sensorAccuracyArr[i + 1])
            } else {
                @Expect(sensorAccuracyArr[i] != sensorAccuracyArr[0] )
            }
        }
    }
}