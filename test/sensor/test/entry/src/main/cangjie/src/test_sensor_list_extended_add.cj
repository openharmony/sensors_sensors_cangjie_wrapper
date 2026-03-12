/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

package ohos_app_cangjie_entry

import std.unittest.testmacro.*
import std.sync.*
import std.time.*
import kit.BasicServicesKit.*
import kit.SensorServiceKit.*
//import kit.AccountKit.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import ohos.base.*
import ohos.business_exception.*
import ohos.callback_invoke.*
import ohos.hilog.*


/**
 * 扩展传感器列表测试，覆盖更多传感器类型
 */
@Test
class TestSensorListExtendedAdd {
    /**
     * 测试获取磁场传感器信息
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_getSingleSensor_sensorType_MagneticField() {
        // 测试流程：调用getSingleSensor(SensorId.MagneticField)获取磁场传感器信息
        // 预期结果：返回Sensor对象，sensorId对应磁场传感器
        try {
            let sensor = getSingleSensor(SensorId.MagneticField)
            @Expect(sensor.sensorId == SensorId.MagneticField.getValue())
        } catch (e: BusinessException) {
            // 在不支持该传感器的设备上，此测试可能会失败
            failExpect("on failed, ${e}")
            @Expect(false)
        }
    }

    /**
     * 测试获取气压传感器信息
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_getSingleSensor_sensorType_Barometer() {
        // 测试流程：调用getSingleSensor(SensorId.Barometer)获取气压传感器信息
        // 预期结果：返回Sensor对象，sensorId对应气压传感器
        try {
            let sensor = getSingleSensor(SensorId.Barometer)
            @Expect(sensor.sensorId == SensorId.Barometer.getValue())
        } catch (e: BusinessException) {
            // 在不支持该传感器的设备上，此测试可能会失败
            failExpect("on failed, ${e}")
            @Expect(false)
        }
    }

    /**
     * 测试获取霍尔传感器信息
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_getSingleSensor_sensorType_Hall() {
        // 测试流程：调用getSingleSensor(SensorId.Hall)获取霍尔传感器信息
        // 预期结果：返回Sensor对象，sensorId对应霍尔传感器
        try {
            let sensor = getSingleSensor(SensorId.Hall)
            @Expect(sensor.sensorId == SensorId.Hall.getValue())
        } catch (e: BusinessException) {
            // 在不支持该传感器的设备上，此测试可能会失败
            failExpect("on failed, ${e}")
            @Expect(false)
        }
    }

    /**
     * 测试获取重力传感器信息
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_getSingleSensor_sensorType_Gravity() {
        // 测试流程：调用getSingleSensor(SensorId.Gravity)获取重力传感器信息
        // 预期结果：返回Sensor对象，sensorId对应重力传感器
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId == SensorId.Gravity.getValue())
        } catch (e: BusinessException) {
            // 在不支持该传感器的设备上，此测试可能会失败
            failExpect("on failed, ${e}")
            @Expect(false)
        }
    }

    /**
     * 测试获取线性加速度传感器信息
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_getSingleSensor_sensorType_LinearAccelerometer() {
        // 测试流程：调用getSingleSensor(SensorId.LinearAccelerometer)获取线性加速度传感器信息
        // 预期结果：返回Sensor对象，sensorId对应线性加速度传感器
        try {
            let sensor = getSingleSensor(SensorId.LinearAccelerometer)
            @Expect(sensor.sensorId == SensorId.LinearAccelerometer.getValue())
        } catch (e: BusinessException) {
            // 在不支持该传感器的设备上，此测试可能会失败
            failExpect("on failed, ${e}")
            @Expect(false)
        }
    }

    /**
     * 测试获取旋转矢量传感器信息
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_getSingleSensor_sensorType_RotationVector() {
        // 测试流程：调用getSingleSensor(SensorId.RotationVector)获取旋转矢量传感器信息
        // 预期结果：返回Sensor对象，sensorId对应旋转矢量传感器
        try {
            let sensor = getSingleSensor(SensorId.RotationVector)
            @Expect(sensor.sensorId == SensorId.RotationVector.getValue())
        } catch (e: BusinessException) {
            // 在不支持该传感器的设备上，此测试可能会失败
            failExpect("on failed, ${e}")
            @Expect(false)
        }
    }

    /**
     * 测试获取接近传感器信息
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_getSingleSensor_sensorType_Proximity() {
        // 测试流程：调用getSingleSensor(SensorId.Proximity)获取接近传感器信息
        // 预期结果：返回Sensor对象，sensorId对应接近传感器
        try {
            let sensor = getSingleSensor(SensorId.Proximity)
            @Expect(sensor.sensorId == SensorId.Proximity.getValue())
        } catch (e: BusinessException) {
            // 在不支持该传感器的设备上，此测试可能会失败
            failExpect("on failed, ${e}")
            @Expect(false)
        }
    }

    /**
     * 测试获取方向传感器信息
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_getSingleSensor_sensorType_Orientation() {
        // 测试流程：调用getSingleSensor(SensorId.Orientation)获取方向传感器信息
        // 预期结果：返回Sensor对象，sensorId对应方向传感器
        try {
            let sensor = getSingleSensor(SensorId.Orientation)
            @Expect(sensor.sensorId == SensorId.Orientation.getValue())
        } catch (e: BusinessException) {
            // 在不支持该传感器的设备上，此测试可能会失败
            failExpect("on failed, ${e}")
            @Expect(false)
        }
    }
}