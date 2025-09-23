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

package ohos.sensor

import ohos.business_exception.{BusinessException, ERR_PARAMETER_ERROR, ERR_NO_PERMISSION}
import ohos.callback_invoke.{CallbackObject, Callback1Argument}
import ohos.ffi.*
import std.deriving.Derive
import ohos.labels.*

/**
 * Enum for obtain the type of sensor.
 *
 * @relation enum SensorId
 */
@Derive[ToString, Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public enum SensorId {
    /**
     * Acceleration sensor.
     *
     * @relation ACCELEROMETER = 1
     */
    | @!APILevel[
        since: "22",
        permission: "ohos.permission.ACCELEROMETER",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Accelerometer
    /**
     * Gyroscope sensor.
     *
     * @relation GYROSCOPE = 2
     */
    | @!APILevel[
        since: "22",
        permission: "ohos.permission.GYROSCOPE",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Gyroscope
    /**
     * Ambient light sensor.
     *
     * @relation AMBIENT_LIGHT = 5
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    AmbientLight
    /**
     * Magnetic field sensor.
     *
     * @relation MAGNETIC_FIELD = 6
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    MagneticField
    /**
     * Barometric pressure sensor.
     *
     * @relation BAROMETER = 8
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Barometer
    /**
     * Hall effect sensor.
     *
     * @relation HALL = 10
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Hall
    /**
     * Proximity sensor.
     *
     * @relation PROXIMITY = 12
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Proximity
    /**
     * Humidity sensor.
     *
     * @relation HUMIDITY = 13
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Humidity
    /**
     * Orientation sensor.
     *
     * @relation ORIENTATION = 256
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Orientation
    /**
     * Gravity sensor.
     *
     * @relation GRAVITY = 257
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Gravity
    /**
     * Linear acceleration sensor.
     *
     * @relation LINEAR_ACCELEROMETER = 258
     */
    | @!APILevel[
        since: "22",
        permission: "ohos.permission.ACCELEROMETER",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    LinearAccelerometer
    /**
     * Rotation vector sensor.
     *
     * @relation ROTATION_VECTOR = 259
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    RotationVector
    /**
     * Ambient temperature sensor.
     *
     * @relation AMBIENT_TEMPERATURE = 260
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    AmbientTemperature
    /**
     * Uncalibrated magnetic field sensor.
     *
     * @relation MAGNETIC_FIELD_UNCALIBRATED = 261
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    MagneticFieldUncalibrated
    /**
     * Uncalibrated gyroscope sensor.
     *
     * @relation GYROSCOPE_UNCALIBRATED = 263
     */
    | @!APILevel[
        since: "22",
        permission: "ohos.permission.GYROSCOPE",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    GyroscopeUncalibrated
    /**
     * Significant motion sensor.
     *
     * @relation SIGNIFICANT_MOTION = 264
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    SignificantMotion
    /**
     * Pedometer detection sensor.
     *
     * @relation PEDOMETER_DETECTION = 265
     */
    | @!APILevel[
        since: "22",
        permission: "ohos.permission.ACTIVITY_MOTION",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    PedometerDetection
    /**
     * Pedometer sensor.
     *
     * @relation PEDOMETER = 266
     */
    | @!APILevel[
        since: "22",
        permission: "ohos.permission.ACTIVITY_MOTION",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Pedometer
    /**
     * Heart rate sensor.
     *
     * @relation HEART_RATE = 278
     */
    | @!APILevel[
        since: "22",
        permission: "ohos.permission.READ_HEALTH_DATA",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    HeartRate
    /**
     * Wear detection sensor.
     *
     * @relation WEAR_DETECTION = 280
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    WearDetection
    /**
     * Uncalibrated acceleration sensor.
     *
     * @relation ACCELEROMETER_UNCALIBRATED = 281
     */
    | @!APILevel[
        since: "22",
        permission: "ohos.permission.ACCELEROMETER",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    AccelerometerUncalibrated
    | ...

    /**
     * get the corresponding mapping value.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public func getValue(): Int32 {
        match (this) {
            case Accelerometer => 1
            case Gyroscope => 2
            case AmbientLight => 5
            case MagneticField => 6
            case Barometer => 8
            case Hall => 10
            case Proximity => 12
            case Humidity => 13
            case Orientation => 256
            case Gravity => 257
            case LinearAccelerometer => 258
            case RotationVector => 259
            case AmbientTemperature => 260
            case MagneticFieldUncalibrated => 261
            case GyroscopeUncalibrated => 263
            case SignificantMotion => 264
            case PedometerDetection => 265
            case Pedometer => 266
            case HeartRate => 278
            case WearDetection => 280
            case AccelerometerUncalibrated => 281
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(v: Int32): SensorId {
        match (v) {
            case 1 => Accelerometer
            case 2 => Gyroscope
            case 5 => AmbientLight
            case 6 => MagneticField
            case 8 => Barometer
            case 10 => Hall
            case 12 => Proximity
            case 13 => Humidity
            case 256 => Orientation
            case 257 => Gravity
            case 258 => LinearAccelerometer
            case 259 => RotationVector
            case 260 => AmbientTemperature
            case 261 => MagneticFieldUncalibrated
            case 263 => GyroscopeUncalibrated
            case 264 => SignificantMotion
            case 265 => PedometerDetection
            case 266 => Pedometer
            case 278 => HeartRate
            case 280 => WearDetection
            case 281 => AccelerometerUncalibrated
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates the accuracy levels of data reported by a sensor.
 *
 * @relation enum SensorAccuracy
 */
@Derive[ToString, Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public enum SensorAccuracy {
    /**
     * The sensor data is unreliable. It is possible that the sensor does not contact with the device to measure.
     *
     * @relation ACCURACY_UNRELIABLE = 0
     */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    AccuracyUnreliable
    /**
     * The sensor data is at a low accuracy level. The data must be calibrated based on the environment before being used.
     *
     * @relation ACCURACY_LOW = 1
     */
    |
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    AccuracyLow
    /**
     * The sensor data is at a medium accuracy level. You are advised to calibrate the data based on the environment before using it.
     *
     * @relation ACCURACY_MEDIUM = 2
     */
    |
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    AccuracyMedium
    /**
     * The sensor data is at a high accuracy level. The data can be used directly.
     *
     * @relation ACCURACY_HIGH = 3
     */
    |
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    AccuracyHigh
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case AccuracyUnreliable => 0
                case AccuracyLow => 1
                case AccuracyMedium => 2
                case AccuracyHigh => 3
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(v: Int32): SensorAccuracy {
        match (v) {
            case 0 => AccuracyUnreliable
            case 1 => AccuracyLow
            case 2 => AccuracyMedium
            case 3 => AccuracyHigh
            case _ => AccuracyUnreliable
        }
    }
}

/**
 * Enumerates IntervalOption. 
 */
@Derive[ToString, Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public enum IntervalOption {
    /**
    * SensorNumber option.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    SensorNumber(Int64)
    /**
    * GameMode option.
    */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    GameMode
    /**
    * UIMode option.
    */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    UIMode
    /**
    * NormalMode option.
    */
    | @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    NormalMode
    | ...

    prop value: Int64 {
        get() {
            match (this) {
                case SensorNumber(v) => v
                case GameMode => 20_000_000
                case UIMode => 60_000_000
                case NormalMode => 200_000_000
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}

/**
* Parameters of sensor on the device.
*
* @relation interface SensorInfoParam.
*/
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class SensorInfoParam {
    /**
    * Unique identifier for the device that contains one or multiple sensors.
    * By default, deviceId may default to querying or controlling the local default sensor.
    *
    * @relation deviceId?: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var deviceId: Int32

    /**
    * Index of sensors of the same type. By default, it controls default sensors of the sensor type.
    *
    * @relation sensorIndex?: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var sensorIndex: Int32

    /**
    * Options constructor.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public init(deviceId!: Int32 = -1, sensorIndex!: Int32 = 0) {
        this.deviceId = deviceId
        this.sensorIndex = sensorIndex
    }
}

/**
* Acceleration sensor event data.
*
* @relation interface AccelerometerResponse extends Response
*/
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class AccelerometerResponse <: Response {
    /**
    * Acceleration x-axis component.
    *
    * @relation x: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32

    /**
    * Acceleration y-axis component.
    *
    * @relation y: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32
    /**
    * Acceleration z-axis component.
    *
    * @relation z: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var z: Float32

    init(x: Float32, y: Float32, z: Float32) {
        this.x = x
        this.y = y
        this.z = z 
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CAccelerometerResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
    }
}

/**
 * Subscribe to the sensor's optional parameters.
 *
 * @relation interface Options
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class Options {
    /**
    * Sensor event reporting event interval.
    *
    * @relation interval?: number | SensorFrequency;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var interval: IntervalOption

    /**
    * Parameters of sensor on the device.
    *
    * @relation sensorInfoParam?: SensorInfoParam;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var sensorInfoParam: ?SensorInfoParam

    /**
    * Options constructor.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public init(interval!: IntervalOption = NormalMode, sensorInfoParam!: ?SensorInfoParam = None) {
        this.interval = interval
        this.sensorInfoParam = sensorInfoParam
    }
}

/**
 * The basic data structure of the sensor event.
 *
 * @relation interface Response
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public open class Response {
    /**
     * The timestamp of the reported sensor data.
     *
     * @relation timestamp: number
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var timestamp: Int64

    /**
     * The accuracy levels of data reported by a sensor.
     *
     * @relation accuracy: SensorAccuracy
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var accuracy: SensorAccuracy

    private let impl_: ResponseImpl = ResponseImpl()

    init(timestamp: Int64, accuracy: SensorAccuracy) {
        this.timestamp = timestamp
        this.accuracy = accuracy
    }

    init() {
        this(0, SensorAccuracy.AccuracyUnreliable)
    }

    static func parseCResponseData<T>(data: CPointer<UInt8>, dataLen: Int32): T where T <: CType {
        let size = Int32(unsafe { sizeOf<T>() })
        if (size > dataLen) {
            throw IllegalArgumentException("Data length mismatch, ${size}:${dataLen}.")
        }
        unsafe { CPointer<T>(data).read() }
    }
}

class ResponseImpl {}

/**
 * Acceleration uncalibrated sensor event data.
 *
 * @relation interface AccelerometerUncalibratedResponse extends Response
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class AccelerometerUncalibratedResponse <: Response {
    /**
    * Acceleration uncalibrated x-axis component.
    *
    * @relation x: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32

    /**
    * Acceleration uncalibrated y-axis component.
    *
    * @relation y: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32

    /**
    * Acceleration uncalibrated z-axis component.
    *
    * @relation z: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var z: Float32

    /**
    * Acceleration uncalibrated x-axis offset.
    *
    * @relation biasX: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var biasX: Float32

    /**
    * Acceleration uncalibrated y-axis offset.
    *
    * @relation biasY: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var biasY: Float32
    /**
    * Acceleration uncalibrated z-axis offset.
    *
    * @relation biasZ: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var biasZ: Float32

    init(x: Float32, y: Float32, z: Float32, biasX: Float32, biasY: Float32, biasZ: Float32) {
        this.x = x
        this.y = y
        this.z = z
        this.biasX = biasX
        this.biasY = biasY
        this.biasZ = biasZ
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CAccelerometerUncalibratedResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
        (biasX, biasY, biasZ) = (data.biasX, data.biasY, data.biasZ)
    }
}

/**
 * Light sensor event data.
 * 
 * @relation interface LightResponse extends Response
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class LightResponse <: Response {
    /**
    * Indicates light intensity, in lux.
    *
    * @relation intensity: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var intensity: Float32

    /**
    * Indicates color temperature, in kelvin.
    *
    * @relation colorTemperature?: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var colorTemperature: ?Float32

    /**
    * Indicates infrared luminance, in cd/m2.
    *
    * @relation infraredLuminance?: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var infraredLuminance: ?Float32

    init(intensity: Float32, colorTemperature!: ?Float32 = None, infraredLuminance!: ?Float32 = None) {
        this.intensity = intensity
        this.colorTemperature = colorTemperature
        this.infraredLuminance = infraredLuminance
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CLightResponse>(v.data, v.dataLen)
        intensity = data.intensity
        colorTemperature = data.colorTemperature
        infraredLuminance = data.infraredLuminance
    }
}

/**
 * Ambient temperature sensor event data.
 *
 * @relation interface AmbientTemperatureResponse extends Response
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class AmbientTemperatureResponse <: Response {
    /**
    * Indicates ambient temperature, in celsius.
    *
    * @relation temperature: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var temperature: Float32

    init(temperature: Float32) {
        this.temperature = temperature
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CAmbientTemperatureResponse>(v.data, v.dataLen)
        temperature = data.temperature
    }
}

/**
 * Barometer sensor event data.
 *
 * @relation interface BarometerResponse extends Response.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class BarometerResponse <: Response {
    /**
    * Indicates the number of barometer, in hpa.
    *
    * @relation pressure: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var pressure: Float32

    init(pressure: Float32) {
        this.pressure = pressure
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CBarometerResponse>(v.data, v.dataLen)
        pressure = data.pressure
    }
}

/**
 * Gravity sensor event data.
 *
 * @relation interface GravityResponse extends Response
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class GravityResponse <: Response {
    /**
    * Gravity x-axis component.
    *
    * @relation x: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32
    /**
    * Gravity y-axis component.
    *
    * @relation y: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32
    /**
    * Gravity z-axis component.
    *
    * @relation z: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var z: Float32

    init(x: Float32, y: Float32, z: Float32) {
        this.x = x
        this.y = y
        this.z = z
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CGravityResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
    }
}

/**
 * Gyroscope sensor event data.
 *
 * @relation interface GyroscopeResponse extends Response.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class GyroscopeResponse <: Response {
    /**
    * Gyroscope x-axis component.
    *
    * @relation x: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32

    /**
    * Gyroscope y-axis component.
    *
    * @relation y: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32

    /**
    * Gyroscope z-axis component.
    *
    * @relation z: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var z: Float32

    init(x: Float32, y: Float32, z: Float32) {
        this.x = x
        this.y = y
        this.z = z
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CGyroscopeResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
    }
}

/**
 * Gyroscope uncalibrated sensor event data.
 *
 * @relation interface GyroscopeUncalibratedResponse extends Response.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class GyroscopeUncalibratedResponse <: Response {
    /**
    * Gyroscope uncalibrated x-axis component.
    *
    * @relation x: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32

    /**
    * Gyroscope uncalibrated y-axis component.
    *
    * @relation y: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32

    /**
    * Gyroscope uncalibrated z-axis component.
    *
    * @relation z: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var z: Float32

    /**
    * Gyroscope uncalibrated x-axis offset.
    *
    * @relation biasX: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var biasX: Float32

    /**
    * Gyroscope uncalibrated y-axis offset.
    *
    * @relation biasY: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var biasY: Float32

    /**
    * Gyroscope uncalibrated z-axis offset.
    *
    * @relation biasZ: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var biasZ: Float32

    init(x: Float32, y: Float32, z: Float32, biasX: Float32, biasY: Float32, biasZ: Float32) {
        this.x = x
        this.y = y
        this.z = z
        this.biasX = biasX
        this.biasY = biasY
        this.biasZ = biasZ
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CGyroscopeUncalibratedResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
        (biasX, biasY, biasZ) = (data.biasX, data.biasY, data.biasZ)
    }
}

/**
 * Hall sensor event data.
 *
 * @relation interface HallResponse extends Response.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class HallResponse <: Response {
    /**
    * Indicates hall status, 0 indicates open, and greater than 0 indicates suction.
    *
    * @relation status: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var status: Float32

    init(status: Float32) {
        this.status = status
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CHallResponse>(v.data, v.dataLen)
        status = data.status
    }
}

/**
 * Heart rate sensor event data.
 *
 * @relation interface HeartRateResponse extends Response
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class HeartRateResponse <: Response {
    /**
    * Indicates the number of heart rate.
    *
    * @relation heartRate: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var heartRate: Float32

    init(heartRate: Float32) {
        this.heartRate = heartRate
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CHeartRateResponse>(v.data, v.dataLen)
        heartRate = data.heartRate
    }
}

/**
 * Humidity sensor event data.
 *
 * @relation interface HumidityResponse extends Response
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class HumidityResponse <: Response {
    /**
    * Indicates the number of humidity.
    *
    * @relation humidity: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var humidity: Float32

    init(humidity: Float32) {
        this.humidity = humidity
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CHumidityResponse>(v.data, v.dataLen)
        humidity = data.humidity
    }
}

/**
 * Linear acceleration sensor event data.
 *
 * @relation interface LinearAccelerometerResponse extends Response.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class LinearAccelerometerResponse <: Response {
    /**
    * Linear acceleration x-axis component.
    *
    * @relation x: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32

    /**
    * Linear acceleration y-axis component.
    *
    * @relation y: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32

    /**
    * Linear acceleration z-axis component.
    *
    * @relation z: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var z: Float32

    init(x: Float32, y: Float32, z: Float32) {
        this.x = x
        this.y = y
        this.z = z
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CLinearAccelerometerResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
    }
}

/**
 * Magnetic field sensor event data.
 *
 * @relation interface MagneticFieldResponse extends Response.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class MagneticFieldResponse <: Response {
    /**
    * Magnetic field x-axis component.
    *
    * @relation x: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32

    /**
    * Magnetic field y-axis component.
    *
    * @relation y: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32
    /**
    * Magnetic field z-axis component.
    *
    * @relation z: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var z: Float32

    init(x: Float32, y: Float32, z: Float32) {
        this.x = x
        this.y = y
        this.z = z
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CMagneticFieldResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
    }
}

/**
 * Magnetic field sensor event data.
 *
 * @relation interface MagneticFieldUncalibratedResponse extends Response.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class MagneticFieldUncalibratedResponse <: Response {
    /**
    * Magnetic field uncalibrated x-axis component.
    *
    * @relation x: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32

    /**
    * Magnetic field uncalibrated y-axis component.
    *
    * @relation y: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32

    /**
    * Magnetic field uncalibrated z-axis component.
    *
    * @relation z: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var z: Float32

    /**
    * Magnetic field uncalibrated x-axis offset.
    *
    * @relation biasX: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var biasX: Float32

    /**
    * Magnetic field uncalibrated y-axis offset.
    *
    * @relation biasY: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var biasY: Float32

    /**
    * Magnetic field uncalibrated z-axis offset.    *
    *
    * @relation biasZ: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var biasZ: Float32

    init(x: Float32, y: Float32, z: Float32, biasX: Float32, biasY: Float32, biasZ: Float32) {
        this.x = x
        this.y = y
        this.z = z
        this.biasX = biasX
        this.biasY = biasY
        this.biasZ = biasZ
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CMagneticFieldUncalibratedResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
        (biasX, biasY, biasZ) = (data.biasX, data.biasY, data.biasZ)
    }
}

/**
 * Orientation sensor event data.
 *
 * @relation interface OrientationResponse extends Response.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class OrientationResponse <: Response {
    /**
    * The device rotates at an angle around the Z axis.
    *
    * @relation alpha: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var alpha: Float32

    /**
    * The device rotates at an angle around the X axis.
    *
    * @relation beta: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var beta: Float32

    /**
    * The device rotates at an angle around the Y axis.
    *
    * @relation gamma: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var gamma: Float32

    init(alpha: Float32, beta: Float32, gamma: Float32) {
        this.alpha = alpha
        this.beta = beta
        this.gamma = gamma
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<COrientationResponse>(v.data, v.dataLen)
        (alpha, beta, gamma) = (data.alpha, data.beta, data.gamma)
    }
}

/**
 * Pedometer sensor event data.
 *
 * @relation interface PedometerResponse extends Response.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class PedometerResponse <: Response {
    /**
    * Indicates the number of steps.
    *
    * relation steps: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var steps: Float32

    init(steps: Float32) {
        this.steps = steps
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CPedometerResponse>(v.data, v.dataLen)
        steps = data.steps
    }
}

/**
 * Pedometer detection sensor event data.
 *
 * @relation interface PedometerDetectionResponse extends Response.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class PedometerDetectionResponse <: Response {
    /**
    * Indicates the pedometer detection status, 1 indicates that a walking action has occurred,
    * and 0 indicates that no movement has occurred.
    *
    * @relation scalar: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var scalar: Float32

    init(scalar: Float32) {
        this.scalar = scalar
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CPedometerDetectionResponse>(v.data, v.dataLen)
        scalar = data.scalar
    }
}

/**
 * Proximity sensor event data.
 *
 * @relation interface ProximityResponse extends Response.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class ProximityResponse <: Response {
    /**
    * Indicates the degree of proximity, event 0 indicates proximity, and greater than 0 indicates distance.
    *
    * relation distance: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var distance: Float32

    init(distance: Float32) {
        this.distance = distance
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CProximityResponse>(v.data, v.dataLen)
        distance = data.distance
    }
}

/**
 * Rotation vector sensor event data.
 *
 * @relation interface RotationVectorResponse extends Response.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class RotationVectorResponse <: Response {
    /**
    * Rotation vector x-axis component.
    *
    * @relation x: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32

    /**
    * Rotation vector y-axis component.
    *
    * @relation y: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32

    /**
    * Rotation vector z-axis component.
    *
    * @relation z: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var z: Float32

    /**
    * Scalar quantity.
    *
    * @relation w: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var w: Float32

    init(x: Float32, y: Float32, z: Float32, w: Float32) {
        this.x = x
        this.y = y
        this.z = z
        this.w = w 
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CRotationVectorResponse>(v.data, v.dataLen)
        (x, y, z) = (data.x, data.y, data.z)
        w = data.w
    }
}

/**
 * Significant motion sensor event data.
 *
 * @relation interface SignificantMotionResponse extends Response.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class SignificantMotionResponse <: Response {
    /**
    * Indicates the degree of proximity, event 0 indicates proximity, and greater than 0 indicates distance.
    *
    * @relation scalar: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var scalar: Float32

    init(scalar: Float32) {
        this.scalar = scalar
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CSignificantMotionResponse>(v.data, v.dataLen)
        scalar = data.scalar
    }
}

/**
 * Wear detection sensor event data.
 *
 * @relation interface WearDetectionResponse extends Response.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class WearDetectionResponse <: Response {
    /**
    * Indicates the status of wear detection, 1 for wearing, 0 for wearing not.
    *
    * @relation value: number;
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var value: Float32

    init(value: Float32) {
        this.value = value
    }

    init(v: CSensorCallbackData) {
        super(v.timestamp, SensorAccuracy.parse(v.option))
        let data = Response.parseCResponseData<CWearDetectionResponse>(v.data, v.dataLen)
        value = data.value
    }
}

const DEFAULT_REPORTING_INTERVAL = 200_000_000

func removeCallback(sensorType: SensorId, callback: CallbackObject): Int64 {
    if (!SensorManager.isMatchType(sensorType, callback)) {
        throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
    }

    let list = ON_SENSOR_MANAGER.getOrCreate(sensorType)
    list.off(callback)
    if (list.isEmpty()) {
        ON_SENSOR_MANAGER.remove(sensorType)
        return 0
    }

    return list.size()
}

func removeAllCallback(sensorType: SensorId): Int64 {
    ON_SENSOR_MANAGER.remove(sensorType)
    0
}

/**
 * Indicates sensor information.
 *
 * @relation interface Sensor
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public class Sensor {
    /**
     * Sensor name.
     *
     * @relation sensorName:string
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var sensorName: String

    /**
     * Sensor vendor.
     *
     * @relation vendorName:string
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var vendorName: String

    /**
     * Sensor firmware version.
     *
     * @relation firmwareVersion:string
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var firmwareVersion: String

    /**
     * Sensor hardware version.
     *
     * @relation hardwareVersion:string
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var hardwareVersion: String

    /**
     * Sensor type ID, {@code SensorType}.
     *
     * @relation sensorId:number
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var sensorId: Int32

    /**
     * Maximum measurement range of the sensor.
     *
     * @relation maxRange:number
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var maxRange: Float32

    /**
     * Minimum sample period allowed, in ns.
     *
     * @relation minSamplePeriod:number
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var minSamplePeriod: Int64

    /**
     * Maximum sample period allowed, in ns.
     *
     * @relation maxSamplePeriod:number
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var maxSamplePeriod: Int64

    /**
     * Sensor accuracy.
     *
     * @relation precision:number
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var precision: Float32

    /**
     * Sensor power.
     *
     * @relation power:number
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var power: Float32

    init(sensorName: String, vendorName: String, firmwareVersion: String,
        hardwareVersion: String, sensorId: Int32, maxRange: Float32, minSamplePeriod: Int64,
        maxSamplePeriod: Int64, precision: Float32, power: Float32) {
        this.sensorName = sensorName
        this.vendorName = vendorName
        this.firmwareVersion = firmwareVersion
        this.hardwareVersion = hardwareVersion
        this.sensorId = sensorId
        this.maxRange = maxRange
        this.minSamplePeriod = minSamplePeriod
        this.maxSamplePeriod = maxSamplePeriod
        this.precision = precision
        this.power = power
    }

    init(data: CSensor) {
        sensorName = data.sensorName.toString()
        vendorName = data.vendorName.toString()
        firmwareVersion = data.firmwareVersion.toString()
        hardwareVersion = data.hardwareVersion.toString()
        sensorId = data.sensorId
        maxRange = data.maxRange
        minSamplePeriod = data.minSamplePeriod
        maxSamplePeriod = data.maxSamplePeriod
        precision = data.precision
        power = data.power
    }
}

/**
* Subscribe to sensor data.
*
* @relation on(type: SensorId.ACCELEROMETER, callback: Callback<AccelerometerResponse>, options?: Options): void;
* @relation on(type: SensorId.ACCELEROMETER_UNCALIBRATED, callback: Callback<AccelerometerUncalibratedResponse>,options?: Options): void;
* @relation on(type: SensorId.AMBIENT_LIGHT, callback: Callback<LightResponse>, options?: Options): void;
* @relation on(type: SensorId.AMBIENT_TEMPERATURE, callback: Callback<AmbientTemperatureResponse>,options?: Options): void;
* @relation on(type: SensorId.BAROMETER, callback: Callback<BarometerResponse>, options?: Options): void;
* @relation on(type: SensorId.GRAVITY, callback: Callback<GravityResponse>, options?: Options): void;
* @relation on(type: SensorId.GYROSCOPE, callback: Callback<GyroscopeResponse>, options?: Options): void;
* @relation on(type: SensorId.GYROSCOPE_UNCALIBRATED, callback: Callback<GyroscopeUncalibratedResponse>, options?: Options): void;
* @relation on(type: SensorId.HALL, callback: Callback<HallResponse>, options?: Options): void;
* @relation on(type: SensorId.HEART_RATE, callback: Callback<HeartRateResponse>, options?: Options): void;
* @relation on(type: SensorId.HUMIDITY, callback: Callback<HumidityResponse>, options?: Options): void;
* @relation on(type: SensorId.LINEAR_ACCELEROMETER, callback: Callback<LinearAccelerometerResponse>, options?: Options): void;
* @relation on(type: SensorId.MAGNETIC_FIELD, callback: Callback<MagneticFieldResponse>, options?: Options): void;
* @relation on(type: SensorId.MAGNETIC_FIELD_UNCALIBRATED, callback: Callback<MagneticFieldUncalibratedResponse>, options?: Options): void;
* @relation on(type: SensorId.ORIENTATION, callback: Callback<OrientationResponse>, options?: Options): void;
* @relation on(type: SensorId.PEDOMETER, callback: Callback<PedometerResponse>, options?: Options): void;
* @relation on(type: SensorId.PEDOMETER_DETECTION, callback: Callback<PedometerDetectionResponse>, options?: Options): void;
* @relation on(type: SensorId.PROXIMITY, callback: Callback<ProximityResponse>, options?: Options): void;
* @relation on(type: SensorId.ROTATION_VECTOR, callback: Callback<RotationVectorResponse>, options?: Options): void;
* @relation on(type: SensorId.SIGNIFICANT_MOTION, callback: Callback<SignificantMotionResponse>, options?: Options): void;
* @relation on(type: SensorId.WEAR_DETECTION, callback: Callback<WearDetectionResponse>, options?: Options): void;
*/
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public func on<T>(sensorType: SensorId, callback: Callback1Argument<T>, option!: ?Options = None): Unit where T <: Response {
    if (!SensorManager.isMatchType(sensorType, callback)) {
        throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let interval = option?.interval.value ?? DEFAULT_REPORTING_INTERVAL
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(sensorType.getValue(), interval, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    // Due to interval, no need to check type is subscribed
    ON_SENSOR_MANAGER.getOrCreate(sensorType).on(callback)
}

/**
* Subscribe to sensor data once.
*
* @relation once(type: SensorId.ACCELEROMETER, callback: Callback<AccelerometerResponse>): void;
* @relation once(type: SensorId.ACCELEROMETER_UNCALIBRATED, callback: Callback<AccelerometerUncalibratedResponse>): void;
* @relation once(type: SensorId.AMBIENT_LIGHT, callback: Callback<LightResponse>): void;
* @relation once(type: SensorId.AMBIENT_TEMPERATURE, callback: Callback<AmbientTemperatureResponse>): void;
* @relation once(type: SensorId.BAROMETER, callback: Callback<BarometerResponse>): void;
* @relation once(type: SensorId.GRAVITY, callback: Callback<GravityResponse>): void;
* @relation once(type: SensorId.GYROSCOPE, callback: Callback<GyroscopeResponse>): void;
* @relation once(type: SensorId.GYROSCOPE_UNCALIBRATED, callback: Callback<GyroscopeUncalibratedResponse>): void;
* @relation once(type: SensorId.HALL, callback: Callback<HallResponse>): void;
* @relation once(type: SensorId.HEART_RATE, callback: Callback<HeartRateResponse>): void;
* @relation once(type: SensorId.HUMIDITY, callback: Callback<HumidityResponse>): void;
* @relation once(type: SensorId.LINEAR_ACCELEROMETER, callback: Callback<LinearAccelerometerResponse>): void;
* @relation once(type: SensorId.MAGNETIC_FIELD, callback: Callback<MagneticFieldResponse>): void;
* @relation once(type: SensorId.MAGNETIC_FIELD_UNCALIBRATED, callback: Callback<MagneticFieldUncalibratedResponse>): void;
* @relation once(type: SensorId.ORIENTATION, callback: Callback<OrientationResponse>): void;
* @relation once(type: SensorId.PEDOMETER, callback: Callback<PedometerResponse>): void;
* @relation once(type: SensorId.PEDOMETER_DETECTION, callback: Callback<PedometerDetectionResponse>): void;
* @relation once(type: SensorId.PROXIMITY, callback: Callback<ProximityResponse>): void;
* @relation once(type: SensorId.ROTATION_VECTOR, callback: Callback<RotationVectorResponse>): void;
* @relation once(type: SensorId.SIGNIFICANT_MOTION, callback: Callback<SignificantMotionResponse>): void;
* @relation once(type: SensorId.WEAR_DETECTION, callback: Callback<WearDetectionResponse>): void;
*/
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public func once<T>(sensorType: SensorId, callback: Callback1Argument<T>): Unit where T <: Response {
    if (!SensorManager.isMatchType(sensorType, callback)) {
        throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
    }

    if (ON_SENSOR_MANAGER.isSensorSubscribed(sensorType)) {
        ONCE_SENSOR_MANAGER.getOrCreate(sensorType).on(callback)
        return
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(sensorType.getValue(), DEFAULT_REPORTING_INTERVAL, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }

    ONCE_SENSOR_MANAGER.getOrCreate(sensorType).on(callback)
}

/**
* Subscribe to sensor data once.
*
* @relation off(type: SensorId.ACCELEROMETER, callback?: Callback<AccelerometerResponse>): void;
* @relation off(type: SensorId.ACCELEROMETER_UNCALIBRATED, callback?: Callback<AccelerometerUncalibratedResponse>): void;
* @relation off(type: SensorId.AMBIENT_LIGHT, callback?: Callback<LightResponse>): void;
* @relation off(type: SensorId.AMBIENT_TEMPERATURE, callback?: Callback<AmbientTemperatureResponse>): void;
* @relation off(type: SensorId.BAROMETER, callback?: Callback<BarometerResponse>): void;
* @relation off(type: SensorId.GRAVITY, callback?: Callback<GravityResponse>): void;
* @relation off(type: SensorId.GYROSCOPE, callback?: Callback<GyroscopeResponse>): void;
* @relation off(type: SensorId.GYROSCOPE_UNCALIBRATED, callback?: Callback<GyroscopeUncalibratedResponse>): void;
* @relation off(type: SensorId.HALL, callback?: Callback<HallResponse>): void;
* @relation off(type: SensorId.HEART_RATE, callback?: Callback<HeartRateResponse>): void;
* @relation off(type: SensorId.HUMIDITY, callback?: Callback<HumidityResponse>): void;
* @relation off(type: SensorId.LINEAR_ACCELEROMETER, callback?: Callback<LinearAccelerometerResponse>): void;
* @relation off(type: SensorId.MAGNETIC_FIELD, callback?: Callback<MagneticFieldResponse>): void;
* @relation off(type: SensorId.MAGNETIC_FIELD_UNCALIBRATED, callback?: Callback<MagneticFieldUncalibratedResponse>): void;
* @relation off(type: SensorId.ORIENTATION, callback?: Callback<OrientationResponse>): void;
* @relation off(type: SensorId.PEDOMETER, callback?: Callback<PedometerResponse>): void;
* @relation off(type: SensorId.PEDOMETER_DETECTION, callback?: Callback<PedometerDetectionResponse>): void;
* @relation off(type: SensorId.PROXIMITY, callback?: Callback<ProximityResponse>): void;
* @relation off(type: SensorId.ROTATION_VECTOR, callback?: Callback<RotationVectorResponse>): void;
* @relation off(type: SensorId.SIGNIFICANT_MOTION, callback?: Callback<SignificantMotionResponse>): void;
* @relation off(type: SensorId.WEAR_DETECTION, callback?: Callback<WearDetectionResponse>): void;
*/
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public func off(sensorType: SensorId, callback!: ?CallbackObject = None): Unit {
    if (!ON_SENSOR_MANAGER.isSensorSubscribed(sensorType)) {
        return
    }

    let size = match (callback) {
        case Some(v) => removeCallback(sensorType, v)
        case None => removeAllCallback(sensorType)
    }

    if (size > 0) {
        return
    }

    let ret = unsafe { FfiSensorUnSubscribeSensor(sensorType.getValue()) }
    if (ret == ERR_PARAMETER_ERROR || ret == ERR_NO_PERMISSION) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
}

/**
 * Obtains all sensor information on the device.
 *
 * @throws { BusinessException } 14500101 - Service exception. Possible causes: 1. Sensor hdf service exception;
 * 2. Sensor service ipc exception;3. Sensor data channel exception.
 * @relation function getSensorListSync(): Array<Sensor>
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public func getSensorList(): Array<Sensor> {
    var result = CSensorArray()
    let ret = unsafe { FfiSensorGetAllSensors(inout result) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    try {
        result.asArray()
    } finally {
        result.free()
    }
}

/**
 * Obtains the sensor information of a specified type.
 *
 * @throws { BusinessException } 14500101 - Service exception. Possible causes: 1. Sensor hdf service exception;
 * <br> 2. Sensor service ipc exception;3. Sensor data channel exception.
 * @throws { BusinessException } 14500102 - The sensor is not supported by the device.
 * @relation function getSingleSensorSync(type: SensorId): Sensor
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Sensors.Sensor"
]
public func getSingleSensor(sensorType: SensorId): Sensor {
    let sensorList = getSensorList()
    for (sensor in sensorList) {
        if (sensor.sensorId == sensorType.getValue()) {
            return sensor
        }
    }

    throw BusinessException(SENSOR_NO_SUPPORT, getErrorMsg(SENSOR_NO_SUPPORT))
}
