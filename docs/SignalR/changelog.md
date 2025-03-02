---
comments: true
---

# Changelog

## 3.0.4 (2025-03-02)

__Additions and improvements__

- `GetSubscription` & `GetItemType` functions are now public.

__Fixes__

- Fixed query parameter generation.

## 3.0.3 (2024-09-09)

__Additions and improvements__

- Switched to the new [UTC date&times](../HTTP/changelog.md)

__Fixes__

- (#200) Fixed `NullReferenceException` when `SkipNegotiation` is set to `true`.
- Fixed websocket query parameter generation.

## 3.0.2 (2024-05-20)

__Additions and improvements__

- (#193) Added support for [stateful reconnect](https://learn.microsoft.com/en-us/aspnet/core/signalr/configuration?view=aspnetcore-8.0&tabs=dotnet#configure-stateful-reconnect).
- Added support for `DateTime` type parameters for the default `JsonProtocol`.

__Fixes__

- Fixed an xml documentation error
- Fixed case where the `HubConnection` received transport state changes from an old, discarded transport no longer in use.
- Fixed case where in some cases the transport is null when the hub enters the Closed state.

## 3.0.1 (2023-12-08)

__Additions and improvements__

- Updated package's author url

__Removals__

- Removed BESTHTTP_DISABLE_WEBSOCKET
- Removed Burst package dependency.


## 3.0.0 (2023-11-01)

__Additions and improvements__

- Added modularity: previously bundled within a larger asset, the Best SignalR functionality has been separated out, 
creating a dedicated package that builds upon the core capabilities of the Best HTTP package for streamlined and focused SignalR communication.
- Enhanced connection capabilities: utilizes the improved connection mechanisms provided by the Best HTTP package for [faster connections](../Shared/connections/racing.md).
- New namespace hierarchy: SignalR-related classes have been moved from `BestHTTP.SignalRCore` to the `Best.SignalR` namespace.
- (#167) Added [UniTask](https://github.com/Cysharp/UniTask) integration