---
comments: true
---

# Changelog

## 3.0.1 (2024-05-20)

__Additions and improvements__

- WebGL: Support added for [WebAssembly.Table language feature](https://docs.unity3d.com/6000.0/Documentation/Manual/wasm-2023-features.html#wasm-table).

__Fixes__

- Fixed issue where the `EventSource` got closed while the down stream still contained data to process.
- Changed package author url to point to the new documentation page.

## 3.0.0 (2023-11-01)

__Additions and improvements__

- Added modularity: previously bundled within a larger asset, the Best Server-Sent functionality has been separated out, 
creating a dedicated package that builds upon the core capabilities of the Best HTTP package for streamlined and focused Server-Sent Events communication.
- Enhanced connection capabilities: utilizes the improved connection mechanisms provided by the Best HTTP package for [faster connections](../Shared/connections/racing.md).
- New namespace hierarchy: Server-Sent Events related classes have been moved from `BestHTTP.ServerSentEvents` to the `Best.ServerSentEvents` namespace.