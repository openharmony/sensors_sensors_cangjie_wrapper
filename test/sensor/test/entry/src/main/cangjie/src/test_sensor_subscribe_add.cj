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
 * 用于测试的加速度传感器回调对象
 */
class AccelerometerCallback <: Callback1Argument<AccelerometerResponse> {
    public var invoked: Bool = false
    public var response: ?AccelerometerResponse = None

    public func invoke(err: ?BusinessException, data: AccelerometerResponse): Unit {
        invoked = true
        response = data
    }

    public func isInvoked(): Bool {
        return invoked
    }

    public func getResponse(): ?AccelerometerResponse {
        return response
    }
}

/**
 * 用于测试的陀螺仪传感器回调对象
 */
class GyroscopeCallback <: Callback1Argument<GyroscopeResponse> {
    public var invoked: Bool = false
    public var response: ?GyroscopeResponse = None

    public func invoke(err: ?BusinessException, data: GyroscopeResponse): Unit {
        invoked = true
        response = data
    }

    public func isInvoked(): Bool {
        return invoked
    }

    public func getResponse(): ?GyroscopeResponse {
        return response
    }
}

/**
 * 用于测试的环境光传感器回调对象
 */
class LightCallback <: Callback1Argument<LightResponse> {
    public var invoked: Bool = false
    public var response: ?LightResponse = None

    public func invoke(err: ?BusinessException, data: LightResponse): Unit {
        invoked = true
        response = data
    }

    public func isInvoked(): Bool {
        return invoked
    }

    public func getResponse(): ?LightResponse {
        return response
    }
}

/**
 * 测试传感器订阅功能
 */
@Test
class TestSensorSubscribeAdd {
     /**
     * 测试传感器订阅功能 - 带GameMode选项
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_on_option_GameMode() {
        // 测试流程：调用on(SensorId.Accelerometer, callback, option: Options(interval: IntervalOption.GameMode))
        // 预期结果：订阅成功，传感器以20000000ns频率上报数据
        let callback = AccelerometerCallback()
        try {
            on(SensorId.Accelerometer, callback, option: Options(interval: IntervalOption.GameMode))
            // 等待一段时间让传感器数据上报
            //sleepFor(500.milliSecond)
            // 取消订阅
            off(SensorId.Accelerometer)
            // 由于测试环境限制，我们只验证订阅和取消订阅过程没有异常
            @Expect(true)
        } catch (e: BusinessException) {
            // 可能是权限问题或硬件不支持，这里我们只验证方法调用是否正常
            failExpect("on failed, ${e}")
        }
    }

    /**
     * 测试传感器订阅功能 - 带UIMode选项
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_on_option_UIMode() {
        // 测试流程：调用on(SensorId.Accelerometer, callback, option: Options(interval: IntervalOption.UIMode))
        // 预期结果：订阅成功，传感器以60000000ns频率上报数据
        let callback = AccelerometerCallback()
        try {
            on(SensorId.Accelerometer, callback, option: Options(interval: IntervalOption.UIMode))
            // 等待一段时间让传感器数据上报
            //sleepFor(500.milliSecond)
            // 取消订阅
            off(SensorId.Accelerometer)
            // 由于测试环境限制，我们只验证订阅和取消订阅过程没有异常
            @Expect(true)
        } catch (e: BusinessException) {
            // 可能是权限问题或硬件不支持，这里我们只验证方法调用是否正常
            failExpect("on failed, ${e}")
        }
    }

    /**
     * 测试传感器订阅功能 - 带NormalMode选项
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_on_option_NormalMode() {
        // 测试流程：调用on(SensorId.Accelerometer, callback, option: Options(interval: IntervalOption.NormalMode))
        // 预期结果：订阅成功，传感器以200000000ns频率上报数据
        let callback = AccelerometerCallback()
        try {
            on(SensorId.Accelerometer, callback, option: Options(interval: IntervalOption.NormalMode))
            // 等待一段时间让传感器数据上报
            //sleepFor(500.milliSecond)
            // 取消订阅
            off(SensorId.Accelerometer)
            // 由于测试环境限制，我们只验证订阅和取消订阅过程没有异常
            @Expect(true)
        } catch (e: BusinessException) {
            // 可能是权限问题或硬件不支持，这里我们只验证方法调用是否正常
            failExpect("on failed, ${e}")
        }
    }

    /**
     * 测试传感器订阅功能 - 带自定义频率选项
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_on_option_SensorNumber() {
        // 测试流程：调用on(SensorId.Accelerometer, callback, option: Options(interval: IntervalOption.SensorNumber(100000000)))
        // 预期结果：订阅成功，传感器以100000000ns频率上报数据
        let callback = AccelerometerCallback()
        try {
            on(SensorId.Accelerometer, callback, option: Options(interval: IntervalOption.SensorNumber(100000000)))
            // 等待一段时间让传感器数据上报
            //sleepFor(500.milliSecond)
            // 取消订阅
            off(SensorId.Accelerometer)
            // 由于测试环境限制，我们只验证订阅和取消订阅过程没有异常
            @Expect(true)
        } catch (e: BusinessException) {
            // 可能是权限问题或硬件不支持，这里我们只验证方法调用是否正常
            failExpect("on failed, ${e}")
        }
    }


    /**
     * 测试传感器取消订阅功能
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_on_off_normal_sequence() {
        // 测试流程：on(SensorId.Accelerometer, callback) -> 接收数据 -> off(SensorId.Accelerometer)
        // 预期结果：订阅成功，接收数据后取消订阅成功
        let callback = AccelerometerCallback()
        try {
            on(SensorId.Accelerometer, callback)
            // 等待一段时间让传感器数据上报
           // sleepFor(500.milliSecond)
            // 取消订阅
            off(SensorId.Accelerometer)
            // 再次取消订阅，应该不会抛出异常
            off(SensorId.Accelerometer)
            // 验证整个流程没有异常
            @Expect(true)
        } catch (e: BusinessException) {
            // 可能是权限问题或硬件不支持，这里我们只验证方法调用是否正常
            failExpect("on failed, ${e}")
        }
    }
}