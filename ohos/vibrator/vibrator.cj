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

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

package ohos.vibrator

import ohos.business_exception.{BusinessException, ERR_PARAMETER_ERROR, getUniversalErrorMsg}
import ohos.ffi.{SUCCESS_CODE}
import std.collection.HashMap
import ohos.file.fs.FileIo
import ohos.labels.{APILevel}
import std.deriving.Derive

/**
 * The vibrate effect type.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Sensors.MiscDevice"
]
public interface VibrateEffect {}

/**
 * Vibrate continuously for a period of time at the default intensity of the system.
 */
protected class VibrateTime <: VibrateEffect {
    /**
     * The duration of the vibration, in ms.
     */
    protected var duration: Int32

    /**
    * VibrateTime constructor.
    *
    * @param { Int32 } duration - The duration of the vibration, in ms.
    */
    protected init(duration: Int32) {
        this.duration = duration
    }
}

/**
* Preset vibration type vibration effect.
*/
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Sensors.MiscDevice"
]
public class VibratePreset <: VibrateEffect {
    /**
     * Preset type vibration.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var effectId: String
    /**
     * The number of vibration repetitions.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var count: Int32
    /**
     * The intensity of vibration effect.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var intensity: Int32

    /**
    * VibratePreset constructor.
    *
    * @param { String } effectId - Preset type vibration.
    * @param { Int32 } [ count ] - The number of vibration repetitions. The default value is 1.
    * @param { Int32 } [ intensity ] - The intensity of vibration effect. The default value is 100.
    */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public init(effectId: String, count!: Int32 = 1, intensity!: Int32 = 100) {
        this.effectId = effectId
        this.count = count
        this.intensity = intensity
    }
}

/**
* Custom vibration, vibrate the effect from a haptic file.
*/
protected class VibrateFromFile <: VibrateEffect {
    /**
    * Haptic file descriptor, some formats are supported.
    */
    protected var hapticFd: HapticFileDescriptor

    /**
    * VibrateFromFile constructor.
    *
    * @param { HapticFileDescriptor } hapticFd - Haptic file descriptor, some formats are supported.
    */
    protected init(hapticFd: HapticFileDescriptor) {
        this.hapticFd = hapticFd
    }
}

/**
* Haptic file descriptor. The caller needs to ensure that the fd is valid and
* the offset and length are correct.
*/
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Sensors.MiscDevice"
]
protected class HapticFileDescriptor {
    /**
     * The file descriptor of haptic effect source from file system. The caller
     * is responsible to close the file descriptor.
     */
    protected var fd: Int32
    /**
     * The offset into the file where the data to be read, in bytes. By default,
     * the offset is zero.
     */
    protected var offSet: Int64
    /**
     * The length in bytes of the data to be read. By default, the length is the
     * rest of bytes in the file from the offset.
     */
    protected var length: Int64

    /**
    * HapticFileDescriptor constructor.
    *
    * @param { Int32 } fd - The file descriptor of haptic effect source from file system. The caller
    * is responsible to close the file descriptor.
    * @param { Int64 } [ offSet ] - The offset into the file where the data to be read, in bytes. By default,
    * the offset is zero.
    * @param { Int64 } [ length ] - The length in bytes of the data to be read. By default, the length is the
    * rest of bytes in the file from the offset.
    */
    protected init(fd: Int32, offSet!: Int64 = 0, length!: Int64 = FileIo.stat(fd).size - offSet) {
        this.fd = fd
        this.offSet = offSet
        this.length = length
    }
}

/**
* The attribute of vibration.
*/
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Sensors.MiscDevice"
]
public class VibrateAttribute {
    /**
    * The use of vibration.
    */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var usage: Usage
    /**
    * Vibrator id, default is 0.
    */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var id: Int32
    /**
    * VibrateAttribute constructor.
    *
    * @param { Usage } usage - The use of vibration.
    * @param { Int32 } [ id ] - Vibrator id, default is 0.
    */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public init(usage: Usage, id!: Int32 = 0) {
        this.usage = usage
        this.id = id
    }
}

/**
 * Enum for the use of vibration.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Sensors.MiscDevice"
]
public enum Usage {
    /**
    * unknown vibration.
    */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    Unknown
    /**
    * alarm vibration.
    */
   | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    Alarm
    /**
    * Ring vibration.
    */
   | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    Ring
    /**
    * Notification vibration.
    */
   | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    Notification
    /**
    * Communication vibration.
    */
   | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    Communication
    /**
    * Touch vibration.
    */
   | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    Touch
    /**
    * Media vibration.
    */
   | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
   Media
    /**
    * Physicalfeedback vibration.
    */
   | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    Physicalfeedback
    /**
    * Simulatereality vibration.
    */
   | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    Simulatereality
    | ...

    func getValue(): String {
        match (this) {
            case Unknown => "unknown"
            case Alarm => "alarm"
            case Ring => "ring"
            case Notification => "notification"
            case Communication => "communication"
            case Touch => "touch"
            case Media => "media"
            case Physicalfeedback => "physicalFeedback"
            case Simulatereality => "simulateReality"
            case _ => throw BusinessException(14600101, "Device operation failed.")
        }
    }
}

/**
 * Enum for Vibrator vibration stop mode.
 */
@Derive[ToString]
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Sensors.MiscDevice"
]
public enum VibratorStopMode {
    /**
    * Indicates the mode of stopping a one-shot vibration effect.
    */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    VibratorStopModeTime
    /**
    * Indicates the mode of stopping a preset vibration effect.
    */
   | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    VibratorStopModePreset
    | ...
}

const SERVICE_STATUS_ERROR = 14600101i32
let ERROR_CODE_MAP = HashMap<Int32, String>([(SERVICE_STATUS_ERROR, " Device operation failed.")])

func getErrorMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error"
    }
}

/**
 * Trigger vibrator vibration.
 *
 * @param { VibrateEffect } effect - Indicate vibrate effect.
 * @param { VibrateAttribute } attribute - Indicate vibrate attribute.
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { BusinessException } 801 - Capability not supported.
 * @throws { BusinessException } 14600101 - Device operation failed.
 */
@!APILevel[
    since: "24",
    permission: "ohos.permission.VIBRATE",
    syscap: "SystemCapability.Sensors.MiscDevice",
    throwexception: true,
    workerthread: true
]
public func startVibration(effect: VibrateEffect, attribute: VibrateAttribute): Unit {
    unsafe {
        let cAttribute = RetVibrateAttribute(attribute)
        var code = 0i32
        match (effect) {
            case v: VibrateTime =>
                let cEffectTime = RetVibrateTime(v)
                FfiVibratorStartVibrationTime(cEffectTime, cAttribute, inout code)
            case v: VibratePreset =>
                let cEffectPreset = RetVibratePreset(v)
                FfiVibratorStartVibrationPreset(cEffectPreset, cAttribute, inout code)
                cEffectPreset.free()
            case v: VibrateFromFile =>
                if (v.hapticFd.offSet < 0 || v.hapticFd.offSet > FileIo.stat(v.hapticFd.fd).size || v.hapticFd.length > FileIo
                    .stat(v.hapticFd.fd).size) {
                    throw BusinessException(ERR_PARAMETER_ERROR,
                        "startVibration failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
                }
                let cEffectFile = RetVibrateFromFile(v)
                FfiVibratorStartVibrationFile(cEffectFile, cAttribute, inout code)
            case _ =>
                throw BusinessException(14600101, "Device operation failed.")
        }
        cAttribute.free()
        if (code != SUCCESS_CODE) {
            throw BusinessException(code, "startVibration failed: ${getErrorMsg(code)}")
        }
    }
}

/**
 * Stop the vibrator from vibrating.
 *
 * @param { Option<VibratorStopMode> } [ stopMode ] - Indicate the stop mode in which the motor vibrates, {@code VibratorStopMode}.
 * @throws { BusinessException } 201 - Permission denied.
 */
@!APILevel[
    since: "24",
    permission: "ohos.permission.VIBRATE",
    syscap: "SystemCapability.Sensors.MiscDevice",
    throwexception: true,
    workerthread: true
]
public func stopVibration(stopMode!: Option<VibratorStopMode> = None): Unit {
    unsafe {
        var code = 0i32
        if (let Some(v) <- stopMode) {
            let cStr = LibC.mallocCString(v.toString())
            FfiVibratorStopVibrationMode(cStr, inout code)
            LibC.free(cStr)
        } else {
            FfiVibratorStopVibration(inout code)
        }
        if (code != SUCCESS_CODE) {
            throw BusinessException(code, "stopVibration failed: ${getErrorMsg(code)}")
        }
    }
}
