# Changelog

## 3.0.3 (2023-12-08)

__Additions and improvements__

- Updated `WithCredentials`' documentation.

__Fixes__

- Under Android (and possible under other non-windows platforms) when the network is unreachable Unity doesn't call the callback passed to `BeginConnect`.

## 3.0.2 (2023-12-04)

__Fixes__

- Fixed case where `TCPStreamer` would block indefinately if there's no sending in progress and receives more data to send than `MaxBufferedWriteAmount`
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