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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public enum SensorId {
    /**
     * Acceleration sensor.
     *
     * @relation ACCELEROMETER = 1
     */
    | @!APILevel[
        21,
        permission: "ohos.permission.ACCELEROMETER",
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Accelerometer
    /**
     * Gyroscope sensor.
     *
     * @relation GYROSCOPE = 2
     */
    | @!APILevel[
        21,
        permission: "ohos.permission.GYROSCOPE",
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Gyroscope
    /**
     * Ambient light sensor.
     *
     * @relation AMBIENT_LIGHT = 5
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    AmbientLight
    /**
     * Magnetic field sensor.
     *
     * @relation MAGNETIC_FIELD = 6
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    MagneticField
    /**
     * Barometric pressure sensor.
     *
     * @relation BAROMETER = 8
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Barometer
    /**
     * Hall effect sensor.
     *
     * @relation HALL = 10
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Hall
    /**
     * Proximity sensor.
     *
     * @relation PROXIMITY = 12
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Proximity
    /**
     * Humidity sensor.
     *
     * @relation HUMIDITY = 13
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Humidity
    /**
     * Orientation sensor.
     *
     * @relation ORIENTATION = 256
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Orientation
    /**
     * Gravity sensor.
     *
     * @relation GRAVITY = 257
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Gravity
    /**
     * Linear acceleration sensor.
     *
     * @relation LINEAR_ACCELEROMETER = 258
     */
    | @!APILevel[
        21,
        permission: "ohos.permission.ACCELEROMETER",
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    LinearAccelerometer
    /**
     * Rotation vector sensor.
     *
     * @relation ROTATION_VECTOR = 259
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    RotationVector
    /**
     * Ambient temperature sensor.
     *
     * @relation AMBIENT_TEMPERATURE = 260
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    AmbientTemperature
    /**
     * Uncalibrated magnetic field sensor.
     *
     * @relation MAGNETIC_FIELD_UNCALIBRATED = 261
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    MagneticFieldUncalibrated
    /**
     * Uncalibrated gyroscope sensor.
     *
     * @relation GYROSCOPE_UNCALIBRATED = 263
     */
    | @!APILevel[
        21,
        permission: "ohos.permission.GYROSCOPE",
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    GyroscopeUncalibrated
    /**
     * Significant motion sensor.
     *
     * @relation SIGNIFICANT_MOTION = 264
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    SignificantMotion
    /**
     * Pedometer detection sensor.
     *
     * @relation PEDOMETER_DETECTION = 265
     */
    | @!APILevel[
        21,
        permission: "ohos.permission.ACTIVITY_MOTION",
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    PedometerDetection
    /**
     * Pedometer sensor.
     *
     * @relation PEDOMETER = 266
     */
    | @!APILevel[
        21,
        permission: "ohos.permission.ACTIVITY_MOTION",
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    Pedometer
    /**
     * Heart rate sensor.
     *
     * @relation HEART_RATE = 278
     */
    | @!APILevel[
        21,
        permission: "ohos.permission.READ_HEALTH_DATA",
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    HeartRate
    /**
     * Wear detection sensor.
     *
     * @relation WEAR_DETECTION = 280
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    WearDetection
    /**
     * Uncalibrated acceleration sensor.
     *
     * @relation ACCELEROMETER_UNCALIBRATED = 281
     */
    | @!APILevel[
        21,
        permission: "ohos.permission.ACCELEROMETER",
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    AccelerometerUncalibrated
    | ...

    /**
     * get the corresponding mapping value.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public enum SensorAccuracy {
    /**
     * The sensor data is unreliable. It is possible that the sensor does not contact with the device to measure.
     *
     * @relation ACCURACY_UNRELIABLE = 0
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
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
        21,
        stagemodelonly: true,
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
        21,
        stagemodelonly: true,
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
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public enum IntervalOption {
    /**
    * SensorNumber option.
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    SensorNumber(Int64)
    /**
    * GameMode option.
    */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    GameMode
    /**
    * UIMode option.
    */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    UIMode
    /**
    * NormalMode option.
    */
    | @!APILevel[
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
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
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var deviceId: Int32

    /**
    * Index of sensors of the same type. By default, it controls default sensors of the sensor type.
    *
    * @relation sensorIndex?: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var sensorIndex: Int32

    /**
    * Options constructor.
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class AccelerometerResponse <: Response {
    /**
    * Acceleration x-axis component.
    *
    * @relation x: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32

    /**
    * Acceleration y-axis component.
    *
    * @relation y: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32
    /**
    * Acceleration z-axis component.
    *
    * @relation z: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class Options {
    /**
    * Sensor event reporting event interval.
    *
    * @relation interval?: number | SensorFrequency;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var interval: IntervalOption

    /**
    * Parameters of sensor on the device.
    *
    * @relation sensorInfoParam?: SensorInfoParam;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var sensorInfoParam: ?SensorInfoParam

    /**
    * Options constructor.
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public open class Response {
    /**
     * The timestamp of the reported sensor data.
     *
     * @relation timestamp: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var timestamp: Int64

    /**
     * The accuracy levels of data reported by a sensor.
     *
     * @relation accuracy: SensorAccuracy
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class AccelerometerUncalibratedResponse <: Response {
    /**
    * Acceleration uncalibrated x-axis component.
    *
    * @relation x: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32

    /**
    * Acceleration uncalibrated y-axis component.
    *
    * @relation y: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32

    /**
    * Acceleration uncalibrated z-axis component.
    *
    * @relation z: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var z: Float32

    /**
    * Acceleration uncalibrated x-axis offset.
    *
    * @relation biasX: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var biasX: Float32

    /**
    * Acceleration uncalibrated y-axis offset.
    *
    * @relation biasY: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var biasY: Float32
    /**
    * Acceleration uncalibrated z-axis offset.
    *
    * @relation biasZ: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class LightResponse <: Response {
    /**
    * Indicates light intensity, in lux.
    *
    * @relation intensity: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var intensity: Float32

    /**
    * Indicates color temperature, in kelvin.
    *
    * @relation colorTemperature?: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var colorTemperature: ?Float32

    /**
    * Indicates infrared luminance, in cd/m2.
    *
    * @relation infraredLuminance?: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class AmbientTemperatureResponse <: Response {
    /**
    * Indicates ambient temperature, in celsius.
    *
    * @relation temperature: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class BarometerResponse <: Response {
    /**
    * Indicates the number of barometer, in hpa.
    *
    * @relation pressure: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class GravityResponse <: Response {
    /**
    * Gravity x-axis component.
    *
    * @relation x: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32
    /**
    * Gravity y-axis component.
    *
    * @relation y: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32
    /**
    * Gravity z-axis component.
    *
    * @relation z: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class GyroscopeResponse <: Response {
    /**
    * Gyroscope x-axis component.
    *
    * @relation x: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32

    /**
    * Gyroscope y-axis component.
    *
    * @relation y: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32

    /**
    * Gyroscope z-axis component.
    *
    * @relation z: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class GyroscopeUncalibratedResponse <: Response {
    /**
    * Gyroscope uncalibrated x-axis component.
    *
    * @relation x: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32

    /**
    * Gyroscope uncalibrated y-axis component.
    *
    * @relation y: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32

    /**
    * Gyroscope uncalibrated z-axis component.
    *
    * @relation z: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var z: Float32

    /**
    * Gyroscope uncalibrated x-axis offset.
    *
    * @relation biasX: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var biasX: Float32

    /**
    * Gyroscope uncalibrated y-axis offset.
    *
    * @relation biasY: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var biasY: Float32

    /**
    * Gyroscope uncalibrated z-axis offset.
    *
    * @relation biasZ: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class HallResponse <: Response {
    /**
    * Indicates hall status, 0 indicates open, and greater than 0 indicates suction.
    *
    * @relation status: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class HeartRateResponse <: Response {
    /**
    * Indicates the number of heart rate.
    *
    * @relation heartRate: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class HumidityResponse <: Response {
    /**
    * Indicates the number of humidity.
    *
    * @relation humidity: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class LinearAccelerometerResponse <: Response {
    /**
    * Linear acceleration x-axis component.
    *
    * @relation x: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32

    /**
    * Linear acceleration y-axis component.
    *
    * @relation y: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32

    /**
    * Linear acceleration z-axis component.
    *
    * @relation z: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class MagneticFieldResponse <: Response {
    /**
    * Magnetic field x-axis component.
    *
    * @relation x: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32

    /**
    * Magnetic field y-axis component.
    *
    * @relation y: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32
    /**
    * Magnetic field z-axis component.
    *
    * @relation z: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class MagneticFieldUncalibratedResponse <: Response {
    /**
    * Magnetic field uncalibrated x-axis component.
    *
    * @relation x: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32

    /**
    * Magnetic field uncalibrated y-axis component.
    *
    * @relation y: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32

    /**
    * Magnetic field uncalibrated z-axis component.
    *
    * @relation z: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var z: Float32

    /**
    * Magnetic field uncalibrated x-axis offset.
    *
    * @relation biasX: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var biasX: Float32

    /**
    * Magnetic field uncalibrated y-axis offset.
    *
    * @relation biasY: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var biasY: Float32

    /**
    * Magnetic field uncalibrated z-axis offset.    *
    *
    * @relation biasZ: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class OrientationResponse <: Response {
    /**
    * The device rotates at an angle around the Z axis.
    *
    * @relation alpha: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var alpha: Float32

    /**
    * The device rotates at an angle around the X axis.
    *
    * @relation beta: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var beta: Float32

    /**
    * The device rotates at an angle around the Y axis.
    *
    * @relation gamma: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class PedometerResponse <: Response {
    /**
    * Indicates the number of steps.
    *
    * relation steps: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
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
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class ProximityResponse <: Response {
    /**
    * Indicates the degree of proximity, event 0 indicates proximity, and greater than 0 indicates distance.
    *
    * relation distance: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class RotationVectorResponse <: Response {
    /**
    * Rotation vector x-axis component.
    *
    * @relation x: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var x: Float32

    /**
    * Rotation vector y-axis component.
    *
    * @relation y: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var y: Float32

    /**
    * Rotation vector z-axis component.
    *
    * @relation z: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var z: Float32

    /**
    * Scalar quantity.
    *
    * @relation w: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class SignificantMotionResponse <: Response {
    /**
    * Indicates the degree of proximity, event 0 indicates proximity, and greater than 0 indicates distance.
    *
    * @relation scalar: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class WearDetectionResponse <: Response {
    /**
    * Indicates the status of wear detection, 1 for wearing, 0 for wearing not.
    *
    * @relation value: number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public class Sensor {
    /**
     * Sensor name.
     *
     * @relation sensorName:string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var sensorName: String

    /**
     * Sensor vendor.
     *
     * @relation vendorName:string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var vendorName: String

    /**
     * Sensor firmware version.
     *
     * @relation firmwareVersion:string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var firmwareVersion: String

    /**
     * Sensor hardware version.
     *
     * @relation hardwareVersion:string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var hardwareVersion: String

    /**
     * Sensor type ID, {@code SensorType}.
     *
     * @relation sensorId:number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var sensorId: Int32

    /**
     * Maximum measurement range of the sensor.
     *
     * @relation maxRange:number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var maxRange: Float32

    /**
     * Minimum sample period allowed, in ns.
     *
     * @relation minSamplePeriod:number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var minSamplePeriod: Int64

    /**
     * Maximum sample period allowed, in ns.
     *
     * @relation maxSamplePeriod:number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var maxSamplePeriod: Int64

    /**
     * Sensor accuracy.
     *
     * @relation precision:number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.Sensor"
    ]
    public var precision: Float32

    /**
     * Sensor power.
     *
     * @relation power:number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onAccelerometer(callback: Callback1Argument<AccelerometerResponse>, option!: ?Options = None): Unit {
    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let interval = option?.interval.value ?? DEFAULT_REPORTING_INTERVAL
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(Accelerometer.getValue(), interval, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    // Due to interval, no need to check type is subscribed
    ON_SENSOR_MANAGER.getOrCreate(Accelerometer).on(callback)
}

/**
* Subscribe to sensor data.
*
* @relation on(type: SensorId.ACCELEROMETER_UNCALIBRATED, callback: Callback<AccelerometerUncalibratedResponse>,options?: Options): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onAccelerometerUncalibrated(callback: Callback1Argument<AccelerometerUncalibratedResponse>, option!: ?Options = None): Unit {
    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let interval = option?.interval.value ?? DEFAULT_REPORTING_INTERVAL
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(AccelerometerUncalibrated.getValue(), interval, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    // Due to interval, no need to check type is subscribed
    ON_SENSOR_MANAGER.getOrCreate(AccelerometerUncalibrated).on(callback)
}

/**
* Subscribe to sensor data.
*
* @relation on(type: SensorId.AMBIENT_LIGHT, callback: Callback<LightResponse>, options?: Options): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onAmbientLight(callback: Callback1Argument<LightResponse>, option!: ?Options = None): Unit {
    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let interval = option?.interval.value ?? DEFAULT_REPORTING_INTERVAL
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(AmbientLight.getValue(), interval, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    // Due to interval, no need to check type is subscribed
    ON_SENSOR_MANAGER.getOrCreate(AmbientLight).on(callback)
}

/**
* Subscribe to sensor data.
*
* @relation on(type: SensorId.AMBIENT_TEMPERATURE, callback: Callback<AmbientTemperatureResponse>,options?: Options): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onAmbientTemperature(callback: Callback1Argument<AmbientTemperatureResponse>, option!: ?Options = None): Unit {
    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let interval = option?.interval.value ?? DEFAULT_REPORTING_INTERVAL
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(AmbientTemperature.getValue(), interval, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    // Due to interval, no need to check type is subscribed
    ON_SENSOR_MANAGER.getOrCreate(AmbientTemperature).on(callback)
}

/**
* Subscribe to sensor data.
*
* @relation on(type: SensorId.BAROMETER, callback: Callback<BarometerResponse>, options?: Options): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onBarometer(callback: Callback1Argument<BarometerResponse>, option!: ?Options = None): Unit {
    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let interval = option?.interval.value ?? DEFAULT_REPORTING_INTERVAL
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(Barometer.getValue(), interval, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    // Due to interval, no need to check type is subscribed
    ON_SENSOR_MANAGER.getOrCreate(Barometer).on(callback)
}

/**
* Subscribe to sensor data.
*
* @relation on(type: SensorId.GRAVITY, callback: Callback<GravityResponse>, options?: Options): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onGravity(callback: Callback1Argument<GravityResponse>, option!: ?Options = None): Unit {
    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let interval = option?.interval.value ?? DEFAULT_REPORTING_INTERVAL
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(Gravity.getValue(), interval, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    // Due to interval, no need to check type is subscribed
    ON_SENSOR_MANAGER.getOrCreate(Gravity).on(callback)
}

/**
* Subscribe to sensor data.
*
* @relation on(type: SensorId.GYROSCOPE, callback: Callback<GyroscopeResponse>, options?: Options): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onGyroscope(callback: Callback1Argument<GyroscopeResponse>, option!: ?Options = None): Unit {
    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let interval = option?.interval.value ?? DEFAULT_REPORTING_INTERVAL
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(Gyroscope.getValue(), interval, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    // Due to interval, no need to check type is subscribed
    ON_SENSOR_MANAGER.getOrCreate(Gyroscope).on(callback)
}

/**
* Subscribe to sensor data.
*
* @relation on(type: SensorId.GYROSCOPE_UNCALIBRATED, callback: Callback<GyroscopeUncalibratedResponse>, options?: Options): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onGyroscopeUncalibrated(callback: Callback1Argument<GyroscopeUncalibratedResponse>, option!: ?Options = None): Unit {
    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let interval = option?.interval.value ?? DEFAULT_REPORTING_INTERVAL
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(GyroscopeUncalibrated.getValue(), interval, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    // Due to interval, no need to check type is subscribed
    ON_SENSOR_MANAGER.getOrCreate(GyroscopeUncalibrated).on(callback)
}

/**
* Subscribe to sensor data.
*
* @relation on(type: SensorId.HALL, callback: Callback<HallResponse>, options?: Options): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onHall(callback: Callback1Argument<HallResponse>, option!: ?Options = None): Unit {
    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let interval = option?.interval.value ?? DEFAULT_REPORTING_INTERVAL
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(Hall.getValue(), interval, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    // Due to interval, no need to check type is subscribed
    ON_SENSOR_MANAGER.getOrCreate(Hall).on(callback)
}

/**
* Subscribe to sensor data.
*
* @relation on(type: SensorId.HEART_RATE, callback: Callback<HeartRateResponse>, options?: Options): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onHeartRate(callback: Callback1Argument<HeartRateResponse>, option!: ?Options = None): Unit {
    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let interval = option?.interval.value ?? DEFAULT_REPORTING_INTERVAL
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(HeartRate.getValue(), interval, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    // Due to interval, no need to check type is subscribed
    ON_SENSOR_MANAGER.getOrCreate(HeartRate).on(callback)
}

/**
* Subscribe to sensor data.
*
* @relation on(type: SensorId.HUMIDITY, callback: Callback<HumidityResponse>, options?: Options): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onHumidity(callback: Callback1Argument<HumidityResponse>, option!: ?Options = None): Unit {
    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let interval = option?.interval.value ?? DEFAULT_REPORTING_INTERVAL
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(Humidity.getValue(), interval, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    // Due to interval, no need to check type is subscribed
    ON_SENSOR_MANAGER.getOrCreate(Humidity).on(callback)
}

/**
* Subscribe to sensor data.
*
* @relation on(type: SensorId.LINEAR_ACCELEROMETER, callback: Callback<LinearAccelerometerResponse>, options?: Options): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onLinearAccelerometer(callback: Callback1Argument<LinearAccelerometerResponse>, option!: ?Options = None): Unit {
    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let interval = option?.interval.value ?? DEFAULT_REPORTING_INTERVAL
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(LinearAccelerometer.getValue(), interval, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    // Due to interval, no need to check type is subscribed
    ON_SENSOR_MANAGER.getOrCreate(LinearAccelerometer).on(callback)
}

/**
* Subscribe to sensor data.
*
* @relation on(type: SensorId.MAGNETIC_FIELD, callback: Callback<MagneticFieldResponse>, options?: Options): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onMagneticField(callback: Callback1Argument<MagneticFieldResponse>, option!: ?Options = None): Unit {
    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let interval = option?.interval.value ?? DEFAULT_REPORTING_INTERVAL
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(MagneticField.getValue(), interval, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    // Due to interval, no need to check type is subscribed
    ON_SENSOR_MANAGER.getOrCreate(MagneticField).on(callback)
}

/**
* Subscribe to sensor data.
*
* @relation on(type: SensorId.MAGNETIC_FIELD_UNCALIBRATED, callback: Callback<MagneticFieldUncalibratedResponse>, options?: Options): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onMagneticFieldUncalibrated(callback: Callback1Argument<MagneticFieldUncalibratedResponse>, option!: ?Options = None): Unit {
    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let interval = option?.interval.value ?? DEFAULT_REPORTING_INTERVAL
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(MagneticFieldUncalibrated.getValue(), interval, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    // Due to interval, no need to check type is subscribed
    ON_SENSOR_MANAGER.getOrCreate(MagneticFieldUncalibrated).on(callback)
}

/**
* Subscribe to sensor data.
*
* @relation on(type: SensorId.ORIENTATION, callback: Callback<OrientationResponse>, options?: Options): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onOrientation(callback: Callback1Argument<OrientationResponse>, option!: ?Options = None): Unit {
    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let interval = option?.interval.value ?? DEFAULT_REPORTING_INTERVAL
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(Orientation.getValue(), interval, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    // Due to interval, no need to check type is subscribed
    ON_SENSOR_MANAGER.getOrCreate(Orientation).on(callback)
}

/**
* Subscribe to sensor data.
*
* @relation on(type: SensorId.PEDOMETER, callback: Callback<PedometerResponse>, options?: Options): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onPedometer(callback: Callback1Argument<PedometerResponse>, option!: ?Options = None): Unit {
    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let interval = option?.interval.value ?? DEFAULT_REPORTING_INTERVAL
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(Pedometer.getValue(), interval, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    // Due to interval, no need to check type is subscribed
    ON_SENSOR_MANAGER.getOrCreate(Pedometer).on(callback)
}

/**
* Subscribe to sensor data.
*
* @relation on(type: SensorId.PEDOMETER_DETECTION, callback: Callback<PedometerDetectionResponse>, options?: Options): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onPedometerDetection(callback: Callback1Argument<PedometerDetectionResponse>, option!: ?Options = None): Unit {
    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let interval = option?.interval.value ?? DEFAULT_REPORTING_INTERVAL
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(PedometerDetection.getValue(), interval, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    // Due to interval, no need to check type is subscribed
    ON_SENSOR_MANAGER.getOrCreate(PedometerDetection).on(callback)
}

/**
* Subscribe to sensor data.
*
* @relation on(type: SensorId.PROXIMITY, callback: Callback<ProximityResponse>, options?: Options): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onProximity(callback: Callback1Argument<ProximityResponse>, option!: ?Options = None): Unit {
    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let interval = option?.interval.value ?? DEFAULT_REPORTING_INTERVAL
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(Proximity.getValue(), interval, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    // Due to interval, no need to check type is subscribed
    ON_SENSOR_MANAGER.getOrCreate(Proximity).on(callback)
}

/**
* Subscribe to sensor data.
*
* @relation on(type: SensorId.ROTATION_VECTOR, callback: Callback<RotationVectorResponse>, options?: Options): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onRotationVector(callback: Callback1Argument<RotationVectorResponse>, option!: ?Options = None): Unit {
    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let interval = option?.interval.value ?? DEFAULT_REPORTING_INTERVAL
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(RotationVector.getValue(), interval, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    // Due to interval, no need to check type is subscribed
    ON_SENSOR_MANAGER.getOrCreate(RotationVector).on(callback)
}

/**
* Subscribe to sensor data.
*
* @relation on(type: SensorId.SIGNIFICANT_MOTION, callback: Callback<SignificantMotionResponse>, options?: Options): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onSignificantMotion(callback: Callback1Argument<SignificantMotionResponse>, option!: ?Options = None): Unit {
    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let interval = option?.interval.value ?? DEFAULT_REPORTING_INTERVAL
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(SignificantMotion.getValue(), interval, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    // Due to interval, no need to check type is subscribed
    ON_SENSOR_MANAGER.getOrCreate(SignificantMotion).on(callback)
}

/**
* Subscribe to sensor data.
*
* @relation on(type: SensorId.WEAR_DETECTION, callback: Callback<WearDetectionResponse>, options?: Options): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onWearDetection(callback: Callback1Argument<WearDetectionResponse>, option!: ?Options = None): Unit {
    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let interval = option?.interval.value ?? DEFAULT_REPORTING_INTERVAL
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(WearDetection.getValue(), interval, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    // Due to interval, no need to check type is subscribed
    ON_SENSOR_MANAGER.getOrCreate(WearDetection).on(callback)
}

/**
* Subscribe to sensor data once.
*
* @relation once(type: SensorId.ACCELEROMETER, callback: Callback<AccelerometerResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onceAccelerometer(callback: Callback1Argument<AccelerometerResponse>): Unit {
    if (ON_SENSOR_MANAGER.isSensorSubscribed(Accelerometer)) {
        ONCE_SENSOR_MANAGER.getOrCreate(Accelerometer).on(callback)
        return
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(Accelerometer.getValue(), DEFAULT_REPORTING_INTERVAL, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }

    ONCE_SENSOR_MANAGER.getOrCreate(Accelerometer).on(callback)
}

/**
* Subscribe to sensor data once.
*
* @relation once(type: SensorId.ACCELEROMETER_UNCALIBRATED, callback: Callback<AccelerometerUncalibratedResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onceAccelerometerUncalibrated(callback: Callback1Argument<AccelerometerUncalibratedResponse>): Unit {
    if (ON_SENSOR_MANAGER.isSensorSubscribed(AccelerometerUncalibrated)) {
        ONCE_SENSOR_MANAGER.getOrCreate(AccelerometerUncalibrated).on(callback)
        return
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(AccelerometerUncalibrated.getValue(), DEFAULT_REPORTING_INTERVAL, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }

    ONCE_SENSOR_MANAGER.getOrCreate(AccelerometerUncalibrated).on(callback)
}

/**
* Subscribe to sensor data once.
*
* @relation once(type: SensorId.AMBIENT_LIGHT, callback: Callback<LightResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onceAmbientLight(callback: Callback1Argument<LightResponse>): Unit {
    if (ON_SENSOR_MANAGER.isSensorSubscribed(AmbientLight)) {
        ONCE_SENSOR_MANAGER.getOrCreate(AmbientLight).on(callback)
        return
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(AmbientLight.getValue(), DEFAULT_REPORTING_INTERVAL, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }

    ONCE_SENSOR_MANAGER.getOrCreate(AmbientLight).on(callback)
}

/**
* Subscribe to sensor data once.
*
* @relation once(type: SensorId.AMBIENT_TEMPERATURE, callback: Callback<AmbientTemperatureResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onceAmbientTemperature(callback: Callback1Argument<AmbientTemperatureResponse>): Unit {
    if (ON_SENSOR_MANAGER.isSensorSubscribed(AmbientTemperature)) {
        ONCE_SENSOR_MANAGER.getOrCreate(AmbientTemperature).on(callback)
        return
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(AmbientTemperature.getValue(), DEFAULT_REPORTING_INTERVAL, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }

    ONCE_SENSOR_MANAGER.getOrCreate(AmbientTemperature).on(callback)
}

/**
* Subscribe to sensor data once.
*
* @relation once(type: SensorId.BAROMETER, callback: Callback<BarometerResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onceBarometer(callback: Callback1Argument<BarometerResponse>): Unit {
    if (ON_SENSOR_MANAGER.isSensorSubscribed(Barometer)) {
        ONCE_SENSOR_MANAGER.getOrCreate(Barometer).on(callback)
        return
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(Barometer.getValue(), DEFAULT_REPORTING_INTERVAL, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }

    ONCE_SENSOR_MANAGER.getOrCreate(Barometer).on(callback)
}

/**
* Subscribe to sensor data once.
*
* @relation once(type: SensorId.GRAVITY, callback: Callback<GravityResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onceGravity(callback: Callback1Argument<GravityResponse>): Unit {
    if (ON_SENSOR_MANAGER.isSensorSubscribed(Gravity)) {
        ONCE_SENSOR_MANAGER.getOrCreate(Gravity).on(callback)
        return
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(Gravity.getValue(), DEFAULT_REPORTING_INTERVAL, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }

    ONCE_SENSOR_MANAGER.getOrCreate(Gravity).on(callback)
}

/**
* Subscribe to sensor data once.
*
* @relation once(type: SensorId.GYROSCOPE, callback: Callback<GyroscopeResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onceGyroscope(callback: Callback1Argument<GyroscopeResponse>): Unit {
    if (ON_SENSOR_MANAGER.isSensorSubscribed(Gyroscope)) {
        ONCE_SENSOR_MANAGER.getOrCreate(Gyroscope).on(callback)
        return
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(Gyroscope.getValue(), DEFAULT_REPORTING_INTERVAL, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }

    ONCE_SENSOR_MANAGER.getOrCreate(Gyroscope).on(callback)
}

/**
* Subscribe to sensor data once.
*
* @relation once(type: SensorId.GYROSCOPE_UNCALIBRATED, callback: Callback<GyroscopeUncalibratedResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onceGyroscopeUncalibrated(callback: Callback1Argument<GyroscopeUncalibratedResponse>): Unit {
    if (ON_SENSOR_MANAGER.isSensorSubscribed(GyroscopeUncalibrated)) {
        ONCE_SENSOR_MANAGER.getOrCreate(GyroscopeUncalibrated).on(callback)
        return
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(GyroscopeUncalibrated.getValue(), DEFAULT_REPORTING_INTERVAL, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }

    ONCE_SENSOR_MANAGER.getOrCreate(GyroscopeUncalibrated).on(callback)
}

/**
* Subscribe to sensor data once.
*
* @relation once(type: SensorId.HALL, callback: Callback<HallResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onceHall(callback: Callback1Argument<HallResponse>): Unit {
    if (ON_SENSOR_MANAGER.isSensorSubscribed(Hall)) {
        ONCE_SENSOR_MANAGER.getOrCreate(Hall).on(callback)
        return
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(Hall.getValue(), DEFAULT_REPORTING_INTERVAL, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }

    ONCE_SENSOR_MANAGER.getOrCreate(Hall).on(callback)
}

/**
* Subscribe to sensor data once.
*
* @relation once(type: SensorId.HEART_RATE, callback: Callback<HeartRateResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onceHeartRate(callback: Callback1Argument<HeartRateResponse>): Unit {
    if (ON_SENSOR_MANAGER.isSensorSubscribed(HeartRate)) {
        ONCE_SENSOR_MANAGER.getOrCreate(HeartRate).on(callback)
        return
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(HeartRate.getValue(), DEFAULT_REPORTING_INTERVAL, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }

    ONCE_SENSOR_MANAGER.getOrCreate(HeartRate).on(callback)
}

/**
* Subscribe to sensor data once.
*
* @relation once(type: SensorId.HUMIDITY, callback: Callback<HumidityResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onceHumidity(callback: Callback1Argument<HumidityResponse>): Unit {
    if (ON_SENSOR_MANAGER.isSensorSubscribed(Humidity)) {
        ONCE_SENSOR_MANAGER.getOrCreate(Humidity).on(callback)
        return
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(Humidity.getValue(), DEFAULT_REPORTING_INTERVAL, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }

    ONCE_SENSOR_MANAGER.getOrCreate(Humidity).on(callback)
}

/**
* Subscribe to sensor data once.
*
* @relation once(type: SensorId.LINEAR_ACCELEROMETER, callback: Callback<LinearAccelerometerResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onceLinearAccelerometer(callback: Callback1Argument<LinearAccelerometerResponse>): Unit {
    if (ON_SENSOR_MANAGER.isSensorSubscribed(LinearAccelerometer)) {
        ONCE_SENSOR_MANAGER.getOrCreate(LinearAccelerometer).on(callback)
        return
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(LinearAccelerometer.getValue(), DEFAULT_REPORTING_INTERVAL, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }

    ONCE_SENSOR_MANAGER.getOrCreate(LinearAccelerometer).on(callback)
}

/**
* Subscribe to sensor data once.
*
* @relation once(type: SensorId.MAGNETIC_FIELD, callback: Callback<MagneticFieldResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onceMagneticField(callback: Callback1Argument<MagneticFieldResponse>): Unit {
    if (ON_SENSOR_MANAGER.isSensorSubscribed(MagneticField)) {
        ONCE_SENSOR_MANAGER.getOrCreate(MagneticField).on(callback)
        return
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(MagneticField.getValue(), DEFAULT_REPORTING_INTERVAL, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }

    ONCE_SENSOR_MANAGER.getOrCreate(MagneticField).on(callback)
}

/**
* Subscribe to sensor data once.
*
* @relation once(type: SensorId.MAGNETIC_FIELD_UNCALIBRATED, callback: Callback<MagneticFieldUncalibratedResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onceMagneticFieldUncalibrated(callback: Callback1Argument<MagneticFieldUncalibratedResponse>): Unit {
    if (ON_SENSOR_MANAGER.isSensorSubscribed(MagneticFieldUncalibrated)) {
        ONCE_SENSOR_MANAGER.getOrCreate(MagneticFieldUncalibrated).on(callback)
        return
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(MagneticFieldUncalibrated.getValue(), DEFAULT_REPORTING_INTERVAL, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }

    ONCE_SENSOR_MANAGER.getOrCreate(MagneticFieldUncalibrated).on(callback)
}

/**
* Subscribe to sensor data once.
*
* @relation once(type: SensorId.ORIENTATION, callback: Callback<OrientationResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onceOrientation(callback: Callback1Argument<OrientationResponse>): Unit {
    if (ON_SENSOR_MANAGER.isSensorSubscribed(Orientation)) {
        ONCE_SENSOR_MANAGER.getOrCreate(Orientation).on(callback)
        return
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(Orientation.getValue(), DEFAULT_REPORTING_INTERVAL, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }

    ONCE_SENSOR_MANAGER.getOrCreate(Orientation).on(callback)
}

/**
* Subscribe to sensor data once.
*
* @relation once(type: SensorId.PEDOMETER, callback: Callback<PedometerResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func oncePedometer(callback: Callback1Argument<PedometerResponse>): Unit {
    if (ON_SENSOR_MANAGER.isSensorSubscribed(Pedometer)) {
        ONCE_SENSOR_MANAGER.getOrCreate(Pedometer).on(callback)
        return
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(Pedometer.getValue(), DEFAULT_REPORTING_INTERVAL, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }

    ONCE_SENSOR_MANAGER.getOrCreate(Pedometer).on(callback)
}

/**
* Subscribe to sensor data once.
*
* @relation once(type: SensorId.PEDOMETER_DETECTION, callback: Callback<PedometerDetectionResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func oncePedometerDetection(callback: Callback1Argument<PedometerDetectionResponse>): Unit {
    if (ON_SENSOR_MANAGER.isSensorSubscribed(PedometerDetection)) {
        ONCE_SENSOR_MANAGER.getOrCreate(PedometerDetection).on(callback)
        return
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(PedometerDetection.getValue(), DEFAULT_REPORTING_INTERVAL, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }

    ONCE_SENSOR_MANAGER.getOrCreate(PedometerDetection).on(callback)
}

/**
* Subscribe to sensor data once.
*
* @relation once(type: SensorId.PROXIMITY, callback: Callback<ProximityResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onceProximity(callback: Callback1Argument<ProximityResponse>): Unit {
    if (ON_SENSOR_MANAGER.isSensorSubscribed(Proximity)) {
        ONCE_SENSOR_MANAGER.getOrCreate(Proximity).on(callback)
        return
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(Proximity.getValue(), DEFAULT_REPORTING_INTERVAL, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }

    ONCE_SENSOR_MANAGER.getOrCreate(Proximity).on(callback)
}

/**
* Subscribe to sensor data once.
*
* @relation once(type: SensorId.ROTATION_VECTOR, callback: Callback<RotationVectorResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onceRotationVector(callback: Callback1Argument<RotationVectorResponse>): Unit {
    if (ON_SENSOR_MANAGER.isSensorSubscribed(RotationVector)) {
        ONCE_SENSOR_MANAGER.getOrCreate(RotationVector).on(callback)
        return
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(RotationVector.getValue(), DEFAULT_REPORTING_INTERVAL, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }

    ONCE_SENSOR_MANAGER.getOrCreate(RotationVector).on(callback)
}

/**
* Subscribe to sensor data once.
*
* @relation once(type: SensorId.SIGNIFICANT_MOTION, callback: Callback<SignificantMotionResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onceSignificantMotion(callback: Callback1Argument<SignificantMotionResponse>): Unit {
    if (ON_SENSOR_MANAGER.isSensorSubscribed(SignificantMotion)) {
        ONCE_SENSOR_MANAGER.getOrCreate(SignificantMotion).on(callback)
        return
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(SignificantMotion.getValue(), DEFAULT_REPORTING_INTERVAL, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }

    ONCE_SENSOR_MANAGER.getOrCreate(SignificantMotion).on(callback)
}

/**
* Subscribe to sensor data once.
*
* @relation once(type: SensorId.WEAR_DETECTION, callback: Callback<WearDetectionResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func onceWearDetection(callback: Callback1Argument<WearDetectionResponse>): Unit {
    if (ON_SENSOR_MANAGER.isSensorSubscribed(WearDetection)) {
        ONCE_SENSOR_MANAGER.getOrCreate(WearDetection).on(callback)
        return
    }

    let lambdaData = Callback1Param<CPointer<CSensorCallbackData>, Unit>(dataCallbackImpl)
    let ret: Int32 = unsafe { FfiSensorSubscribeSensor(WearDetection.getValue(), DEFAULT_REPORTING_INTERVAL, lambdaData.getID()) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }

    ONCE_SENSOR_MANAGER.getOrCreate(WearDetection).on(callback)
}

/**
* Unsubscribe to sensor data.
*
* @relation off(type: SensorId.ACCELEROMETER, callback?: Callback<AccelerometerResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func offAccelerometer(callback!: ?Callback1Argument<AccelerometerResponse> = None): Unit {
    if (!ON_SENSOR_MANAGER.isSensorSubscribed(Accelerometer)) {
        return
    }

    let size = match (callback) {
        case Some(v) => removeCallback(Accelerometer, v)
        case None => removeAllCallback(Accelerometer)
    }

    if (size > 0) {
        return
    }

    let ret = unsafe { FfiSensorUnSubscribeSensor(Accelerometer.getValue()) }
    if (ret == ERR_PARAMETER_ERROR || ret == ERR_NO_PERMISSION) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
}

/**
* Unsubscribe to sensor data.
*
* @relation off(type: SensorId.ACCELEROMETER_UNCALIBRATED, callback?: Callback<AccelerometerUncalibratedResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func offAccelerometerUncalibrated(callback!: ?Callback1Argument<AccelerometerUncalibratedResponse> = None): Unit {
    if (!ON_SENSOR_MANAGER.isSensorSubscribed(AccelerometerUncalibrated)) {
        return
    }

    let size = match (callback) {
        case Some(v) => removeCallback(AccelerometerUncalibrated, v)
        case None => removeAllCallback(AccelerometerUncalibrated)
    }

    if (size > 0) {
        return
    }

    let ret = unsafe { FfiSensorUnSubscribeSensor(AccelerometerUncalibrated.getValue()) }
    if (ret == ERR_PARAMETER_ERROR || ret == ERR_NO_PERMISSION) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
}

/**
* Unsubscribe to sensor data.
*
* @relation off(type: SensorId.AMBIENT_LIGHT, callback?: Callback<LightResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func offAmbientLight(callback!: ?Callback1Argument<LightResponse> = None): Unit {
    if (!ON_SENSOR_MANAGER.isSensorSubscribed(AmbientLight)) {
        return
    }

    let size = match (callback) {
        case Some(v) => removeCallback(AmbientLight, v)
        case None => removeAllCallback(AmbientLight)
    }

    if (size > 0) {
        return
    }

    let ret = unsafe { FfiSensorUnSubscribeSensor(AmbientLight.getValue()) }
    if (ret == ERR_PARAMETER_ERROR || ret == ERR_NO_PERMISSION) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
}

/**
* Unsubscribe to sensor data.
*
* @relation off(type: SensorId.AMBIENT_TEMPERATURE, callback?: Callback<AmbientTemperatureResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func offAmbientTemperature(callback!: ?Callback1Argument<AmbientTemperatureResponse> = None): Unit {
    if (!ON_SENSOR_MANAGER.isSensorSubscribed(AmbientTemperature)) {
        return
    }

    let size = match (callback) {
        case Some(v) => removeCallback(AmbientTemperature, v)
        case None => removeAllCallback(AmbientTemperature)
    }

    if (size > 0) {
        return
    }

    let ret = unsafe { FfiSensorUnSubscribeSensor(AmbientTemperature.getValue()) }
    if (ret == ERR_PARAMETER_ERROR || ret == ERR_NO_PERMISSION) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
}

/**
* Unsubscribe to sensor data.
*
* @relation off(type: SensorId.BAROMETER, callback?: Callback<BarometerResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func offBarometer(callback!: ?Callback1Argument<BarometerResponse> = None): Unit {
    if (!ON_SENSOR_MANAGER.isSensorSubscribed(Barometer)) {
        return
    }

    let size = match (callback) {
        case Some(v) => removeCallback(Barometer, v)
        case None => removeAllCallback(Barometer)
    }

    if (size > 0) {
        return
    }

    let ret = unsafe { FfiSensorUnSubscribeSensor(Barometer.getValue()) }
    if (ret == ERR_PARAMETER_ERROR || ret == ERR_NO_PERMISSION) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
}

/**
* Unsubscribe to sensor data.
*
* @relation off(type: SensorId.GRAVITY, callback?: Callback<GravityResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func offGravity(callback!: ?Callback1Argument<GravityResponse> = None): Unit {
    if (!ON_SENSOR_MANAGER.isSensorSubscribed(Gravity)) {
        return
    }

    let size = match (callback) {
        case Some(v) => removeCallback(Gravity, v)
        case None => removeAllCallback(Gravity)
    }

    if (size > 0) {
        return
    }

    let ret = unsafe { FfiSensorUnSubscribeSensor(Gravity.getValue()) }
    if (ret == ERR_PARAMETER_ERROR || ret == ERR_NO_PERMISSION) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
}

/**
* Unsubscribe to sensor data.
*
* @relation off(type: SensorId.GYROSCOPE, callback?: Callback<GyroscopeResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func offGyroscope(callback!: ?Callback1Argument<GyroscopeResponse> = None): Unit {
    if (!ON_SENSOR_MANAGER.isSensorSubscribed(Gyroscope)) {
        return
    }

    let size = match (callback) {
        case Some(v) => removeCallback(Gyroscope, v)
        case None => removeAllCallback(Gyroscope)
    }

    if (size > 0) {
        return
    }

    let ret = unsafe { FfiSensorUnSubscribeSensor(Gyroscope.getValue()) }
    if (ret == ERR_PARAMETER_ERROR || ret == ERR_NO_PERMISSION) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
}

/**
* Unsubscribe to sensor data.
*
* @relation off(type: SensorId.GYROSCOPE_UNCALIBRATED, callback?: Callback<GyroscopeUncalibratedResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func offGyroscopeUncalibrated(callback!: ?Callback1Argument<GyroscopeUncalibratedResponse> = None): Unit {
    if (!ON_SENSOR_MANAGER.isSensorSubscribed(GyroscopeUncalibrated)) {
        return
    }

    let size = match (callback) {
        case Some(v) => removeCallback(GyroscopeUncalibrated, v)
        case None => removeAllCallback(GyroscopeUncalibrated)
    }

    if (size > 0) {
        return
    }

    let ret = unsafe { FfiSensorUnSubscribeSensor(GyroscopeUncalibrated.getValue()) }
    if (ret == ERR_PARAMETER_ERROR || ret == ERR_NO_PERMISSION) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
}

/**
* Unsubscribe to sensor data.
*
* @relation off(type: SensorId.HALL, callback?: Callback<HallResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func offHall(callback!: ?Callback1Argument<HallResponse> = None): Unit {
    if (!ON_SENSOR_MANAGER.isSensorSubscribed(Hall)) {
        return
    }

    let size = match (callback) {
        case Some(v) => removeCallback(Hall, v)
        case None => removeAllCallback(Hall)
    }

    if (size > 0) {
        return
    }

    let ret = unsafe { FfiSensorUnSubscribeSensor(Hall.getValue()) }
    if (ret == ERR_PARAMETER_ERROR || ret == ERR_NO_PERMISSION) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
}

/**
* Unsubscribe to sensor data.
*
* @relation off(type: SensorId.HEART_RATE, callback?: Callback<HeartRateResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func offHeartRate(callback!: ?Callback1Argument<HeartRateResponse> = None): Unit {
    if (!ON_SENSOR_MANAGER.isSensorSubscribed(HeartRate)) {
        return
    }

    let size = match (callback) {
        case Some(v) => removeCallback(HeartRate, v)
        case None => removeAllCallback(HeartRate)
    }

    if (size > 0) {
        return
    }

    let ret = unsafe { FfiSensorUnSubscribeSensor(HeartRate.getValue()) }
    if (ret == ERR_PARAMETER_ERROR || ret == ERR_NO_PERMISSION) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
}

/**
* Unsubscribe to sensor data.
*
* @relation off(type: SensorId.HUMIDITY, callback?: Callback<HumidityResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func offHumidity(callback!: ?Callback1Argument<HumidityResponse> = None): Unit {
    if (!ON_SENSOR_MANAGER.isSensorSubscribed(Humidity)) {
        return
    }

    let size = match (callback) {
        case Some(v) => removeCallback(Humidity, v)
        case None => removeAllCallback(Humidity)
    }

    if (size > 0) {
        return
    }

    let ret = unsafe { FfiSensorUnSubscribeSensor(Humidity.getValue()) }
    if (ret == ERR_PARAMETER_ERROR || ret == ERR_NO_PERMISSION) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
}

/**
* Unsubscribe to sensor data.
*
* @relation off(type: SensorId.LINEAR_ACCELEROMETER, callback?: Callback<LinearAccelerometerResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func offLinearAccelerometer(callback!: ?Callback1Argument<LinearAccelerometerResponse> = None): Unit {
    if (!ON_SENSOR_MANAGER.isSensorSubscribed(LinearAccelerometer)) {
        return
    }

    let size = match (callback) {
        case Some(v) => removeCallback(LinearAccelerometer, v)
        case None => removeAllCallback(LinearAccelerometer)
    }

    if (size > 0) {
        return
    }

    let ret = unsafe { FfiSensorUnSubscribeSensor(LinearAccelerometer.getValue()) }
    if (ret == ERR_PARAMETER_ERROR || ret == ERR_NO_PERMISSION) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
}

/**
* Unsubscribe to sensor data.
*
* @relation off(type: SensorId.MAGNETIC_FIELD, callback?: Callback<MagneticFieldResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func offMagneticField(callback!: ?Callback1Argument<MagneticFieldResponse> = None): Unit {
    if (!ON_SENSOR_MANAGER.isSensorSubscribed(MagneticField)) {
        return
    }

    let size = match (callback) {
        case Some(v) => removeCallback(MagneticField, v)
        case None => removeAllCallback(MagneticField)
    }

    if (size > 0) {
        return
    }

    let ret = unsafe { FfiSensorUnSubscribeSensor(MagneticField.getValue()) }
    if (ret == ERR_PARAMETER_ERROR || ret == ERR_NO_PERMISSION) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
}

/**
* Unsubscribe to sensor data.
*
* @relation off(type: SensorId.MAGNETIC_FIELD_UNCALIBRATED, callback?: Callback<MagneticFieldUncalibratedResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func offMagneticFieldUncalibrated(callback!: ?Callback1Argument<MagneticFieldUncalibratedResponse> = None): Unit {
    if (!ON_SENSOR_MANAGER.isSensorSubscribed(MagneticFieldUncalibrated)) {
        return
    }

    let size = match (callback) {
        case Some(v) => removeCallback(MagneticFieldUncalibrated, v)
        case None => removeAllCallback(MagneticFieldUncalibrated)
    }

    if (size > 0) {
        return
    }

    let ret = unsafe { FfiSensorUnSubscribeSensor(MagneticFieldUncalibrated.getValue()) }
    if (ret == ERR_PARAMETER_ERROR || ret == ERR_NO_PERMISSION) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
}

/**
* Unsubscribe to sensor data.
*
* @relation off(type: SensorId.ORIENTATION, callback?: Callback<OrientationResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func offOrientation(callback!: ?Callback1Argument<OrientationResponse> = None): Unit {
    if (!ON_SENSOR_MANAGER.isSensorSubscribed(Orientation)) {
        return
    }

    let size = match (callback) {
        case Some(v) => removeCallback(Orientation, v)
        case None => removeAllCallback(Orientation)
    }

    if (size > 0) {
        return
    }

    let ret = unsafe { FfiSensorUnSubscribeSensor(Orientation.getValue()) }
    if (ret == ERR_PARAMETER_ERROR || ret == ERR_NO_PERMISSION) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
}

/**
* Unsubscribe to sensor data.
*
* @relation off(type: SensorId.PEDOMETER, callback?: Callback<PedometerResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func offPedometer(callback!: ?Callback1Argument<PedometerResponse> = None): Unit {
    if (!ON_SENSOR_MANAGER.isSensorSubscribed(Pedometer)) {
        return
    }

    let size = match (callback) {
        case Some(v) => removeCallback(Pedometer, v)
        case None => removeAllCallback(Pedometer)
    }

    if (size > 0) {
        return
    }

    let ret = unsafe { FfiSensorUnSubscribeSensor(Pedometer.getValue()) }
    if (ret == ERR_PARAMETER_ERROR || ret == ERR_NO_PERMISSION) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
}

/**
* Unsubscribe to sensor data.
*
* @relation off(type: SensorId.PEDOMETER_DETECTION, callback?: Callback<PedometerDetectionResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func offPedometerDetection(callback!: ?Callback1Argument<PedometerDetectionResponse> = None): Unit {
    if (!ON_SENSOR_MANAGER.isSensorSubscribed(PedometerDetection)) {
        return
    }

    let size = match (callback) {
        case Some(v) => removeCallback(PedometerDetection, v)
        case None => removeAllCallback(PedometerDetection)
    }

    if (size > 0) {
        return
    }

    let ret = unsafe { FfiSensorUnSubscribeSensor(PedometerDetection.getValue()) }
    if (ret == ERR_PARAMETER_ERROR || ret == ERR_NO_PERMISSION) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
}


/**
* Unsubscribe to sensor data.
*
* @relation off(type: SensorId.PROXIMITY, callback?: Callback<ProximityResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func offProximity(callback!: ?Callback1Argument<ProximityResponse> = None): Unit {
    if (!ON_SENSOR_MANAGER.isSensorSubscribed(Proximity)) {
        return
    }

    let size = match (callback) {
        case Some(v) => removeCallback(Proximity, v)
        case None => removeAllCallback(Proximity)
    }

    if (size > 0) {
        return
    }

    let ret = unsafe { FfiSensorUnSubscribeSensor(Proximity.getValue()) }
    if (ret == ERR_PARAMETER_ERROR || ret == ERR_NO_PERMISSION) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
}

/**
* Unsubscribe to sensor data.
*
* @relation off(type: SensorId.ROTATION_VECTOR, callback?: Callback<RotationVectorResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func offRotationVector(callback!: ?Callback1Argument<RotationVectorResponse> = None): Unit {
    if (!ON_SENSOR_MANAGER.isSensorSubscribed(RotationVector)) {
        return
    }

    let size = match (callback) {
        case Some(v) => removeCallback(RotationVector, v)
        case None => removeAllCallback(RotationVector)
    }

    if (size > 0) {
        return
    }

    let ret = unsafe { FfiSensorUnSubscribeSensor(RotationVector.getValue()) }
    if (ret == ERR_PARAMETER_ERROR || ret == ERR_NO_PERMISSION) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
}

/**
* Unsubscribe to sensor data.
*
* @relation off(type: SensorId.SIGNIFICANT_MOTION, callback?: Callback<SignificantMotionResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func offSignificantMotion(callback!: ?Callback1Argument<SignificantMotionResponse> = None): Unit {
    if (!ON_SENSOR_MANAGER.isSensorSubscribed(SignificantMotion)) {
        return
    }

    let size = match (callback) {
        case Some(v) => removeCallback(SignificantMotion, v)
        case None => removeAllCallback(SignificantMotion)
    }

    if (size > 0) {
        return
    }

    let ret = unsafe { FfiSensorUnSubscribeSensor(SignificantMotion.getValue()) }
    if (ret == ERR_PARAMETER_ERROR || ret == ERR_NO_PERMISSION) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
}

/**
* Unsubscribe to sensor data.
*
* @relation off(type: SensorId.WEAR_DETECTION, callback?: Callback<WearDetectionResponse>): void;
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.Sensor"
]
public func offWearDetection(callback!: ?Callback1Argument<WearDetectionResponse> = None): Unit {
    if (!ON_SENSOR_MANAGER.isSensorSubscribed(WearDetection)) {
        return
    }

    let size = match (callback) {
        case Some(v) => removeCallback(WearDetection, v)
        case None => removeAllCallback(WearDetection)
    }

    if (size > 0) {
        return
    }

    let ret = unsafe { FfiSensorUnSubscribeSensor(WearDetection.getValue()) }
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
    21,
    stagemodelonly: true,
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
    21,
    stagemodelonly: true,
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
