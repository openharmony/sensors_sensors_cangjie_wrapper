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


// 显著运动传感器回调
class SignificantMotionCallback <: Callback1Argument<SignificantMotionResponse> {
    public var invoked: Bool = false
    public var response: ?SignificantMotionResponse = None

    public func invoke(err: ?BusinessException, data: SignificantMotionResponse): Unit {
        invoked = true
        response = data
    }
}

// 计步器检测传感器回调
class PedometerDetectionCallback <: Callback1Argument<PedometerDetectionResponse> {
    public var invoked: Bool = false
    public var response: ?PedometerDetectionResponse = None

    public func invoke(err: ?BusinessException, data: PedometerDetectionResponse): Unit {
        invoked = true
        response = data
    }
}

// 穿戴检测传感器回调
class WearDetectionCallback <: Callback1Argument<WearDetectionResponse> {
    public var invoked: Bool = false
    public var response: ?WearDetectionResponse = None

    public func invoke(err: ?BusinessException, data: WearDetectionResponse): Unit {
        invoked = true
        response = data
    }
}

/**
 * 测试特殊类型的传感器
 */
@Test
class TestSensorSpecialTypesAdd {
    /**
     * 测试显著运动传感器列表获取
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_getSingleSensor_sensorType_SignificantMotion() {
        try {
            let sensor = getSingleSensor(SensorId.SignificantMotion)
            @Expect(sensor.sensorId == SensorId.SignificantMotion.getValue())
        } catch (e: BusinessException) {
            failExpect("on failed, ${e}")
            @Expect(true)
        }
    }

    /**
     * 测试计步器检测传感器列表获取
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_getSingleSensor_sensorType_PedometerDetection() {
        try {
            let sensor = getSingleSensor(SensorId.PedometerDetection)
            @Expect(sensor.sensorId == SensorId.PedometerDetection.getValue())
        } catch (e: BusinessException) {
            failExpect("on failed, ${e}")
        }
    }

    /**
     * 测试穿戴检测传感器列表获取
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_getSingleSensor_sensorType_WearDetection() {
        try {
            let sensor = getSingleSensor(SensorId.WearDetection)
            @Expect(sensor.sensorId == SensorId.WearDetection.getValue())
        } catch (e: BusinessException) {
            failExpect("on failed, ${e}")
            @Expect(true)
        }
    }

    /**
     * 测试显著运动传感器订阅
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_on_sensorType_SignificantMotion() {
        let callback = SignificantMotionCallback()
        try {
            on(SensorId.SignificantMotion, callback)
            off(SensorId.SignificantMotion)
            @Expect(true)
        } catch (e: BusinessException) {
            failExpect("on failed, ${e}")
        }
    }

    /**
     * 测试计步器检测传感器订阅
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_on_sensorType_PedometerDetection() {
        let callback = PedometerDetectionCallback()
        try {
            on(SensorId.PedometerDetection, callback)
            off(SensorId.PedometerDetection)
            @Expect(true)
        } catch (e: BusinessException) {
            failExpect("on failed, ${e}")
        }
    }

    /**
     * 测试穿戴检测传感器订阅
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_on_sensorType_WearDetection() {
        let callback = WearDetectionCallback()
        try {
            on(SensorId.WearDetection, callback)
            off(SensorId.WearDetection)
            @Expect(true)
        } catch (e: BusinessException) {
            failExpect("on failed, ${e}")
        }
    }

    /**
     * 测试显著运动传感器单次获取
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_once_sensorType_SignificantMotion() {
        let callback = SignificantMotionCallback()
        try {
            once(SensorId.SignificantMotion, callback)
            @Expect(true)
        } catch (e: BusinessException) {
            failExpect("on failed, ${e}")
        }
    }

    /**
     * 测试计步器检测传感器单次获取
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_once_sensorType_PedometerDetection() {
        let callback = PedometerDetectionCallback()
        try {
            once(SensorId.PedometerDetection, callback)
            @Expect(true)
        } catch (e: BusinessException) {
            failExpect("on failed, ${e}")
        }
    }

    /**
     * 测试穿戴检测传感器单次获取
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_once_sensorType_WearDetection() {
        let callback = WearDetectionCallback()
        try {
            once(SensorId.WearDetection, callback)
            @Expect(true)
        } catch (e: BusinessException) {
            failExpect("on failed, ${e}")
        }
    }
}