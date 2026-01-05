/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

package ohos.sensor

import ohos.callback_invoke.{CallbackObject, Callback1Argument}
import ohos.labels.*

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public enum SensorId {
    | @!APILevel[since: "22", permission: "ohos.permission.ACCELEROMETER", syscap: "SystemCapability.Sensors.Sensor"]
    Accelerometer
    | @!APILevel[since: "22", permission: "ohos.permission.GYROSCOPE", syscap: "SystemCapability.Sensors.Sensor"]
    Gyroscope
    | @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    AmbientLight
    | @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    MagneticField
    | @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    Barometer
    | @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    Hall
    | @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    Proximity
    | @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    Humidity
    | @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    Orientation
    | @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    Gravity
    | @!APILevel[since: "22", permission: "ohos.permission.ACCELEROMETER", syscap: "SystemCapability.Sensors.Sensor"]
    LinearAccelerometer
    | @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    RotationVector
    | @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    AmbientTemperature
    | @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    MagneticFieldUncalibrated
    | @!APILevel[since: "22", permission: "ohos.permission.GYROSCOPE", syscap: "SystemCapability.Sensors.Sensor"]
    GyroscopeUncalibrated
    | @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    SignificantMotion
    | @!APILevel[since: "22", permission: "ohos.permission.ACTIVITY_MOTION", syscap: "SystemCapability.Sensors.Sensor"]
    PedometerDetection
    | @!APILevel[since: "22", permission: "ohos.permission.ACTIVITY_MOTION", syscap: "SystemCapability.Sensors.Sensor"]
    Pedometer
    | @!APILevel[since: "22", permission: "ohos.permission.READ_HEALTH_DATA", syscap: "SystemCapability.Sensors.Sensor"]
    HeartRate
    | @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    WearDetection
    | @!APILevel[since: "22", permission: "ohos.permission.ACCELEROMETER", syscap: "SystemCapability.Sensors.Sensor"]
    AccelerometerUncalibrated
    | ...

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public func getValue(): Int32 {
        return 0
    }
}

extend SensorId <: ToString {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public func toString(): String {
        return String()
    }
}

extend SensorId <: Equatable<SensorId> {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public operator func ==(other: SensorId): Bool {
        return true
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public operator func !=(other: SensorId): Bool {
        return true
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public enum SensorAccuracy {
    | @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    AccuracyUnreliable
    | @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    AccuracyLow
    | @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    AccuracyMedium
    | @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    AccuracyHigh
    | ...
}

extend SensorAccuracy <: ToString {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public func toString(): String {
        return String()
    }
}

extend SensorAccuracy <: Equatable<SensorAccuracy> {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public operator func ==(other: SensorAccuracy): Bool {
        return true
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public operator func !=(other: SensorAccuracy): Bool {
        return true
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public enum IntervalOption {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"] SensorNumber(Int64)
    | @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    GameMode
    | @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    UIMode
    | @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    NormalMode
    | ...
}

extend IntervalOption <: ToString {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public func toString(): String {
        return String()
    }
}

extend IntervalOption <: Equatable<IntervalOption> {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public operator func ==(other: IntervalOption): Bool {
        return true
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public operator func !=(other: IntervalOption): Bool {
        return true
    }
}

extend IntervalOption {}

extend IntervalOption {}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public class SensorInfoParam {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var deviceId: Int32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var sensorIndex: Int32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public init(deviceId!: Int32 = -1, sensorIndex!: Int32 = 0) {
        super()
        this.deviceId = 0
        this.sensorIndex = 0
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public class AccelerometerResponse <: Response {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var x: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var y: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var z: Float32
    
    public init() {
        super()
        this.x = 0.0
        this.y = 0.0
        this.z = 0.0
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public class Options {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var interval: IntervalOption

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var sensorInfoParam: ?SensorInfoParam

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public init(interval!: IntervalOption = NormalMode, sensorInfoParam!: ?SensorInfoParam = None) {
        super()
        this.interval = IntervalOption.SensorNumber(0)
        this.sensorInfoParam = None
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public open class Response {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var timestamp: Int64

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var accuracy: SensorAccuracy
    
    public init() {
        super()
        this.timestamp = 0
        this.accuracy = SensorAccuracy.AccuracyUnreliable
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public class AccelerometerUncalibratedResponse <: Response {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var x: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var y: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var z: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var biasX: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var biasY: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var biasZ: Float32
    
    public init() {
        super()
        this.x = 0.0
        this.y = 0.0
        this.z = 0.0
        this.biasX = 0.0
        this.biasY = 0.0
        this.biasZ = 0.0
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public class LightResponse <: Response {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var intensity: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var colorTemperature: ?Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var infraredLuminance: ?Float32
    
    public init() {
        super()
        this.intensity = 0.0
        this.colorTemperature = None
        this.infraredLuminance = None
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public class AmbientTemperatureResponse <: Response {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var temperature: Float32
    
    public init() {
        super()
        this.temperature = 0.0
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public class BarometerResponse <: Response {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var pressure: Float32
    
    public init() {
        super()
        this.pressure = 0.0
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public class GravityResponse <: Response {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var x: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var y: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var z: Float32
    
    public init() {
        super()
        this.x = 0.0
        this.y = 0.0
        this.z = 0.0
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public class GyroscopeResponse <: Response {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var x: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var y: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var z: Float32
    
    public init() {
        super()
        this.x = 0.0
        this.y = 0.0
        this.z = 0.0
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public class GyroscopeUncalibratedResponse <: Response {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var x: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var y: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var z: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var biasX: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var biasY: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var biasZ: Float32
    
    public init() {
        super()
        this.x = 0.0
        this.y = 0.0
        this.z = 0.0
        this.biasX = 0.0
        this.biasY = 0.0
        this.biasZ = 0.0
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public class HallResponse <: Response {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var status: Float32
    
    public init() {
        super()
        this.status = 0.0
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public class HeartRateResponse <: Response {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var heartRate: Float32
    
    public init() {
        super()
        this.heartRate = 0.0
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public class HumidityResponse <: Response {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var humidity: Float32
    
    public init() {
        super()
        this.humidity = 0.0
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public class LinearAccelerometerResponse <: Response {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var x: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var y: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var z: Float32
    
    public init() {
        super()
        this.x = 0.0
        this.y = 0.0
        this.z = 0.0
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public class MagneticFieldResponse <: Response {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var x: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var y: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var z: Float32
    
    public init() {
        super()
        this.x = 0.0
        this.y = 0.0
        this.z = 0.0
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public class MagneticFieldUncalibratedResponse <: Response {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var x: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var y: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var z: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var biasX: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var biasY: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var biasZ: Float32
    
    public init() {
        super()
        this.x = 0.0
        this.y = 0.0
        this.z = 0.0
        this.biasX = 0.0
        this.biasY = 0.0
        this.biasZ = 0.0
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public class OrientationResponse <: Response {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var alpha: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var beta: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var gamma: Float32
    
    public init() {
        super()
        this.alpha = 0.0
        this.beta = 0.0
        this.gamma = 0.0
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public class PedometerResponse <: Response {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var steps: Float32
    
    public init() {
        super()
        this.steps = 0.0
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public class PedometerDetectionResponse <: Response {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var scalar: Float32
    
    public init() {
        super()
        this.scalar = 0.0
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public class ProximityResponse <: Response {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var distance: Float32
    
    public init() {
        super()
        this.distance = 0.0
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public class RotationVectorResponse <: Response {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var x: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var y: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var z: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var w: Float32
    
    public init() {
        super()
        this.x = 0.0
        this.y = 0.0
        this.z = 0.0
        this.w = 0.0
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public class SignificantMotionResponse <: Response {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var scalar: Float32
    
    public init() {
        super()
        this.scalar = 0.0
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public class WearDetectionResponse <: Response {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var value: Float32
    
    public init() {
        super()
        this.value = 0.0
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
public class Sensor {
    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var sensorName: String

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var vendorName: String

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var firmwareVersion: String

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var hardwareVersion: String

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var sensorId: Int32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var maxRange: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var minSamplePeriod: Int64

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var maxSamplePeriod: Int64

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var precision: Float32

    @!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor"]
    public var power: Float32
    
    public init() {
        super()
        this.sensorName = String()
        this.vendorName = String()
        this.firmwareVersion = String()
        this.hardwareVersion = String()
        this.sensorId = 0
        this.maxRange = 0.0
        this.minSamplePeriod = 0
        this.maxSamplePeriod = 0
        this.precision = 0.0
        this.power = 0.0
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor", throwexception: true]
public func on<T>(sensorType: SensorId, callback: Callback1Argument<T>, option!: ?Options = None): Unit where T <: Response {
    return ()
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor", throwexception: true]
public func once<T>(sensorType: SensorId, callback: Callback1Argument<T>): Unit where T <: Response {
    return ()
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor", throwexception: true]
public func off(sensorType: SensorId, callback!: ?CallbackObject = None): Unit {
    return ()
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor", throwexception: true, workerthread: true]
public func getSensorList(): Array<Sensor> {
    return Array()
}

@!APILevel[since: "22", syscap: "SystemCapability.Sensors.Sensor", throwexception: true, workerthread: true]
public func getSingleSensor(sensorType: SensorId): Sensor {
    return Sensor()
}