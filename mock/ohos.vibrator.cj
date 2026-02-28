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
import ohos.ffi.{SUCCESS_CODE,cArr2cjArr}
import std.collection.HashMap
import ohos.file.fs.FileIo
import ohos.labels.{APILevel}
import std.deriving.Derive

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Sensors.MiscDevice"
]
public interface VibrateEffect {}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Sensors.MiscDevice"
]
public class VibratePreset <: VibrateEffect {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var effectId: String

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var count: Int32

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var intensity: Int32

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public init() {
        super()
        this.effectId = String()
        this.count = 0i32
        this.intensity = 0i32
    }
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Sensors.MiscDevice"
]
public class VibrateAttribute {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var usage: Usage
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var id: Int32
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var deviceId: Int32
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public init() {
        super()
        this.usage = Usage()
        this.id = 0i32
        this.deviceId = 0i32
    }
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Sensors.MiscDevice"
]
public enum Usage {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    Unknown
   | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    Alarm
   | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    Ring
   | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    Notification
   | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    Communication
   | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    Touch
   | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
   Media
   | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    Physicalfeedback
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

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Sensors.MiscDevice"
]
public class VibratorInfoParam {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var deviceId: Int32
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var vibratorId: Int32
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public init() {
        super()
        this.deviceId = 0i32
        this.vibratorId = 0i32
    }
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Sensors.MiscDevice"
]
public class VibratorInfo {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var deviceId: Int32
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var vibratorId: Int32
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var deviceName: String
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var isHdHapticSupported: Bool
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var isLocalVibrator: Bool
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public init(deviceId: Int32, vibratorId: Int32, deviceName: String, isHdHapticSupported: Bool, isLocalVibrator: Bool) {
        super()
        this.deviceId = 0i32
        this.vibratorId = 0i32
        this.deviceName = String()
        this.isHdHapticSupported = true
        this.isLocalVibrator = true
    }   
}

@!APILevel[
    since: "24",
    permission: "ohos.permission.VIBRATE",
    syscap: "SystemCapability.Sensors.MiscDevice",
    throwexception: true,
    workerthread: true
]
public func startVibration(effect: VibrateEffect, attribute: VibrateAttribute): Unit {
    return ()
}

@!APILevel[
    since: "24",
    permission: "ohos.permission.VIBRATE",
    syscap: "SystemCapability.Sensors.MiscDevice",
    throwexception: true,
    workerthread: true
]
public func stopVibration(param!: VibratorInfoParam = VibratorInfoParam(deviceId:-1, vibratorId:-1)): Unit {
    return ()
}

 @!APILevel [
    since: "24",
    syscap: "SystemCapability.Sensors.MiscDevice"
]
public func getVibratorInfo(param!: VibratorInfoParam = VibratorInfoParam(deviceId:-1, vibratorId:-1)): Array<VibratorInfo> {
    return Array()
}
