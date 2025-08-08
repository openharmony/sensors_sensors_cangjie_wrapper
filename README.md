# Pan-Sensor

## Introduction

The pan-sensor service subsystem provides a lightweight sensor service framework, through which you can perform the following operations:

-   Query the sensor list.
-   Enable or disable a sensor.
-   Subscribe to or unsubscribe from sensor data.
-   Set the data reporting mode of a sensor.

The following figure shows the architecture of the pan-sensor service framework.

![](figures/en-us_image_0000001106694563.png)

## Directory Structure

```
base/sensors/sensors_cangjie_api
├── ohos             # Cangjie Pan-Sensor code
├── kit              # Cangjie kit code
├── figures          # architecture pictures
```

## Usage

The following modules work cooperatively to implement pan-sensor capabilities: Sensor API, Sensor Framework, and Sensor Service.

-   Sensor API: provides APIs for performing basic operations on sensors, including querying the sensor list, enabling or disabling sensors, and subscribing to or unsubscribing from sensor data.
-   Sensor Framework: manages sensor data subscription, creates and destroys data channels, subscribes to or unsubscribes from sensor data, and implements communication with the Sensor Service module.
-   Sensor Service: interacts with the HDF module to receive, parse, and distribute data, manages sensor services and sensor data reporting, and controls sensor permissions.

## Repositories Involved

**Pan-sensor subsystem**

sensors_cangjie_api
