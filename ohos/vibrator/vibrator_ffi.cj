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

@C
struct RetVibrateTime {
    let timeType: CString
    let duration: Int32

    init(ret: VibrateTime) {
        this.timeType = unsafe { LibC.mallocCString("time") }
        this.duration = ret.duration
    }

    func free(): Unit {
        unsafe { LibC.free(this.timeType) }
    }
}

@C
struct RetVibratePreset {
    let presetType: CString
    let effectId: CString
    let count: Int32
    let intensity: Int32

    init(ret: VibratePreset) {
        this.presetType = unsafe { LibC.mallocCString("preset") }
        this.effectId = unsafe { LibC.mallocCString(ret.effectId) }
        this.count = ret.count
        this.intensity = ret.intensity
    }

    func free(): Unit {
        unsafe { LibC.free(this.presetType) }
        unsafe { LibC.free(this.effectId) }
    }
}

@C
struct RetVibrateFromFile {
    let fileType: CString
    let hapticFd: RetHapticFileDescriptor

    init(ret: VibrateFromFile) {
        unsafe {
            this.fileType = LibC.mallocCString("file")
            this.hapticFd = RetHapticFileDescriptor(ret.hapticFd)
        }
    }

    func free(): Unit {
        unsafe { LibC.free(this.fileType) }
    }
}

@C
struct RetHapticFileDescriptor {
    let fd: Int32
    let offSet: Int64
    let length: Int64

    init(ret: HapticFileDescriptor) {
        this.fd = ret.fd
        this.offSet = ret.offSet
        this.length = ret.length
    }
}

@C
struct RetVibrateAttributeEnhanced {
    let id: Int32
    let usage: CString
    let deviceId: Int32

    init(ret: VibrateAttribute) {
        this.id = ret.id
        unsafe { this.usage = LibC.mallocCString(ret.usage.getValue()) }
        this.deviceId = ret.deviceId
    }

    func free(): Unit {
        unsafe { LibC.free(this.usage) }
    }
}

@C
struct RetVibratorInfoParam {
    let deviceId: Int32
    let vibratorId: Int32
    
    init(param: VibratorInfoParam) {
        this.deviceId = param.deviceId
        this.vibratorId = param.vibratorId
    }
}

@C
struct RetVibratorInfo {
    RetVibratorInfo(
        let deviceId: Int32,
        let vibratorId: Int32,
        let deviceName: CString,
        let isHdHapticSupported: Bool,
        let isLocalVibrator: Bool
    ) {}

    func free(){
        unsafe { LibC.free(this.deviceName) }
    }
}

@C
struct CArrRetVibratorInfo {
    CArrRetVibratorInfo(
        let head: CPointer<RetVibratorInfo>,
        let size: Int64
    ) {}

    func free() {
        if (head.isNull()) {
            return
        }
        for (i in 0..this.size) {
            unsafe { head.read(i).free() }
        }
        unsafe { LibC.free<RetVibratorInfo>(head) }
    }
}

foreign {
    func FfiVibratorStartVibrationPresetEnhanced(effect: RetVibratePreset, attribute: RetVibrateAttributeEnhanced, code: CPointer<Int32>): Unit
    func FfiVibratorStopVibrationEnhanced(cParam: RetVibratorInfoParam, code: CPointer<Int32>): Unit
    func FfiVibratorSupportEffect(cStr: CString, code: CPointer<Int32>): Bool
    func FfiVibratorStartVibrationTimeEnhanced(effect: RetVibrateTime, attribute: RetVibrateAttributeEnhanced, code: CPointer<Int32>): Unit
    func FfiVibratorStartVibrationFileEnhanced(effect: RetVibrateFromFile, attribute: RetVibrateAttributeEnhanced, code: CPointer<Int32>): Unit
    func FfiVibratorGetVibratorInfo(cParam: RetVibratorInfoParam, code: CPointer<Int32>): CArrRetVibratorInfo
}
