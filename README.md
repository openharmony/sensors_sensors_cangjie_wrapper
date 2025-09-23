# sensors_cangjie_wrapper

## Introduction

The sensors_cangjie_wrapper is a Cangjie API encapsulated on OpenHarmony based on the capabilities of the pan-sensor service subsystem.  Sensor refers to a device used to detect events or changes that occur in the environment and send this message to other electronic devices (such as central processing units). The pan-sensor service subsystem provides the ability to obtain Sensor data, including functions such as obtaining Sensor attribute lists, subscribing to Sensor data, and setting data reporting mode of a sensor. The currently developed pan-sensor service Cangjie interface only supports standard devices.

## System Architecture

The following figure shows the architecture of the pan-sensor service framework.

![the architecture of the pan-sensor service framework](figures/sensors_cangjie_wrapper_architecture_en.png)

As shown in the architecture:

- The pan-sensor Service Cangjie interface currently provides the following capabilities:
  
  - subscribing to or unsubscribing from sensor data.
  - obtaining Sensor data.

- Interface encapsulation: Implement Sensor service capabilities using Cangjie.

- Sensor Cangjie FFI interface definition: Responsible for defining the C language interoperability interface called by the Cangjie language, used to implement Cangjie Sensor capabilities.

- Sensor Service: Responsible for providing basic Sensor functions and encapsulating C language interfaces for interoperability with Cangjie.

- cangjie_ark_interop: Responsible for providing Cangjie annotation class definitions for labeling APIs, and providing the BusinessException class definition thrown to users.

- hiviewdfx_cangjie_wrapper: Responsible for providing log interfaces for printing logs at key paths.

## Directory Structure

```
base/sensors/sensors_cangjie_wrapper
├── figures               # architecture pictures
├── kit
│   └── SensorServiceKit  # Cangjie SensorServiceKit
├── ohos
│   └── sensor            # Cangjie pan-sensor code
└── test
    └── sensor            # Cangjie sensor test cases
```

## Constraints

- To use sensor functions, ensure that the device where your application runs has the required sensor components.
- To obtain data of some sensors, you need to request the required permissions.

## Usage

As shown in the diagram, Sensor Service Cangjie provides the following capabilities, and developers can use one or more types of interfaces according to their usage needs:

- querying the sensor list.
- subscribing to or unsubscribing from sensor data.

Compared with the API capabilities provided by ArkTS, the following features are currently not supported:

- Obtain the geomagnetic field information of a specific location on Earth at a certain moment.
- Obtain altitude based on air pressure values.
- Calculate the geomagnetic tilt angle based on the tilt matrix.
- Calculate rotation matrices, etc.

Please refer to the Sensor related API for details [Sensor API reference](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_en/apis/SensorServiceKit/cj-apis-sensor.md).For relevant guidance, please refer to [Sensor Development guidance](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/Dev_Guide/source_en/device/sensor/cj-sensor-overview.md).

## Code Contribution

Developers are welcome to contribute code, documentation, etc. For specific contribution processes and methods, please refer to [Code Contribution](https://gitcode.com/openharmony/docs/blob/master/en/contribute/code-contribution.md).

## Repositories Involved

[sensors\_sensor](https://gitee.com/openharmony/sensors_sensor/blob/master/README.md)

[cangjie_ark_interop](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/README.md)

[hiviewdfx_cangjie_wrapper](https://gitcode.com/openharmony-sig/hiviewdfx_hiviewdfx_cangjie_wrapper/blob/master/README.md)
