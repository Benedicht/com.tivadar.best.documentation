---
title: MQTT Versions
comments: true
---

How to switch between MQTT protocol versions.

## Supported MQTT Versions

Best MQTT supports both `v3.1.1` and `v5` versions of the MQTT protocol.

## How to switch between MQTT versions

`ConnectionOptions` has a `ProtocolVersion` property that can be set directly or through using `ConnectionOptionsBuilder`:

```cs
var options = new ConnectionOptionsBuilder()
        .WithTCP("test.mosquitto.org", 1883)
        .WithProtocolVersion(SupportedProtocolVersions.MQTT_3_1_1)
        .Build();
var client = new MQTTClient(options);
```

!!! Warning "When `ProtocolVersion` is set to `SupportedProtocolVersions.MQTT_3_1_1`, functions that usable only with MQTT v5 will throw an exception!"