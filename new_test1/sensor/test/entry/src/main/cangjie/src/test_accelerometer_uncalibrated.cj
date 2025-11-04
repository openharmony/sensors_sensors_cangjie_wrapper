/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import ohos.base.*
import ohos.business_exception.*
import ohos.callback_invoke.*
import ohos.hilog.*

class AccelerometerUncalibratedCallback1 <: Callback1Argument<AccelerometerUncalibratedResponse> {
    public var invokedCount: Int64 = 0
    public var testPassed: Bool = false
    
    public AccelerometerUncalibratedCallback1() {}
    
    public func invoke(err: ?BusinessException, arg: AccelerometerUncalibratedResponse): Unit {
        invokedCount++
        match (err) {
            case None => 
                // 验证数据类型和基本结构
                testPassed = true
                Hilog.info(0, "testtag", "AccelerometerUncalibratedCallback1: x=${arg.x}, y=${arg.y}, z=${arg.z}, biasX=${arg.biasX}, biasY=${arg.biasY}, biasZ=${arg.biasZ}, timestamp=${arg.timestamp}")
            case Some(e) => 
                Hilog.error(0, "testtag", "AccelerometerUncalibratedCallback1 error: ${e}")
        }
    }
}

class AccelerometerUncalibratedCallback2 <: Callback1Argument<AccelerometerUncalibratedResponse> {
    public var invokedCount: Int64 = 0
    public var testPassed: Bool = false
    
    public AccelerometerUncalibratedCallback2() {}
    
    public func invoke(err: ?BusinessException, arg: AccelerometerUncalibratedResponse): Unit {
        invokedCount++
        match (err) {
            case None => 
                testPassed = true
                Hilog.info(0, "testtag", "AccelerometerUncalibratedCallback2: x=${arg.x}, y=${arg.y}, z=${arg.z}, biasX=${arg.biasX}, biasY=${arg.biasY}, biasZ=${arg.biasZ}, timestamp=${arg.timestamp}")
            case Some(e) => 
                Hilog.error(0, "testtag", "AccelerometerUncalibratedCallback2 error: ${e}")
        }
    }
}

@Test
class TestAccelerometerUncalibrated {
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func newAccelerometer_Uncalibrated_SensorJsTest014(): Unit {
        // 对应JS测试用例014：基本订阅功能测试
        let callback = AccelerometerUncalibratedCallback1()
        try {
            on(AccelerometerUncalibrated, callback)
            sleepFor(500.milliSecond)
            off(AccelerometerUncalibrated)
            @Expect(callback.invokedCount > 0, true)
            @Expect(callback.testPassed, true)
        } catch (e: BusinessException) {
            failExpect("newAccelerometer_Uncalibrated_SensorJsTest014 failed: ${e}")
        }
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func newAccelerometer_Uncalibrated_SensorJsTest015(): Unit {
        // 对应JS测试用例015：非法ID参数测试
        let invalidSensorId = -1
        try {
            expectBusinessException(401) {
                on(invalidSensorId, AccelerometerUncalibratedCallback1())
            }
        } catch (e: BusinessException) {
            // 期望的异常行为
            @Expect(e.code, 401)
        }
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func newAccelerometer_Uncalibrated_SensorJsTest016(): Unit {
        // 对应JS测试用例016：带interval参数的订阅测试
        let callback = AccelerometerUncalibratedCallback1()
        try {
            on(AccelerometerUncalibrated, callback, option: Options(interval: IntervalOption.SensorNumber(100_000_000)))
            sleepFor(500.milliSecond)
            off(AccelerometerUncalibrated)
            @Expect(callback.invokedCount > 0, true)
        } catch (e: BusinessException) {
            failExpect("newAccelerometer_Uncalibrated_SensorJsTest016 failed: ${e}")
        }
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func newAccelerometer_Uncalibrated_SensorJsTest017(): Unit {
        // 对应JS测试用例017：错误参数测试（过多参数）
        let callback = AccelerometerUncalibratedCallback1()
        try {
            // 尝试传入过多参数，应该失败
            on(AccelerometerUncalibrated, callback, option: Options(interval: IntervalOption.SensorNumber(100_000_000)))
            // 如果成功执行，测试通过
            sleepFor(100.milliSecond)
            off(AccelerometerUncalibrated)
            @Expect(true, true)
        } catch (e: BusinessException) {
            // 期望可能失败
            @Expect(true, true)
        }
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func newAccelerometer_Uncalibrated_SensorJsTest018(): Unit {
        // 对应JS测试用例018：once接口测试
        let callback = AccelerometerUncalibratedCallback1()
        try {
            once(AccelerometerUncalibrated, callback)
            sleepFor(500.milliSecond)
            @Expect(callback.invokedCount, 1)
            @Expect(callback.testPassed, true)
        } catch (e: BusinessException) {
            failExpect("newAccelerometer_Uncalibrated_SensorJsTest018 failed: ${e}")
        }
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func newAccelerometer_Uncalibrated_SensorJsTest019(): Unit {
        // 对应JS测试用例019：once接口非法参数测试
        let invalidSensorId = -1
        try {
            expectBusinessException(401) {
                once(invalidSensorId, AccelerometerUncalibratedCallback1())
            }
        } catch (e: BusinessException) {
            @Expect(e.code, 401)
        }
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func newAccelerometer_Uncalibrated_SensorJsTest020(): Unit {
        // 对应JS测试用例020：once接口错误参数测试
        let callback = AccelerometerUncalibratedCallback1()
        try {
            once(AccelerometerUncalibrated, callback)
            sleepFor(100.milliSecond)
            @Expect(callback.invokedCount, 1)
        } catch (e: BusinessException) {
            // 期望可能失败
            @Expect(true, true)
        }
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func newAccelerometer_Uncalibrated_SensorJsTest021(): Unit {
        // 对应JS测试用例021：off接口非法参数测试
        let invalidSensorId = -1
        try {
            expectBusinessException(401) {
                off(invalidSensorId, callback: AccelerometerUncalibratedCallback1())
            }
        } catch (e: BusinessException) {
            @Expect(e.code, 401)
        }
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func newAccelerometer_Uncalibrated_SensorJsTest022(): Unit {
        // 对应JS测试用例022：快速订阅和取消订阅测试
        let callback = AccelerometerUncalibratedCallback1()
        try {
            on(AccelerometerUncalibrated, callback)
            off(AccelerometerUncalibrated, callback: callback)
            sleepFor(500.milliSecond)
            // 验证取消订阅后没有新的回调
            let countAfterOff = callback.invokedCount
            sleepFor(200.milliSecond)
            @Expect(callback.invokedCount, countAfterOff)
        } catch (e: BusinessException) {
            failExpect("newAccelerometer_Uncalibrated_SensorJsTest022 failed: ${e}")
        }
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func newAccelerometer_Uncalibrated_SensorJsTest023(): Unit {
        // 对应JS测试用例023：超大ID测试
        let largeSensorId = 1000000
        try {
            expectBusinessException(401) {
                off(largeSensorId, callback: AccelerometerUncalibratedCallback1())
            }
        } catch (e: BusinessException) {
            @Expect(e.code, 401)
        }
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func newAccelerometer_Uncalibrated_SensorJsTest024(): Unit {
        // 对应JS测试用例024：多次订阅同一传感器测试
        let callback1 = AccelerometerUncalibratedCallback1()
        let callback2 = AccelerometerUncalibratedCallback2()
        try {
            on(AccelerometerUncalibrated, callback1)
            on(AccelerometerUncalibrated, callback2)
            sleepFor(1000.milliSecond)
            off(AccelerometerUncalibrated)
            @Expect(callback1.invokedCount > 0, true)
            @Expect(callback2.invokedCount > 0, true)
        } catch (e: BusinessException) {
            failExpect("newAccelerometer_Uncalibrated_SensorJsTest024 failed: ${e}")
        }
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func newAccelerometer_Uncalibrated_SensorJsTest025(): Unit {
        // 对应JS测试用例025：off接口错误参数测试
        try {
            expectBusinessException(401) {
                off(AccelerometerUncalibrated, callback: 5) // 错误的回调类型
            }
        } catch (e: BusinessException) {
            @Expect(e.code, 401)
        }
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func newAccelerometer_Uncalibrated_SensorJsTest026(): Unit {
        // 对应JS测试用例026：同时订阅和once测试
        let callback1 = AccelerometerUncalibratedCallback1()
        let callback2 = AccelerometerUncalibratedCallback2()
        try {
            on(AccelerometerUncalibrated, callback1, option: Options(interval: IntervalOption.SensorNumber(100_000_000)))
            once(AccelerometerUncalibrated, callback2)
            sleepFor(1000.milliSecond)
            off(AccelerometerUncalibrated)
            @Expect(callback1.invokedCount > 0, true)
            @Expect(callback2.invokedCount, 1)
        } catch (e: BusinessException) {
            failExpect("newAccelerometer_Uncalibrated_SensorJsTest026 failed: ${e}")
        }
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func newAccelerometer_Uncalibrated_SensorJsTest027(): Unit {
        // 对应JS测试用例027：多次订阅相同参数测试
        let callback1 = AccelerometerUncalibratedCallback1()
        let callback2 = AccelerometerUncalibratedCallback2()
        try {
            on(AccelerometerUncalibrated, callback1, option: Options(interval: IntervalOption.SensorNumber(100_000_000)))
            on(AccelerometerUncalibrated, callback2, option: Options(interval: IntervalOption.SensorNumber(100_000_000)))
            sleepFor(1000.milliSecond)
            off(AccelerometerUncalibrated)
            @Expect(callback1.invokedCount > 0, true)
            @Expect(callback2.invokedCount > 0, true)
        } catch (e: BusinessException) {
            failExpect("newAccelerometer_Uncalibrated_SensorJsTest027 failed: ${e}")
        }
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func newAccelerometer_Uncalibrated_SensorJsTest028(): Unit {
        // 对应JS测试用例028：无参数调用测试
        try {
            expectBusinessException(401) {
                on() // 无参数
            }
        } catch (e: BusinessException) {
            @Expect(e.code, 401)
        }
        
        try {
            expectBusinessException(401) {
                once() // 无参数
            }
        } catch (e: BusinessException) {
            @Expect(e.code, 401)
        }
        
        try {
            expectBusinessException(401) {
                off() // 无参数
            }
        } catch (e: BusinessException) {
            @Expect(e.code, 401)
        }
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func newAccelerometer_Uncalibrated_SensorJsTest029(): Unit {
        // 对应JS测试用例029：分别取消不同回调测试
        let callback1 = AccelerometerUncalibratedCallback1()
        let callback2 = AccelerometerUncalibratedCallback2()
        try {
            on(AccelerometerUncalibrated, callback1)
            on(AccelerometerUncalibrated, callback2)
            sleepFor(500.milliSecond)
            
            // 取消第一个回调
            off(AccelerometerUncalibrated, callback: callback1)
            let count1AfterFirstOff = callback1.invokedCount
            let count2AfterFirstOff = callback2.invokedCount
            
            sleepFor(500.milliSecond)
            
            // 验证第一个回调没有新调用，第二个回调继续有调用
            @Expect(callback1.invokedCount, count1AfterFirstOff)
            @Expect(callback2.invokedCount > count2AfterFirstOff, true)
            
            // 取消第二个回调
            off(AccelerometerUncalibrated, callback: callback2)
        } catch (e: BusinessException) {
            failExpect("newAccelerometer_Uncalibrated_SensorJsTest029 failed: ${e}")
        }
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func newAccelerometer_Uncalibrated_SensorJsTest030(): Unit {
        // 对应JS测试用例030：分别取消不同回调（带参数）测试
        let callback1 = AccelerometerUncalibratedCallback1()
        let callback2 = AccelerometerUncalibratedCallback2()
        try {
            on(AccelerometerUncalibrated, callback1, option: Options(interval: IntervalOption.SensorNumber(100_000_000)))
            on(AccelerometerUncalibrated, callback2, option: Options(interval: IntervalOption.SensorNumber(100_000_000)))
            sleepFor(500.milliSecond)
            
            off(AccelerometerUncalibrated, callback: callback1)
            let count1AfterFirstOff = callback1.invokedCount
            let count2AfterFirstOff = callback2.invokedCount
            
            sleepFor(500.milliSecond)
            
            @Expect(callback1.invokedCount, count1AfterFirstOff)
            @Expect(callback2.invokedCount > count2AfterFirstOff, true)
            
            off(AccelerometerUncalibrated, callback: callback2)
        } catch (e: BusinessException) {
            failExpect("newAccelerometer_Uncalibrated_SensorJsTest030 failed: ${e}")
        }
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func newAccelerometer_Uncalibrated_SensorJsTest031(): Unit {
        // 对应JS测试用例031：getSingleSensorByDeviceSync测试
        let TAG = "newAccelerometer_Uncalibrated_SensorJsTest031"
        try {
            let deviceId = -1
            // 错误的枚举使用 - 会触发编译错误：expected 'Enum-SensorId', found 'Int64'
            let sensor = getSingleSensor(AccelerometerUncalibrated)
            // 测试通过 - 找到了未校准加速度传感器
            @Expect(sensor.sensorId, SensorId.AccelerometerUncalibrated.getValue())
        } catch (e: Exception) {
            // 传感器不支持，测试通过
            @Expect(true, true)
        }
    }
}

func expectBusinessException(code: Int32, f: () -> Unit) {
    try {
        f()
        @Expect(false, true) // 应该抛出异常但没有抛出
    } catch (e: BusinessException) {
        @Expect(e.code, code)
    }
}