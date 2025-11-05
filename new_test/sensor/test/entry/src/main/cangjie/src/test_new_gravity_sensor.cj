/*
 * Copyright (C) 2023-2024 Huawei Device Co., Ltd.
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
import kit.SensorServiceKit.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import ohos.base.*
import ohos.business_exception.*
import ohos.callback_invoke.*
import ohos.hilog.*

class GravitySensorCallback <: Callback1Argument<GravityResponse> {
    public var invokedCount: Int64 = 0
    public var lastData: ?GravityResponse = None
    
    public GravitySensorCallback() {}
    
    public func invoke(err: ?BusinessException, arg: GravityResponse): Unit {
        invokedCount++
        lastData = Some(arg)
        Hilog.info(0, "testtag", "GravitySensorCallback execute: x=${arg.x}, y=${arg.y}, z=${arg.z}, accuracy=${arg.accuracy}, timestamp=${arg.timestamp}")
    }
}

@Test
class TestNewGravitySensor {
    private let PARAMETER_ERROR_CODE = 401
    private let SERVICE_EXCEPTION_CODE = 14500101
    private let SENSOR_NO_SUPPORT_CODE = 14500102
    private let INVALID_SENSOR_ID = -1
    
    private let DEFAULT_TEST_DURATION = 500.milliSecond
    private let LONG_TEST_DURATION = 1000.milliSecond
    private let CUSTOM_INTERVAL = 100000000
    private let INVALID_INTERVAL = -100000000
    
    private func logTestStart(testName: String): Unit {
        Hilog.info(0, testName, "---------${testName}--------------")
    }
    
    private func logTestOff(testName: String): Unit {
        Hilog.info(0, testName, "---------${testName} off in--------------")
        Hilog.info(0, testName, "---------${testName} off end--------------")
    }
    
    private func handleSensorNotSupported(testName: String, e: BusinessException): Unit {
        Hilog.info(0, testName, "fail, errCode:${e.code} ,msg:${e.message}")
        @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
    }
    
    private func executeBasicGravityTest(testName: String, testLogic: (GravitySensorCallback) -> Unit): Unit {
        logTestStart(testName)
        let callback = GravitySensorCallback()
        
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            testLogic(callback)
            @Expect(true)
        } catch (e: BusinessException) {
            handleSensorNotSupported(testName, e)
        }
    }
    
    private func executeGravityTestWithValidation(testName: String, testLogic: (GravitySensorCallback, Sensor) -> Unit): Unit {
        logTestStart(testName)
        let callback = GravitySensorCallback()
        
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            testLogic(callback, sensor)
            @Expect(true)
        } catch (e: BusinessException) {
            handleSensorNotSupported(testName, e)
        }
    }
    
    private func executeParameterErrorTest(testName: String, testLogic: () -> Unit): Unit {
        logTestStart(testName)
        
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            expectBusinessException(PARAMETER_ERROR_CODE) {
                testLogic()
            }
        } catch (e: BusinessException) {
            handleSensorNotSupported(testName, e)
        }
    }
    
    private func executeServiceExceptionTest(testName: String, testLogic: () -> Unit): Unit {
        logTestStart(testName)
        
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            expectBusinessException(SERVICE_EXCEPTION_CODE) {
                testLogic()
            }
        } catch (e: BusinessException) {
            handleSensorNotSupported(testName, e)
        }
    }
    
    private func executeMultiCallbackTest(testName: String, testLogic: () -> Unit): Unit {
        logTestStart(testName)
        
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            testLogic()
            
            sleepFor(LONG_TEST_DURATION)
            logTestOff(testName)
            @Expect(true)
        } catch (e: BusinessException) {
            handleSensorNotSupported(testName, e)
        }
    }
    
    private func createAccuracyValidatingCallback(testName: String): (GravityResponse) -> Unit {
        return { data: GravityResponse =>
            Hilog.info(0, testName, "Callback in! x=${data.x}, y=${data.y}, z=${data.z}")
            @Expect(data.accuracy >= AccuracyUnreliable.getValue() && data.accuracy <= AccuracyHigh.getValue())
        }
    }
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testNewGravitySensor001(): Unit {
        executeBasicGravityTest("newGravity_SensorJsTest001") { callback =>
            on(Gravity, callback)
            sleepFor(DEFAULT_TEST_DURATION)
            off(Gravity)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor002(): Unit {
        executeBasicGravityTest("newGravity_SensorJsTest002") { callback =>
            on(Gravity, callback)
            sleepFor(DEFAULT_TEST_DURATION)
            off(Gravity)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor003(): Unit {
        executeParameterErrorTest("newGravity_SensorJsTest003") {
            let callback = GravitySensorCallback()
            on(INVALID_SENSOR_ID, callback)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor004(): Unit {
        executeGravityTestWithValidation("newGravity_SensorJsTest004") { callback, sensor =>
            on(Gravity, callback, option: Options(interval: IntervalOption.SensorNumber(CUSTOM_INTERVAL)))
            sleepFor(DEFAULT_TEST_DURATION)
            logTestOff("newGravity_SensorJsTest004")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor005(): Unit {
        executeGravityTestWithValidation("newGravity_SensorJsTest005") { callback, sensor =>
            on(Gravity, callback, option: Options(interval: IntervalOption.SensorNumber(CUSTOM_INTERVAL)), samplingPeriodCount: 5)
            sleepFor(DEFAULT_TEST_DURATION)
            logTestOff("newGravity_SensorJsTest005")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor006(): Unit {
        executeGravityTestWithValidation("newGravity_SensorJsTest006") { callback, sensor =>
            once(Gravity, callback)
            sleepFor(DEFAULT_TEST_DURATION)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor007(): Unit {
        executeParameterErrorTest("newGravity_SensorJsTest007") {
            let callback = GravitySensorCallback()
            once(INVALID_SENSOR_ID, callback)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor008(): Unit {
        executeGravityTestWithValidation("newGravity_SensorJsTest008") { callback, sensor =>
            once(Gravity, callback, samplingPeriodCount: 5)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor009(): Unit {
        executeParameterErrorTest("newGravity_SensorJsTest009") {
            let callback = GravitySensorCallback()
            off(INVALID_SENSOR_ID, callback: callback)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor010(): Unit {
        executeGravityTestWithValidation("newGravity_SensorJsTest010") { callback, sensor =>
            on(Gravity, callback)
            sleepFor(DEFAULT_TEST_DURATION)
            off(Gravity, callback: callback)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor011(): Unit {
        executeParameterErrorTest("newGravity_SensorJsTest011") {
            let callback = GravitySensorCallback()
            off(1000000, callback: callback)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor012(): Unit {
        executeMultiCallbackTest("newGravity_SensorJsTest012") {
            on(Gravity, createAccuracyValidatingCallback("newGravity_SensorJsTest012"))
            on(Gravity, createAccuracyValidatingCallback("newGravity_SensorJsTest012"))
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testNewGravitySensor013(): Unit {
        executeParameterErrorTest("newGravity_SensorJsTest013") {
            let callback = GravitySensorCallback()
            off(Gravity, 5)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor014(): Unit {
        executeMultiCallbackTest("newGravity_SensorJsTest014") {
            on(Gravity, createAccuracyValidatingCallback("newGravity_SensorJsTest014"), 
               option: Options(interval: IntervalOption.SensorNumber(CUSTOM_INTERVAL)))
            once(Gravity, createAccuracyValidatingCallback("newGravity_SensorJsTest014"))
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor015(): Unit {
        executeMultiCallbackTest("newGravity_SensorJsTest015") {
            on(Gravity, createAccuracyValidatingCallback("newGravity_SensorJsTest015"), 
               option: Options(interval: IntervalOption.SensorNumber(CUSTOM_INTERVAL)))
            on(Gravity, createAccuracyValidatingCallback("newGravity_SensorJsTest015"), 
               option: Options(interval: IntervalOption.SensorNumber(CUSTOM_INTERVAL)))
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor016(): Unit {
        logTestStart("newGravity_SensorJsTest016")
        
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            expectBusinessException(PARAMETER_ERROR_CODE) {
                on()
            }
            expectBusinessException(PARAMETER_ERROR_CODE) {
                once()
            }
            expectBusinessException(PARAMETER_ERROR_CODE) {
                off()
            }
        } catch (e: BusinessException) {
            handleSensorNotSupported("newGravity_SensorJsTest016", e)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor017(): Unit {
        executeMultiCallbackTest("newGravity_SensorJsTest017") {
            let callback1 = GravitySensorCallback()
            let callback2 = GravitySensorCallback()
            
            on(Gravity, callback1)
            on(Gravity, callback2)
            
            sleepFor(DEFAULT_TEST_DURATION)
            Hilog.info(0, "newGravity_SensorJsTest017", "----------------------newGravity_SensorJsTest017 off in--------------")
            off(Gravity, callback: callback1)
            Hilog.info(0, "newGravity_SensorJsTest017", "----------------------newGravity_SensorJsTest017 off end--------------")
            
            sleepFor(DEFAULT_TEST_DURATION)
            Hilog.info(0, "newGravity_SensorJsTest017", "----------------------newGravity_SensorJsTest017_2 off in--------------")
            off(Gravity, callback: callback2)
            Hilog.info(0, "newGravity_SensorJsTest017", "----------------------newGravity_SensorJsTest017_2 off end--------------")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor018(): Unit {
        executeMultiCallbackTest("newGravity_SensorJsTest018") {
            let callback1 = GravitySensorCallback()
            let callback2 = GravitySensorCallback()
            
            on(Gravity, callback1, option: Options(interval: IntervalOption.SensorNumber(CUSTOM_INTERVAL)))
            on(Gravity, callback2, option: Options(interval: IntervalOption.SensorNumber(CUSTOM_INTERVAL)))
            
            sleepFor(DEFAULT_TEST_DURATION)
            Hilog.info(0, "newGravity_SensorJsTest018", "----------------------newGravity_SensorJsTest018 off in--------------")
            off(Gravity, callback: callback1)
            Hilog.info(0, "newGravity_SensorJsTest018", "----------------------newGravity_SensorJsTest018 off end--------------")
            
            sleepFor(DEFAULT_TEST_DURATION)
            Hilog.info(0, "newGravity_SensorJsTest018", "----------------------newGravity_SensorJsTest018_2 off in--------------")
            off(Gravity, callback: callback2)
            Hilog.info(0, "newGravity_SensorJsTest018", "----------------------newGravity_SensorJsTest018_2 off end--------------")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor019(): Unit {
        executeParameterErrorTest("newGravity_SensorJsTest019") {
            let callback = GravitySensorCallback()
            Hilog.info(0, "newGravity_SensorJsTest019", "----------------------newGravity_SensorJsTest019 off in--------------")
            off(-1, callback: callback)
            Hilog.info(0, "newGravity_SensorJsTest019", "----------------------newGravity_SensorJsTest019 off end--------------")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor020(): Unit {
        executeServiceExceptionTest("newGravity_SensorJsTest020") {
            let callback = GravitySensorCallback()
            on(Gravity, callback, option: Options(interval: IntervalOption.SensorNumber(INVALID_INTERVAL)))
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testNewGravitySensor021(): Unit {
        executeBasicGravityTest("newGravity_SensorJsTest021") { callback =>
            on(Gravity, callback)
            sleepFor(DEFAULT_TEST_DURATION)
            off(Gravity)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor022(): Unit {
        executeGravityTestWithValidation("newGravity_SensorJsTest022") { callback, sensor =>
            on(Gravity, callback, option: Options())
            try {
                on(Gravity, callback, option: Options(interval: IntervalOption.SensorNumber(0)))
            } catch (error) {
                Hilog.info(0, "newGravity_SensorJsTest022", "catch error:${error}")
            }
            
            sleepFor(LONG_TEST_DURATION)
            logTestOff("newGravity_SensorJsTest022")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor023(): Unit {
        executeGravityTestWithValidation("newGravity_SensorJsTest023") { callback, sensor =>
            on(Gravity, callback, option: Options())
            try {
                on(Gravity, callback, option: Options(interval: IntervalOption.SensorNumber(0)))
            } catch (error) {
                Hilog.info(0, "newGravity_SensorJsTest023", "catch error:${error}")
            }
            
            sleepFor(LONG_TEST_DURATION)
            logTestOff("newGravity_SensorJsTest023")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor024(): Unit {
        executeGravityTestWithValidation("newGravity_SensorJsTest024") { callback, sensor =>
            on(Gravity, callback, option: Options(interval: IntervalOption.SensorNumber(0)))
            sleepFor(DEFAULT_TEST_DURATION)
            logTestOff("newGravity_SensorJsTest024")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor025(): Unit {
        executeGravityTestWithValidation("newGravity_SensorJsTest025") { callback, sensor =>
            on(Gravity, callback, option: Options(interval: IntervalOption.SensorNumber(CUSTOM_INTERVAL)))
            try {
                on(Gravity, callback, option: Options(interval: IntervalOption.SensorNumber(CUSTOM_INTERVAL)))
            } catch (error) {
                Hilog.info(0, "newGravity_SensorJsTest025", "catch error:${error}")
            }
            
            sleepFor(LONG_TEST_DURATION)
            logTestOff("newGravity_SensorJsTest025")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor026(): Unit {
        executeMultiCallbackTest("newGravity_SensorJsTest026") {
            let callback1 = GravitySensorCallback()
            let callback2 = GravitySensorCallback()
            
            on(Gravity, callback1, option: Options(interval: IntervalOption.SensorNumber(0)))
            on(Gravity, callback2, option: Options(interval: IntervalOption.SensorNumber(0)))
            
            sleepFor(LONG_TEST_DURATION)
            Hilog.info(0, "newGravity_SensorJsTest026", "----------------------newGravity_SensorJsTest026 off in--------------")
            off(Gravity, callback: callback1)
            off(Gravity, callback: callback2)
            Hilog.info(0, "newGravity_SensorJsTest026", "----------------------newGravity_SensorJsTest026 off end--------------")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor027(): Unit {
        logTestStart("newGravity_SensorJsTest027")
        
        let callback = GravitySensorCallback()
        try {
            let deviceId = -1
            let result = getSingleSensorByDeviceSync(Gravity, deviceId)
            if (result.size == 0) {
                Hilog.info(0, "newGravity_SensorJsTest027", "No sensors found, Test case will return true.")
                @Expect(true)
            } else {
                let sensorInfoParam = SensorInfoParam(deviceId: result[0].deviceId, sensorIndex: result[0].sensorIndex)
                let options = Options(interval: IntervalOption.SensorNumber(CUSTOM_INTERVAL), sensorInfoParam: sensorInfoParam)
                
                on(Gravity, callback, option: options)
                sleepFor(LONG_TEST_DURATION)
                logTestOff("newGravity_SensorJsTest027")
                @Expect(true)
            }
        } catch (e: BusinessException) {
            handleSensorNotSupported("newGravity_SensorJsTest027", e)
        }
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