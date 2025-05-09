---
comments: true
---

# Changelog

## 3.0.4 (2025-03-02)

__Fixes__

- Re-register internal connected event handler when subscriptions are cleared

## 3.0.3 (2024-09-09)

__Additions and improvements__

- Switched to the new [UTC date&times](../HTTP/changelog.md)

## 3.0.2 (2024-05-20)

__Additions and improvements__

- Added [ExpectAcknowledgement timeouts](getting-started/subscriptions.md#server-acknowledgement-timeouts)
- Added `SocketManager`'s logging context to the transport requests' context.

__Fixes__

- Remove the whole subscription if no more subscriber left.

## 3.0.1 (2023-11-28)

__Additions and improvements__

- Added `[Preserve]` attribute to the `Error` class, and for the `MaxPayload` property in the `HandshakeData` class.

## 3.0.0 (2023-11-01)

__Additions and improvements__

- Added modularity: previously bundled within a larger asset, the Best Socket.IO functionality has been separated out, 
creating a dedicated package that builds upon the core capabilities of the Best HTTP package for streamlined and focused Socket.IO communication.
- Enhanced connection capabilities: utilizes the improved connection mechanisms provided by the Best HTTP package for [faster connections](../Shared/connections/racing.md).
- New namespace hierarchy: Socket.IO-related classes have been moved from `BestHTTP.SocketIO3` to the `Best.SocketIO` namespace.