---
comments: true
---

# Changelog

## 3.0.3 (2024-04-12)

__Additions and improvements__

- Don't allow ping timeouts if messages are arriving from the server and pong is delayed.
- Dispose an `AutoResetEvent`.

__Fixes__

- (#192) Fixed frame size calculation that resulted in malformed frame reads.

## 3.0.2 (2024-02-14)

__Additions and improvements__

- Made ping sending independent from other messages.
- [WebGL] Improved performance under WebGL by using BufferPool arrays from the JS side for textual and binary messages, and doing less data copy.
- [WebGL] Added support to send texts with NULL(\0) characters.

__Fixes__

- Pings sent even if `SendPings` were set to `false`.

## 3.0.1 (2023-12-04)

__Fixes__

- Fixed support of BESTHTTP_DISABLE_ALTERNATE_SSL.

## 3.0.0 (2023-11-01)

__Additions and improvements__

- Added modularity: previously bundled within a larger asset, the Best WebSockets functionality has been separated out, creating a dedicated package that builds upon the core capabilities of the Best HTTP package for streamlined and focused WebSocket communication.
- Enhanced connection capabilities: utilizes the improved connection mechanisms provided by the Best HTTP package for [faster connections](../Shared/connections/racing.md).
- New namespace hierarchy: WebSockets-related classes have been moved from `BestHTTP.WebSocket` to the `Best.Websockets` namespace.
- The `OnBinary` event now receives a `BufferSegment` and the memory will be reused after the event.
- The `OnClosed` event now receives an [WebSocketStatusCodes](api-reference/WebSockets/WebSocketStatusCodes.md) enum as its status code.

__Removals__

- Removed the `OnBinaryNoAlloc` event.

__Fixes__

- Fixed confusing naming by renaming `StartPingThread` to `SendPings`
- Fixed confusing behavior because of the two closure events `OnError` and `OnClosed` by mergind the two into one `OnClosed` event. The behavior of `OnClosed` is now matching what browsers have.