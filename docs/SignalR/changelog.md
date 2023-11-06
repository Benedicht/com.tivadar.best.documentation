---
comments: true
---

# Changelog

## 3.0.0 (2023-11-01)

__Additions and improvements__

- Added modularity: previously bundled within a larger asset, the Best SignalR functionality has been separated out, 
creating a dedicated package that builds upon the core capabilities of the Best HTTP package for streamlined and focused SignalR communication.
- Enhanced connection capabilities: utilizes the improved connection mechanisms provided by the Best HTTP package for [faster connections](../Shared/connections/racing.md).
- New namespace hierarchy: SignalR-related classes have been moved from `BestHTTP.SignalRCore` to the `Best.SignalR` namespace.
- (#167) Added [UniTask](https://github.com/Cysharp/UniTask) integration