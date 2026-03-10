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
 * 测试Options和SensorInfoParam类的功能
 */
@Test
class TestSensorOptionsAdd {
    /**
     * 测试Options构造函数 - 默认参数
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_Options_init_default() {
        // 测试流程：使用默认参数调用Options构造函数
        // 预期结果：成功创建Options实例
        try {
            let options = Options()
            @Expect(true)
        } catch(e: BusinessException) {
            failExpect("on failed, ${e}")
        } 
    }

    /**
     * 测试Options构造函数 - GameMode
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_Options_init_GameMode() {
        // 测试流程：使用GameMode调用Options构造函数
        // 预期结果：成功创建Options实例
        try {
            let options = Options(interval: IntervalOption.GameMode)
            @Expect(true)
        } catch(e: BusinessException) {
            failExpect("on failed, ${e}")
        }
    }

    /**
     * 测试Options构造函数 - UIMode
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_Options_init_UIMode() {
        // 测试流程：使用UIMode调用Options构造函数
        // 预期结果：成功创建Options实例
        try {
            let options = Options(interval: IntervalOption.UIMode)
            @Expect(true)
        } catch(e: BusinessException) {
            failExpect("on failed, ${e}")
        }
    }

    /**
     * 测试Options构造函数 - NormalMode
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_Options_init_NormalMode() {
        // 测试流程：使用NormalMode调用Options构造函数
        // 预期结果：成功创建Options实例
        try {
            let options = Options(interval: IntervalOption.NormalMode)
            @Expect(true)
        } catch(e: BusinessException) {
            failExpect("on failed, ${e}")
        }
    }

    /**
     * 测试Options构造函数 - 自定义频率
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_Options_init_SensorNumber() {
        // 测试流程：使用自定义频率调用Options构造函数
        // 预期结果：成功创建Options实例
        try {
            let options = Options(interval: IntervalOption.SensorNumber(100000000))
            @Expect(true)
        } catch(e: BusinessException) {
            failExpect("on failed, ${e}")
        }
    }

    /**
     * 测试Options构造函数 - 带SensorInfoParam
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_Options_init_with_SensorInfoParam() {
        // 测试流程：使用SensorInfoParam调用Options构造函数
        // 预期结果：成功创建Options实例
        try {
            let sensorInfoParam = SensorInfoParam(deviceId: -1, sensorIndex: 0)
            let options = Options(interval: IntervalOption.NormalMode, sensorInfoParam: sensorInfoParam)
            @Expect(true)
        } catch(e: BusinessException) {
            failExpect("on failed, ${e}")
        }
    }

    /**
     * 测试SensorInfoParam构造函数 - 默认参数
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_SensorInfoParam_init_default() {
        // 测试流程：使用默认参数调用SensorInfoParam构造函数
        // 预期结果：成功创建SensorInfoParam实例
        try {
            let sensorInfoParam = SensorInfoParam()
            @Expect(true)
        } catch(e: BusinessException) {
            failExpect("on failed, ${e}")
        }
    }

    /**
     * 测试SensorInfoParam构造函数 - 本地设备默认传感器
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_SensorInfoParam_init_local_default() {
        // 测试流程：使用deviceId=-1, sensorIndex=0调用SensorInfoParam构造函数
        // 预期结果：成功创建SensorInfoParam实例
        try {
            let sensorInfoParam = SensorInfoParam(deviceId: -1, sensorIndex: 0)
            @Expect(true)
        } catch(e: BusinessException) {
            failExpect("on failed, ${e}")
        }
    }

    /**
     * 测试SensorInfoParam构造函数 - 特定设备ID
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_SensorInfoParam_init_specific_device() {
        // 测试流程：使用deviceId=0调用SensorInfoParam构造函数
        // 预期结果：成功创建SensorInfoParam实例
        try {
            let sensorInfoParam = SensorInfoParam(deviceId: 0, sensorIndex: 0)
            @Expect(true)
        } catch(e: BusinessException) {
            failExpect("on failed, ${e}")
        }
    }
}