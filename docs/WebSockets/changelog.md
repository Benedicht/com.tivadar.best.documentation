---
comments: true
---

# Changelog

## 3.0.8 (2025-09-27)

__Fixes__

- Fixed error when the upgrade request is redirected

## 3.0.7 (2025-03-02)

__Additions and improvements__

- Added support for multiple subprotocols

__Fixes__

- Reworked dispatching of onclosed event to be handled on the same thread than other events.

## 3.0.6 (2024-09-09)

__Additions and improvements__

- Switched to the new [UTC date&times](../HTTP/changelog.md)

## 3.0.5 (2024-06-20)

__Fixes__

- Set the `MaxBufferSize` property (introduced in [Best HTTP v3.0.10](../HTTP/changelog.md#3010-2024-06-20)) of the underlying content provider to support larger than default size websocket frames.

## 3.0.4 (2024-05-20)

__Additions and improvements__

- WebGL: Support added for [WebAssembly.Table language feature](https://docs.unity3d.com/6000.0/Documentation/Manual/wasm-2023-features.html#wasm-table).
- Logging: Added missing contexts.

__Fixes__

- Fixed case where websocket closed with pong timeout error even if it's received the pong frame.
- Per-Message Compression: Fixed exception when `server_no_context_takeover` isn't supported by the server.
- Properly dispose underlying `TCPStreamer` when the connection is closed by the server.
- Fixed log level and message in `OnCancellationRequested` callback.

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
