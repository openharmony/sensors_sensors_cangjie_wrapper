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
 * 测试未校准传感器类型
 */
@Test
class TestSensorUncalibratedAdd {
    /**
     * 测试未校准加速度传感器列表获取
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_getSingleSensor_sensorType_AccelerometerUncalibrated() {
        try {
            let sensor = getSingleSensor(SensorId.AccelerometerUncalibrated)
            @Expect(sensor.sensorId == SensorId.AccelerometerUncalibrated.getValue())
        } catch (e: BusinessException) {
            failExpect("on failed, ${e}")
            @Expect(false)
        }
    }

    /**
     * 测试未校准陀螺仪传感器列表获取
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_getSingleSensor_sensorType_GyroscopeUncalibrated() {
        try {
            let sensor = getSingleSensor(SensorId.GyroscopeUncalibrated)
            @Expect(sensor.sensorId == SensorId.GyroscopeUncalibrated.getValue())
        } catch (e: BusinessException) {
            failExpect("on failed, ${e}")
            @Expect(false)
        }
    }

    /**
     * 测试未校准磁场传感器列表获取
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_getSingleSensor_sensorType_MagneticFieldUncalibrated() {
        try {
            let sensor = getSingleSensor(SensorId.MagneticFieldUncalibrated)
            @Expect(sensor.sensorId == SensorId.MagneticFieldUncalibrated.getValue())
        } catch (e: BusinessException) {
            failExpect("on failed, ${e}")
            @Expect(false)
        }
    }

}