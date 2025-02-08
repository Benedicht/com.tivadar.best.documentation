---
comments: true
---

# Changelog

## 3.0.4 (TBR)

__Fixes__

- Call `OnHeartbeatUpdate` manually when disconnecting in the Unity Editor while exiting playmode.

## 3.0.3 (2024-09-09)

__Additions and improvements__

- Switched to the new [UTC date&times](../HTTP/changelog.md)

__Fixes__

- Close underlying websocket when disconnected with an error.

## 3.0.2 (2023-12-22)

__Additions and improvements__

- Improved compatibility with AWS IoT by supporting cases where SubScription Identifiers aren't available.
- Merged v3.1.1 and v5 application message creation.

## 3.0.1 (2023-11-09)

__Fixes__

- Fixed case where the received data wasn't fully consumed but the array got recycled into the BufferPool

## 3.0.0 (2023-11-01)

__Additions and improvements__

- Added modularity: previously bundled within a larger asset, the Best MQTT functionality has been separated out, 
creating a dedicated package that builds upon the core capabilities of the Best HTTP package for streamlined and focused MQTT communication.
- Enhanced connection capabilities: utilizes the improved connection mechanisms provided by the Best HTTP package for [faster connections](../Shared/connections/racing.md).
- New namespace hierarchy: MQTT-related classes have been moved from `BestMQTT` to the `Best.MQTT` namespace.