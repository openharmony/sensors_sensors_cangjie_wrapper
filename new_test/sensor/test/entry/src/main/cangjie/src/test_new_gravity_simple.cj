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
    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testNewGravitySensor001(): Unit {
        let TAG = "newGravity_SensorJsTest001"
        Hilog.info(0, TAG, "---------newGravity_SensorJsTest001--------------")
        
        let callback = GravitySensorCallback()
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            on(Gravity, callback)
            sleepFor(500.milliSecond)
            off(Gravity)
            @Expect(true)
        } catch (e: BusinessException) {
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor002(): Unit {
        let TAG = "newGravity_SensorJsTest002"
        Hilog.info(0, TAG, "---------newGravity_SensorJsTest002--------------")
        
        let callback = GravitySensorCallback()
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            on(Gravity, callback)
            sleepFor(500.milliSecond)
            off(Gravity)
            @Expect(true)
        } catch (e: BusinessException) {
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor003(): Unit {
        let TAG = "newGravity_SensorJsTest003"
        Hilog.info(0, TAG, "---------newGravity_SensorJsTest003--------------")
        
        let callback = GravitySensorCallback()
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            expectBusinessException(PARAMETER_ERROR_CODE) {
                on(INVALID_SENSOR_ID, callback)
            }
        } catch (e: BusinessException) {
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor004(): Unit {
        let TAG = "newGravity_SensorJsTest004"
        Hilog.info(0, TAG, "---------newGravity_SensorJsTest004--------------")
        
        let callback = GravitySensorCallback()
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            on(Gravity, callback, option: Options(interval: IntervalOption.SensorNumber(100000000)))
            sleepFor(500.milliSecond)
            Hilog.info(0, TAG, "---------newGravity_SensorJsTest004 off in--------------")
            off(Gravity)
            Hilog.info(0, TAG, "---------newGravity_SensorJsTest004 off end--------------")
            @Expect(true)
        } catch (e: BusinessException) {
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor005(): Unit {
        let TAG = "newGravity_SensorJsTest005"
        Hilog.info(0, TAG, "---------newGravity_SensorJsTest005--------------")
        
        let callback = GravitySensorCallback()
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            on(Gravity, callback, option: Options(interval: IntervalOption.SensorNumber(100000000)), samplingPeriodCount: 5)
            sleepFor(500.milliSecond)
            Hilog.info(0, TAG, "---------newGravity_SensorJsTest005 off in--------------")
            off(Gravity)
            Hilog.info(0, TAG, "---------newGravity_SensorJsTest005 off end--------------")
            @Expect(true)
        } catch (e: BusinessException) {
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor006(): Unit {
        let TAG = "newGravity_SensorJsTest006"
        Hilog.info(0, TAG, "---------newGravity_SensorJsTest006--------------")
        
        let callback = GravitySensorCallback()
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            once(Gravity, callback)
            sleepFor(500.milliSecond)
            @Expect(true)
        } catch (e: BusinessException) {
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor007(): Unit {
        let TAG = "newGravity_SensorJsTest007"
        Hilog.info(0, TAG, "---------newGravity_SensorJsTest007--------------")
        
        let callback = GravitySensorCallback()
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            expectBusinessException(PARAMETER_ERROR_CODE) {
                once(INVALID_SENSOR_ID, callback)
            }
        } catch (e: BusinessException) {
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor008(): Unit {
        let TAG = "newGravity_SensorJsTest008"
        Hilog.info(0, TAG, "---------newGravity_SensorJsTest008--------------")
        
        let callback = GravitySensorCallback()
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            once(Gravity, callback, samplingPeriodCount: 5)
            @Expect(true)
        } catch (e: BusinessException) {
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor009(): Unit {
        let TAG = "newGravity_SensorJsTest009"
        Hilog.info(0, TAG, "---------newGravity_SensorJsTest009--------------")
        
        let callback = GravitySensorCallback()
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            expectBusinessException(PARAMETER_ERROR_CODE) {
                off(INVALID_SENSOR_ID, callback: callback)
            }
        } catch (e: BusinessException) {
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor010(): Unit {
        let TAG = "newGravity_SensorJsTest010"
        Hilog.info(0, TAG, "---------newGravity_SensorJsTest010--------------")
        
        let callback = GravitySensorCallback()
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            on(Gravity, callback)
            sleepFor(500.milliSecond)
            off(Gravity, callback: callback)
            @Expect(true)
        } catch (e: BusinessException) {
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor011(): Unit {
        let TAG = "newGravity_SensorJsTest011"
        Hilog.info(0, TAG, "---------newGravity_SensorJsTest011--------------")
        
        let callback = GravitySensorCallback()
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            expectBusinessException(PARAMETER_ERROR_CODE) {
                off(1000000, callback: callback)
            }
        } catch (e: BusinessException) {
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor012(): Unit {
        let TAG = "newGravity_SensorJsTest012"
        Hilog.info(0, TAG, "---------newGravity_SensorJsTest012--------------")
        
        let callback1 = GravitySensorCallback()
        let callback2 = GravitySensorCallback()
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            on(Gravity, { data: GravityResponse =>
                Hilog.info(0, TAG, "Callback in! x=${data.x}, y=${data.y}, z=${data.z}")
                @Expect(data.accuracy >= AccuracyUnreliable.getValue() && data.accuracy <= AccuracyHigh.getValue())
            })
            on(Gravity, { data: GravityResponse =>
                Hilog.info(0, TAG, "Callback2 in! x=${data.x}, y=${data.y}, z=${data.z}")
                @Expect(data.accuracy >= AccuracyUnreliable.getValue() && data.accuracy <= AccuracyHigh.getValue())
            })
            
            sleepFor(1000.milliSecond)
            Hilog.info(0, TAG, "---------newGravity_SensorJsTest012 off in--------------")
            off(Gravity)
            Hilog.info(0, TAG, "---------newGravity_SensorJsTest012 off end--------------")
            @Expect(true)
        } catch (e: BusinessException) {
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testNewGravitySensor013(): Unit {
        let TAG = "newGravity_SensorJsTest013"
        Hilog.info(0, TAG, "---------newGravity_SensorJsTest013--------------")
        
        let callback = GravitySensorCallback()
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            expectBusinessException(PARAMETER_ERROR_CODE) {
                off(Gravity, 5)
            }
        } catch (e: BusinessException) {
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor014(): Unit {
        let TAG = "newGravity_SensorJsTest014"
        Hilog.info(0, TAG, "---------newGravity_SensorJsTest014--------------")
        
        let callback1 = GravitySensorCallback()
        let callback2 = GravitySensorCallback()
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            on(Gravity, { data: GravityResponse =>
                Hilog.info(0, TAG, "Callback in! x=${data.x}, y=${data.y}, z=${data.z}")
                @Expect(data.accuracy >= AccuracyUnreliable.getValue() && data.accuracy <= AccuracyHigh.getValue())
            }, option: Options(interval: IntervalOption.SensorNumber(100000000)))
            
            once(Gravity, { data: GravityResponse =>
                Hilog.info(0, TAG, "Callback2 in! x=${data.x}, y=${data.y}, z=${data.z}")
                @Expect(data.accuracy >= AccuracyUnreliable.getValue() && data.accuracy <= AccuracyHigh.getValue())
            })
            
            sleepFor(1000.milliSecond)
            Hilog.info(0, TAG, "---------newGravity_SensorJsTest014 off in--------------")
            off(Gravity)
            Hilog.info(0, TAG, "---------newGravity_SensorJsTest014 off end--------------")
            @Expect(true)
        } catch (e: BusinessException) {
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor015(): Unit {
        let TAG = "newGravity_SensorJsTest015"
        Hilog.info(0, TAG, "---------newGravity_SensorJsTest015--------------")
        
        let callback1 = GravitySensorCallback()
        let callback2 = GravitySensorCallback()
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            on(Gravity, { data: GravityResponse =>
                Hilog.info(0, TAG, "Callback in! x=${data.x}, y=${data.y}, z=${data.z}")
                @Expect(data.accuracy >= AccuracyUnreliable.getValue() && data.accuracy <= AccuracyHigh.getValue())
            }, option: Options(interval: IntervalOption.SensorNumber(100000000)))
            
            on(Gravity, { data: GravityResponse =>
                Hilog.info(0, TAG, "Callback2 in! x=${data.x}, y=${data.y}, z=${data.z}")
                @Expect(data.accuracy >= AccuracyUnreliable.getValue() && data.accuracy <= AccuracyHigh.getValue())
            }, option: Options(interval: IntervalOption.SensorNumber(100000000)))
            
            sleepFor(1000.milliSecond)
            Hilog.info(0, TAG, "---------newGravity_SensorJsTest015 off in--------------")
            off(Gravity)
            Hilog.info(0, TAG, "---------newGravity_SensorJsTest015 off end--------------")
            @Expect(true)
        } catch (e: BusinessException) {
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor016(): Unit {
        let TAG = "newGravity_SensorJsTest016"
        Hilog.info(0, TAG, "---------newGravity_SensorJsTest016--------------")
        
        let callback = GravitySensorCallback()
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
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor017(): Unit {
        let TAG = "newGravity_SensorJsTest017"
        Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest017--------------")
        
        let callback1 = GravitySensorCallback()
        let callback2 = GravitySensorCallback()
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            on(Gravity, callback1)
            on(Gravity, callback2)
            
            sleepFor(500.milliSecond)
            Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest017 off in--------------")
            off(Gravity, callback: callback1)
            Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest017 off end--------------")
            
            sleepFor(500.milliSecond)
            Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest017 off in--------------")
            off(Gravity, callback: callback2)
            Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest017 off end--------------")
            
            @Expect(true)
        } catch (e: BusinessException) {
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor018(): Unit {
        let TAG = "newGravity_SensorJsTest018"
        Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest018--------------")
        
        let callback1 = GravitySensorCallback()
        let callback2 = GravitySensorCallback()
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            on(Gravity, callback1, option: Options(interval: IntervalOption.SensorNumber(100000000)))
            on(Gravity, callback2, option: Options(interval: IntervalOption.SensorNumber(100000000)))
            
            sleepFor(500.milliSecond)
            Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest018 off in--------------")
            off(Gravity, callback: callback1)
            Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest018 off end--------------")
            
            sleepFor(500.milliSecond)
            Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest018_2 off in--------------")
            off(Gravity, callback: callback2)
            Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest018_2 off end--------------")
            
            @Expect(true)
        } catch (e: BusinessException) {
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor019(): Unit {
        let TAG = "newGravity_SensorJsTest019"
        Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest019--------------")
        
        let callback = GravitySensorCallback()
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest019 off in--------------")
            expectBusinessException(PARAMETER_ERROR_CODE) {
                off(-1, callback: callback)
            }
            Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest019 off end--------------")
        } catch (e: BusinessException) {
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor020(): Unit {
        let TAG = "newGravity_SensorJsTest020"
        Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest020---------------------------")
        
        let callback = GravitySensorCallback()
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            expectBusinessException(SERVICE_EXCEPTION_CODE) {
                on(Gravity, callback, option: Options(interval: IntervalOption.SensorNumber(-100000000)))
            }
        } catch (e: BusinessException) {
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testNewGravitySensor021(): Unit {
        let TAG = "newGravity_SensorJsTest021"
        Hilog.info(0, TAG, "---------newGravity_SensorJsTest021--------------")
        
        let callback = GravitySensorCallback()
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            on(Gravity, callback)
            sleepFor(500.milliSecond)
            off(Gravity)
            @Expect(true)
        } catch (e: BusinessException) {
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor022(): Unit {
        let TAG = "newGravity_SensorJsTest022"
        Hilog.info(0, TAG, "---------newGravity_SensorJsTest022--------------")
        
        let callback = GravitySensorCallback()
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            on(Gravity, callback, option: Options())
            try {
                on(Gravity, callback, option: Options(interval: IntervalOption.SensorNumber(0)))
            } catch (error: Exception) {
                Hilog.info(0, TAG, "catch error:${error}")
            }
            
            sleepFor(1000.milliSecond)
            Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest022 off in--------------")
            off(Gravity)
            Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest022 off end--------------")
            @Expect(true)
        } catch (e: BusinessException) {
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor023(): Unit {
        let TAG = "newGravity_SensorJsTest023"
        Hilog.info(0, TAG, "---------newGravity_SensorJsTest023--------------")
        
        let callback = GravitySensorCallback()
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            on(Gravity, callback, option: Options())
            try {
                on(Gravity, callback, option: Options(interval: IntervalOption.SensorNumber(0)))
            } catch (error: Exception) {
                Hilog.info(0, TAG, "catch error:${error}")
            }
            
            sleepFor(1000.milliSecond)
            Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest023 off in--------------")
            off(Gravity)
            Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest023 off end--------------")
            @Expect(true)
        } catch (e: BusinessException) {
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor024(): Unit {
        let TAG = "newGravity_SensorJsTest024"
        Hilog.info(0, TAG, "---------newGravity_SensorJsTest024--------------")
        
        let callback = GravitySensorCallback()
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            on(Gravity, callback, option: Options(interval: IntervalOption.SensorNumber(0)))
            sleepFor(500.milliSecond)
            Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest024 off in--------------")
            off(Gravity)
            Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest024 off end--------------")
            @Expect(true)
        } catch (e: BusinessException) {
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor025(): Unit {
        let TAG = "newGravity_SensorJsTest025"
        Hilog.info(0, TAG, "---------newGravity_SensorJsTest025--------------")
        
        let callback = GravitySensorCallback()
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            on(Gravity, callback, option: Options(interval: IntervalOption.SensorNumber(100000000)))
            try {
                on(Gravity, callback, option: Options(interval: IntervalOption.SensorNumber(100000000)))
            } catch (error: Exception) {
                Hilog.info(0, TAG, "catch error:${error}")
            }
            
            sleepFor(1000.milliSecond)
            Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest025 off in--------------")
            off(Gravity)
            Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest025 off end--------------")
            @Expect(true)
        } catch (e: BusinessException) {
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor026(): Unit {
        let TAG = "newGravity_SensorJsTest026"
        Hilog.info(0, TAG, "---------newGravity_SensorJsTest026--------------")
        
        let callback1 = GravitySensorCallback()
        let callback2 = GravitySensorCallback()
        try {
            let sensor = getSingleSensor(SensorId.Gravity)
            @Expect(sensor.sensorId, Gravity.getValue())
            
            on(Gravity, callback1, option: Options(interval: IntervalOption.SensorNumber(0)))
            on(Gravity, callback2, option: Options(interval: IntervalOption.SensorNumber(0)))
            
            sleepFor(1000.milliSecond)
            Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest026 off in--------------")
            off(Gravity, callback: callback1)
            off(Gravity, callback: callback2)
            Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest026 off end--------------")
            @Expect(true)
        } catch (e: BusinessException) {
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel3]
    func testNewGravitySensor027(): Unit {
        let TAG = "newGravity_SensorJsTest027"
        Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest027--------------")
        
        let callback = GravitySensorCallback()
        try {
            let deviceId = -1
            let result = getSingleSensorByDeviceSync(Gravity, deviceId)
            if (result.size == 0) {
                Hilog.info(0, TAG, "No sensors found, Test case will return true.")
                @Expect(true)
            } else {
                let sensorInfoParam = SensorInfoParam(deviceId: result[0].deviceId, sensorIndex: result[0].sensorIndex)
                let options = Options(interval: IntervalOption.SensorNumber(100000000), sensorInfoParam: sensorInfoParam)
                
                on(Gravity, callback, option: options)
                sleepFor(1000.milliSecond)
                Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest027 off in--------------")
                off(Gravity, sensorInfoParam: sensorInfoParam, callback: callback)
                Hilog.info(0, TAG, "----------------------newGravity_SensorJsTest027 off end--------------")
                @Expect(true)
            }
        } catch (e: BusinessException) {
            Hilog.info(0, TAG, "fail, errCode:${e.code} ,msg:${e.message}")
            @Expect(e.code, SENSOR_NO_SUPPORT_CODE)
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