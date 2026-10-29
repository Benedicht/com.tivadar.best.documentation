---
comments: true
---

# Authentication Refresh

!!! Note "Requirements"
    - **Server:** ASP.NET Core SignalR in **.NET 11** or later. The refresh endpoint and the `tokenLifetimeSeconds` field come from that version.
    - **Client:** Best SignalR **v3.1.0** or later.

Best SignalR can refresh authentication on a live connection, without reconnecting, when the server reports how long the current token remains valid. This follows the .NET 11 SignalR authentication-refresh flow, including refreshed access tokens for Azure SignalR Service.

Automatic refresh is on by default. It starts only after a normal negotiation that includes `tokenLifetimeSeconds`. Connections opened with `SkipNegotiation` have no connection token, so refresh is not available for them.

## What the server sends

The negotiate response may contain:

```json
{
  "connectionId": "...",
  "connectionToken": "...",
  "tokenLifetimeSeconds": 3600
}
```

`tokenLifetimeSeconds` is stored on `NegotiationResult.TokenLifetime`. A missing, non-positive, or unparsable value means the server did not ask the client to schedule a refresh. A later redirect keeps the previous lifetime when the new negotiate payload does not include one.

## Automatic scheduling

`HubOptions.AuthenticationRefresh` controls the schedule. With the defaults, a lifetime longer than 10 minutes is refreshed 5 minutes before it expires. A shorter lifetime is refreshed at its halfway point, so a 6 minute token is refreshed after 3 minutes.

```cs
hub.Options.AuthenticationRefresh.EnableAutoRefresh = true;
hub.Options.AuthenticationRefresh.RefreshBeforeExpiration = TimeSpan.FromMinutes(2);
```

Set `EnableAutoRefresh` to `false` to keep the reported lifetime without scheduling a request. `RefreshBeforeExpiration` must be zero or greater. After a successful refresh the next attempt is scheduled from the new lifetime. A response that does not include a new lifetime cancels the schedule.

## Refresh request

The plugin sends `POST {hub}/refresh?id={connectionToken}` to the URI the `HubConnection` was created with. An existing query string is preserved, and `id` is appended. Azure redirects do not move this call: it stays on the original hub, and a returned `accessToken` is what the connection then uses for the service.

The JSON body is an object. `accessToken` replaces `NegotiationResult.AccessToken` when it is present. `tokenLifetimeSeconds` becomes the new lifetime when it is a positive number.

```json
{
  "accessToken": "<new service token>",
  "tokenLifetimeSeconds": 3600
}
```

## Supplying a new bearer token

By default the refresh request is prepared with the connection's `AuthenticationProvider`, the same way negotiate and later HTTP calls are.

Set `AccessTokenProvider` when the call needs a freshly issued bearer token. The function is awaited immediately before the request. A non-empty result is sent as `Authorization: Bearer <token>`. While this callback is assigned, `AuthenticationProvider.PrepareRequest` is not called for the refresh request. If the server does not return an `accessToken`, the token from the provider becomes `NegotiationResult.AccessToken`.

```cs
hub.Options.AuthenticationRefresh.AccessTokenProvider = async () =>
{
    return await FetchLatestJwtAsync();
};
```

With UniTask referenced, the property is a `Func<UniTask<string>>`. Otherwise it is a `Func<Task<string>>`.

## Manual refresh

`RefreshAuthenticationAsync` sends the same request on demand. The connection must be `Connected`, negotiation must have produced a connection token, and another refresh must not already be running. The returned `TimeSpan?` is the new lifetime, or `null` when the server did not report one.

```cs
TimeSpan? lifetime = await hub.RefreshAuthenticationAsync();
```

Pass a `CancellationToken` to cancel the HTTP call. If the connection closes or its connection token changes while the request is in flight, the method returns `null` and leaves the negotiation result unchanged.

## Callbacks

- `OnAuthenticationRefreshed` receives an `AuthenticationRefreshedContext` with `NewTokenLifetime` and the UTC `RefreshedAt` time.
- `OnAuthenticationRefreshFailed` receives an `AuthenticationRefreshFailedContext` whose `Exception` is the failure.

A failed automatic refresh raises `OnAuthenticationRefreshFailed` and is written to the plugin log. The connection stays in `Connected`; refresh does not reconnect by itself. `RefreshAuthenticationAsync` raises the same callback and then rethrows, so a manual caller can handle the exception too.

An exception thrown by either callback is logged and does not replace the original refresh result.
