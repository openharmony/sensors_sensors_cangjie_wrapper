# 泛Sensor服务仓颉接口

## 简介

泛Sensor服务仓颉接口是在OpenHarmony上基于泛Sensor服务子系统能力之上封装的仓颉API。Sensor是指用于侦测环境中所发生事件或变化，并将此消息发送至其他电子设备（如中央处理器）的设备。泛Sensor服务子系统提供了获取Sensor数据的能力，包括获取Sensor属性列表、订阅Sensor数据、设置数据上报模式等功能。当前开发的泛Sensor服务仓颉接口仅支持standard设备。

## 系统架构

**图 1**  泛Sensor服务仓颉架构图

![泛Sensor服务仓颉架构图](figures/sensors_cangjie_wrapper_architecture.png)

如架构图所示：

- 泛Sensor服务仓颉接口当前提供以下能力：

  -   Sensor订阅/取消订阅。
  -   获取Sensor信息。
- 接口封装：使用仓颉实现Sensor服务能力。
- Sensor仓颉FFI接口定义：负责定义C互操作仓颉接口，用于实现仓颉Sensor能力。
- 传感器服务：负责提供Sensor基础功能，封装C接口提供给仓颉进行互操作。

## 目录

```
base/sensors/sensors_cangjie_wrapper     
├── figures               # 存放README中的架构图
├── kit                   # Sensor仓颉服务kit化代码
│   └── SensorServiceKit  # SensorServiceKit代码目录
└── ohos                  # 泛Sensor仓颉接口代码
    └── sensor            # sensor仓颉接口代码目录
```

## 约束

-   要使用Sensor的功能，设备必须具有对应的Sensor器件。
-   针对某些Sensor，开发者需要请求相应的权限，才能获取到相应Sensor的数据。

## 使用说明

如架构图所示，泛Sensor服务仓颉提供了以下功能，开发者可以根据使用诉求，综合使用一类或多类接口：

- 订阅Sensor，监听Sensor数据变化。
- 取消Sensor订阅。
- 获取设备上的Sensor信息。

详情请参见[ohos.sensor](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_zh_cn/apis/SensorServiceKit/cj-apis-sensor.md)。
相关指导请参见[Sensor Service Kit开发简介](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/Dev_Guide/source_zh_cn/device/sensor/cj-sensor-guidelines.md)。

与ArkTS相比，暂不支持以下能力：

- 获取某时刻地球上特定位置的地磁场信息。
- 根据气压值获取海拔高度。
- 根据倾斜矩阵计算地磁倾角。
- 计算旋转矩阵等。

## 参与贡献

欢迎广大开发者贡献代码、文档等，具体的贡献流程和方式请参见[参与贡献](https://gitcode.com/openharmony/docs/blob/master/zh-cn/contribute/%E5%8F%82%E4%B8%8E%E8%B4%A1%E7%8C%AE.md)。

## 相关仓

[sensors\_sensor](https://gitee.com/openharmony/sensors_sensor/blob/master/README_zh.md)

[arkcompiler_cangjie_ark_interop](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop)

[arkui_arkui_cangjie_wrapper](https://gitcode.com/openharmony-sig/arkui_arkui_cangjie_wrapper)

[hiviewdfx_hiviewdfx_cangjie_wrapper](https://gitcode.com/openharmony-sig/hiviewdfx_hiviewdfx_cangjie_wrapper)
