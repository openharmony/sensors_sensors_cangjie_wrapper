# Generic Sensor Service Cangjie Wrapper

## Introduction

The Generic Sensor Service Cangjie Wrapper provides sensor-related capabilities for developers using the Cangjie language for application development on OpenHarmony. The Generic Sensor Service subsystem provides the ability to obtain sensor data, including getting sensor attribute lists, subscribing to sensor data, and setting data reporting modes. The current Generic Sensor Service Cangjie wrapper interface supports standard devices.

## System Architecture

**Figure 1** Generic Sensor Service Cangjie Architecture

![Generic Sensor Service Cangjie Architecture](figures/sensors_cangjie_wrapper_architecture_en.png)

As shown in the architecture diagram:

Interface Layer

- Sensor Subscribe/Unsubscribe Interface: Provides developers with the ability to subscribe/unsubscribe to sensor data.
- Get Sensor Information Interface: Provides developers with the ability to obtain sensor information on the device.

Framework Layer

- Sensor Subscribe/Unsubscribe Function Encapsulation: Based on the subscribe/unsubscribe sensor capabilities provided by the underlying sensor component, implements the function of subscribing/unsubscribing to sensor data in Cangjie.
- Get Sensor Information Interface Function Encapsulation: Based on the get sensor information capabilities provided by the underlying sensor component, implements the function of getting sensor information on the device in Cangjie.
- Cangjie Sensor FFI Interface Definition: Responsible for defining C language interoperability interfaces called by the Cangjie language to implement Cangjie Sensor capabilities.

Dependency Component Introduction in Architecture Diagram:

- sensor: Responsible for providing basic sensor functionality, encapsulating C language interfaces for interoperability with Cangjie.
- cangjie_ark_interop: Responsible for providing Cangjie annotation class definitions for API annotation, and providing BusinessException exception class definitions thrown to users.
- hiviewdfx_cangjie_wrapper: Responsible for providing log interfaces for printing logs at critical paths.

## Directory

```
base/sensors/sensors_cangjie_wrapper   
├── figures               # Architecture diagrams in README
├── kit
│   └── SensorServiceKit  # SensorServiceKit code directory
├── ohos
│   └── sensor            # Sensor Cangjie interface code
└── test
    └── sensor            # Sensor Cangjie interface test case code
```

## Usage Instructions

As shown in the architecture diagram, the Generic Sensor Service Cangjie provides the following functions:

- Subscribe to Sensor, listen for Sensor data changes.
- Unsubscribe from Sensor.
- Get Sensor information on the device.

For sensor-related APIs, please refer to [Sensor API Reference](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_en/apis/SensorServiceKit/cj-apis-sensor.md). For related guidance, please refer to [Sensor Development Guide](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/Dev_Guide/source_en/device/sensor/cj-sensor-guidelines.md).

## Constraints

* To use Sensor functions, the device must have the corresponding Sensor components.
* For certain Sensors, developers need to request the corresponding permissions to obtain the respective Sensor data.
* Compared to APIs provided by ArkTS, the following capabilities are not currently supported:
  * Get geomagnetic field information at a specific location on Earth at a certain time.
  * Get altitude based on pressure values.
  * Calculate magnetic dip angle based on tilt matrix.
  * Calculate rotation matrix, etc.

## Contribution

Developers are welcome to contribute code, documentation, etc. For specific contribution processes and methods, please refer to [Contribution](https://gitcode.com/openharmony/docs/blob/master/en/contribute/how-to-contribute.md).

## Related Repositories

[sensors\_sensor](https://gitcode.com/openharmony/sensors_sensor/blob/master/README.md)

[cangjie_ark_interop](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/README.md)

[hiviewdfx_cangjie_wrapper](https://gitcode.com/openharmony-sig/hiviewdfx_hiviewdfx_cangjie_wrapper/blob/master/README.md)
