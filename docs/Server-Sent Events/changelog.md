---
comments: true
---

# Changelog

## 3.0.0 (2023-11-01)

__Additions and improvements__

- Added modularity: previously bundled within a larger asset, the Best Server-Sent functionality has been separated out, 
creating a dedicated package that builds upon the core capabilities of the Best HTTP package for streamlined and focused Server-Sent Events communication.
- Enhanced connection capabilities: utilizes the improved connection mechanisms provided by the Best HTTP package for [faster connections](../Shared/connections/racing.md).
- New namespace hierarchy: Server-Sent Events related classes have been moved from `BestHTTP.ServerSentEvents` to the `Best.ServerSentEvents` namespace.