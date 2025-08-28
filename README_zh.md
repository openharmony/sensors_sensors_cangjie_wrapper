# 泛Sensor服务仓颉接口

## 简介

泛Sensor服务仓颉接口是在 OpenHarmony 上基于泛Sensor服务子系统能力之上封装的仓颉API。泛Sensor服务子系统提供了轻量级sensor服务基础框架，提供了如下功能：

-   Sensor列表查询
-   Sensor启停
-   Sensor订阅/去订阅
-   设置数据上报模式等

 **泛Sensor服务框架图如下所示：** 

![](figures/sensors_cangjie_wrapper_architecture.png)

## 目录

```
base/sensors/sensors_cangjie_wrapper
├── ohos             # 仓颉泛Sensor接口实现
├── kit              # 仓颉kit化代码
├── figures          # 存放readme中的架构图
```

## 约束

当前开发的泛Sensor服务仓颉接口仅支持standard设备。

## 使用说明

如架构图所示，泛Sensor服务仓颉提供了以下功能，开发者可以根据使用诉求，综合使用一类或多类接口：

-   Sensor API：提供传感器的基础API，主要包含Sensor列表查询、Sensor订阅/去订阅等。

与ArkTS相比，暂不支持以下能力：

-   Sensor Framework：主要实现传感器的订阅管理，数据通道的创建、销毁、订阅与取消订阅，实现与SensorService的通信。
-   Sensor Service：主要实现HDF层数据接收、解析、分发，对Sensor服务的管理，数据上报管理以及Sensor权限管控等。

Sensor相关API请参见[ohos.sensor](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_zh_cn/apis/SensorServiceKit/cj-apis-sensor.md)，相关指导请参见[Sensor Service Kit开发简介](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/Dev_Guide/source_zh_cn/device/sensor/cj-sensor-guidelines.md)。

## 参与贡献

欢迎广大开发者贡献代码、文档等，具体的贡献流程和方式请参见[参与贡献](https://gitcode.com/openharmony/docs/blob/master/zh-cn/contribute/%E5%8F%82%E4%B8%8E%E8%B4%A1%E7%8C%AE.md)。

## 相关仓

[sensors_miscdevice_lite](https://gitee.com/openharmony/sensors_sensor/blob/master/README_zh.md)
