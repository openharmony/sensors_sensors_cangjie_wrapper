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
    let duration: Int32

    init(ret: VibrateTime) {
        this.duration = ret.duration
    }
}

@C
struct RetVibratePreset {
    let effectId: CString
    let count: Int32
    let intensity: Int32

    init(ret: VibratePreset) {
        this.effectId = unsafe { LibC.mallocCString(ret.effectId) }
        this.count = ret.count
        this.intensity = ret.intensity
    }

    func free(): Unit {
        unsafe { LibC.free(this.effectId) }
    }
}

@C
struct RetVibrateFromFile {
    let hapticFd: RetHapticFileDescriptor

    init(ret: VibrateFromFile) {
        unsafe {
            this.hapticFd = RetHapticFileDescriptor(ret.hapticFd)
        }
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
struct RetVibrateAttribute {
    let id: Int32
    let usage: CString

    init(ret: VibrateAttribute) {
        this.id = ret.id
        unsafe { this.usage = LibC.mallocCString(ret.usage.getValue()) }
    }

    func free(): Unit {
        unsafe { LibC.free(this.usage) }
    }
}

foreign {
    func FfiVibratorStartVibrationTime(effect: RetVibrateTime, attribute: RetVibrateAttribute, code: CPointer<Int32>): Unit

    func FfiVibratorStartVibrationPreset(effect: RetVibratePreset, attribute: RetVibrateAttribute, code: CPointer<Int32>): Unit

    func FfiVibratorStartVibrationFile(effect: RetVibrateFromFile, attribute: RetVibrateAttribute, code: CPointer<Int32>): Unit

    func FfiVibratorStopVibrationMode(cStr: CString, code: CPointer<Int32>): Unit

    func FfiVibratorStopVibration(code: CPointer<Int32>): Unit

    func FfiVibratorSupportEffect(cStr: CString, code: CPointer<Int32>): Bool
}
