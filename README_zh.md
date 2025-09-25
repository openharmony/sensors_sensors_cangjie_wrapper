# 泛Sensor服务仓颉封装

## 简介

泛Sensor服务仓颉封装是 OpenHarmony 上面向开发者提供使用仓颉语言进行应用开发时的传感器相关能力。泛Sensor服务子系统提供了获取传感器数据的能力，包括获取传感器属性列表、订阅传感器数据、设置数据上报模式等功能。当前开发的泛Sensor服务仓颉封装接口支持standard设备。

## 系统架构

**图 1**  泛Sensor服务仓颉架构图

![泛Sensor服务仓颉架构图](figures/sensors_cangjie_wrapper_architecture.png)

如架构图所示：

接口层

- 传感器订阅/取消订阅接口：面向开发者提供订阅/取消订阅传感器数据的能力。
- 获取传感器信息接口：面向开发者提供获取设备上的传感器信息的能力。

框架层

- 传感器订阅/取消订阅功能封装：基于底层 sensor 组件提供的订阅/取消订阅传感器的能力，实现仓颉订阅/取消订阅传感器数据的功能。
- 获取传感器信息接口功能封装：基于底层 sensor 组件提供的获取传感器信息的能力，实现仓颉获取设备上传感器信息的功能。
- 仓颉传感器FFI接口定义：负责定义被仓颉语言调用的C语言互操作接口，用于实现仓颉 Sensor 能力。

架构图中的依赖部件引入说明：

- sensor：负责提供传感器基础功能，封装C语言接口提供给仓颉进行互操作。
- cangjie_ark_interop：负责提供仓颉注解类定义，用于对API进行标注，以及提供抛向用户的BusinessException异常类定义。
- hiviewdfx_cangjie_wrapper：负责提供日志接口，用于在关键路径处打印日志。

## 目录

```
base/sensors/sensors_cangjie_wrapper   
├── figures               # 存放README中的架构图
├── kit
│   └── SensorServiceKit  # SensorServiceKit代码目录
├── ohos
│   └── sensor            # sensor仓颉接口代码
└── test
    └── sensor            # sensor仓颉接口测试用例代码
```

## 使用说明

提供了以下传感器功能：

- 订阅传感器，监听传感器数据变化。
- 取消传感器订阅。
- 获取设备上的传感器信息。

传感器相关API请参见[传感器API参考](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_zh_cn/apis/SensorServiceKit/cj-apis-sensor.md)，相关指导请参见[传感器开发指南](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/Dev_Guide/source_zh_cn/device/sensor/cj-sensor-guidelines.md)。

## 约束

* 要使用传感器的功能，设备必须具有对应的传感器器件。
* 针对某些传感器，开发者需要请求相应的权限，才能获取到相应传感器的数据。
* 与ArkTS提供的API能力相比，暂不支持以下能力：
  * 获取某时刻地球上特定位置的地磁场信息。
  * 根据气压值获取海拔高度。
  * 根据倾斜矩阵计算地磁倾角。
  * 计算旋转矩阵等。

## 参与贡献

欢迎广大开发者贡献代码、文档等，具体的贡献流程和方式请参见[参与贡献](https://gitcode.com/openharmony/docs/blob/master/zh-cn/contribute/%E5%8F%82%E4%B8%8E%E8%B4%A1%E7%8C%AE.md)。

## 相关仓

[sensors\_sensor](https://gitcode.com/openharmony/sensors_sensor/blob/master/README_zh.md)

[cangjie_ark_interop](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/README_zh.md)

[hiviewdfx_cangjie_wrapper](https://gitcode.com/openharmony-sig/hiviewdfx_hiviewdfx_cangjie_wrapper/blob/master/README_zh.md)
