# Changelog

## 3.0.11 (2024-09-09)

__Additions and improvements__

- Improved performanse (both in terms of memory allocations and CPU usage) when hundreds of concurrent requests are sent.
- `IHeartbeat`'s `OnHeartbeatUpdate` is now called with the current UTC date&time.

__Fixes__

- Reworked request timing handling. It's now more precise.
- [WebGL] Fixed case where `document.cookie` might be `undefined`.
- Call `RequestEventHelper.Clear()` on `RuntimeInitializeLoadType.SubsystemRegistration`.

## 3.0.10 (2024-06-20)

__Additions and improvements__

- Added `FindNext` function to `TimingCollector`.
- Added `MaxBufferSize` property to the `ITCPStreamerContentConsumer` interface and to all implementers unifying them.
- `HTTPRequest`: Track the serving connection's hash in the request's logging context.
- Logging: Changed field ordering.
- `TCPStreamer`: Properly dispose socket in all cases.

__Fixes__

- (#199) Fixed BlockingDownloadContentStream throwing InvalidOperationException.
- `TCPStreamer`: Set `write in progress` to `0` when `SendFromQueue()` returns with `false`.
- Clear `HostManager` on Unity reset.

## 3.0.9 (2024-05-30)

__Additions and improvements__

- `MultipartFormDataStream`: no additional `Content-Type` header is set if the mime-type parameter is set to `null`.

__Fixes__

- WebGL: Fixed compile error.
- Fixed `ArgumentNullException` when a file Uri is used.
- Fix compile error when building for Nintendo™ Switch.

## 3.0.8 (2024-05-20)

__Additions and improvements__

- WebGL: Support added for [WebAssembly.Table language feature](https://docs.unity3d.com/6000.0/Documentation/Manual/wasm-2023-features.html#wasm-table).
- New logging `IFilter` interface with `SingleDivisionFilter` and `MultiDivisionFilter` implementations
- [HTTP2] Added NO_RFC7540_PRIORITIES to the known settings.
- [HTTP2] HTTP2SettingsRegistry will ignore unknown keys by handling them gracefully instead of throwing an exception.
- `CookieJar` now has an `IsEnabled` field to be able to disable cookie handling completely.
- Removed unused `BlockingTCPStream` implementation.
- `BufferPool` now accepts only power of two sized buffers only in its Release functions.
- New per-host setting for HTTP/1 forced usage of ThreadPool through HTTP1ConnectionSettings.ForceUseThreadPool.
- Prevent double-dispose of _currentSegment in `DownloadContentStream`.
- `HTTPRequest`: `OnHeaderEnumerationDelegate`, `Response`'s setter and `EnumerateHeaders` are public now.
- `DownloadContentStream`'s `EmergencyIncreaseMaxBuffered` is now public.
- `TimingCollector`'s `StartNext` and `Finish` are public now.
- `Retries`' setter is now public.
- `Proxy`'s `GetRequestPath` is now public.
- New Per-host Variant and Connection factory functions.
- `Connection`'s `LogginContext` is now public.

__Fixes__

- Save current uri before handling redirection, otherwise PerHostSettings might return with the wrong setting for the current connection.
- Don't close the underlying connection when we just upgraded/switched protocols.
- (#195) Fixed deadlock in `BlockingDownloadContentStream`.
- (#189) Fixed warning in documentation under JetBrains Rider.
- (#190) `HTTPRequest`'s Dispose is now an internal method.
- HTTP/1 connection is closed when `HTTP1ConnectionSettings.TryToReuseConnections` set to `true` even if the connection is upgraded.
- When checking for `TryToReuseConnections`, save current uri before handling redirection, otherwise `PerHostSettings` might return with the wrong setting for the current connection.
- Fixed a possible null-reference exception in `NonBlockingTCPStream`.
- Fixed proxy autodetector not checking for a proxy.
- Fixed case where WebGL layer includes both content-length and chunked transfer encoding.
- Set `TCPStreamer`'s `ContentConsumer` to not receive more callbacks after calling dispose in `NonBlockingTCPStream`.
- Fixed race condition where not all content sent by the TCP streamer.
- Set `ReuseAddress` to false on the socket to remove lingering sockets.


## 3.0.7 (2024-03-27)

__Additions and improvements__

- Merged two request events (`Queued` and `Resend`) into one.
- If the response is with an unknown length (neither chunked or has a content-length header) and the tcp connection is closing, read all available data and serve the response as completed.

__Fixes__

- Fix for *Incorrect Brotli handling for AndroidMono* (#187) .
- Continue download after displaying a warning about download content stream beeing full.
- Fixed case where Database's `FindContentAndMetadataLocked` throws an exception. It will handle the exception, display it, but deletes the corrupted DB entry to not try to use it the next time.
- Don't log an error if HTTPRequest's state changes and the threading mode isn't set to `UnityUpdate` (#188).

## 3.0.6 (2024-02-09)

__Fixes__

- HTTP2: Fixed `NullReferenceException` when an UploadProgress event is defined for the request.
- Fixed case where not all available connection slots are used to server queued requests

## 3.0.5 (2024-01-03)

__Additions and improvements__

- Added constructor to the `MultipartFormDataStream` to allow setting custom boundaries.

__Fixes__

- Fixed boundary generation and sending for `MultipartFormDataStream`.
- Fixed WebGL issue introduced in v3.0.4, where requests are stuck while checking the local HTTP cache.

## 3.0.4 (2023-12-22)

__Additions and improvements__

- Implemented a new algorithm to pre-establish connections. This primarily affects HTTP/2 connections, which can handle multiple requests simultaneously. Starting from this version, the plugin is capable of opening more than one HTTP/2 connection when a large number of requests are queued.
- Added a new field `MaxAssignedRequestsFactor` to `HostVariantSettings`. This field aids in fine-tuning the creation of new connections based on the number of queued requests.
- Moved the first local HTTP cache check to a background thread. In exchange of some slight delay to remove overhead from the main Unity thread.
- Added a few more logging.

__Fixes__

- (#183) Handle unrecognized `content-encoding` values gracefully and serve the content as-is.
- HTT2: Fix case where a request's `Processing` state isn't processed in time and as a result `HTTP2Stream` made decisions based on the old state and didn't finished the request.
- HTTP Cache: `HTTPCache.CanServeWithoutValidation` wasn't thread-safe.
- HTTP Cache: Even with `DisableCache`, a failed request still checked the local cache whether the content can be loaded.
- HTTP Cache: In some rare cases, the first read from the cache happened before `FileConnection` could register its callbacks and as a result the assigned request never finished.

## 3.0.3 (2023-12-08)

__Additions and improvements__

- Updated `WithCredentials`' documentation.

__Fixes__

- Under Android (and possible under other non-windows platforms) when the network is unreachable Unity doesn't call the callback passed to `BeginConnect`.

## 3.0.2 (2023-12-04)

__Fixes__

- Fixed case where `TCPStreamer` would block indefinitely if there's no sending in progress and receives more data to send than `MaxBufferedWriteAmount`
- WebGL: Fixed case where if there was any content-encoding (gzip for example), the actual content accessible through XHR's response had different length (it's uncompressed) than what the server sent with the `content-length` header.
- Fixed compile warning/error when building for WebGL
- Typo fix in `ProxyDetectionMode`: renamed `Continouos` to `Continuous`

## 3.0.1 (2023-11-28)

__Additions and improvements__

- (#165) Use short-living threads for simple HTTP/1 GET requests
- Added short and long-living thread counting for a possible threading profiler in the future
- Log out exception in the `HTTPCahe` constructor only when diagnostic logging is enabled

__Fixes__

- Fixed support for `BESTHTTP_DISABLE_ALTERNATE_SSL`.
- Fixed case where the `content-encoding` header is sent to the higher layer and the generic HTTP1 response class tried to decompress an already decompressed content

## 3.0.0 (2023-11-01)

__Additions and improvements__

!!! Note "The Best HTTP package has been modularized to exclusively include HTTP protocols (HTTP/1.1 & HTTP/2) and a shared infrastructure that other protocols and packages can utilize. For a comprehensive list of these protocols, please visit the [main page](../index.md)."

- New namespace hierarchy.
- Added [DNSCache](../Shared/DNS/dns-cache.md) implementation to speed up consecutive connection processes.
- Added support for [DNSCache](api-reference/Cache/DNSCache.md) to manually store and retrieve entries.
- Added new [Negotiator](api-reference/Tcp/Negotiator.md) class help building new plugins that doesn't use HTTP, but require the same lower-level infrastructure.
- Added new [TCPRingmaster](api-reference/Tcp/TCPRingmaster.md) class to speed up TCP connection process by sending out multiple tcp connection requests and use the first connected one.
- Reimplemented connection logic to use the new DNS cache, negotiator and tcp-ringmaster.
- Reimplemented network read and write operations. Instead of blocking Reads&Writes, now the plugin uses non-blocking functions. This enabled implementing new ways for downloads and uploads. There's forward and backward feedback between the low level tcp layer and higher level connection layers. 
If the [download-stream](api-reference/Response/DownloadContentStream.md)'s buffer is full, it can notify the tcp layer that it can resume receiving from the server.
- Reimplemented [HTTPCache](api-reference/Caching/HTTPCache.md), it's got more robust and future proof.
- (#69) Now it's possible and easy to populate the local HTTP cache.
- Added new, cleaner samples for both old and new features.
- Halved active threads per connections.
- Added [Memory](../Shared/profiler/memory.md) and [Network](../Shared/profiler/network.md) profilers.
- (#126) Added [UniTask](https://github.com/Cysharp/UniTask) integration

__Removals__

- Removed old, cluttered samples.

__Fixes__

- Fixed chaos around different upload sources (RawData, Forms, UploadStream) and unified them in one [UploadStream](getting-started/uploads.md).

For API changes and upgrade guides see the [Upgrade Guide topic](upgrade-guide.md).
