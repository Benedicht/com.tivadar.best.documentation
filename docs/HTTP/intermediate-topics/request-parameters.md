---
comments: true
---

# Advanced Request Parameters

`HTTPRequest` keeps redirection, timeout, and proxy behavior on dedicated settings objects. Per-request values override the matching [per-host settings](../../Shared/connections/per-host-settings.md).

## Redirection

Redirection is enabled by default. [`RedirectSettings.MaxRedirects`](../api-reference/Settings/RedirectSettings.md) starts at **10**. Set it to `0` or a negative value to refuse redirections for that request:

```cs
var request = new Best.HTTP.HTTPRequest(new Uri("https://example.com/moved"));
request.RedirectSettings.MaxRedirects = 0;
request.Send();
```

The plugin follows a `Location` header for these status codes:

- `301 Moved Permanently`
- `302 Found`
- `303 See Other`
- `307 Temporary Redirect`
- `308 Permanent Redirect`

A redirect without a `Location` header finishes as an error. A `Location` that points at the request's current URI is not followed. While the request is redirected, [`HTTPRequest.CurrentUri`](../api-reference/HTTP/HTTPRequest.md) returns the latest target and `HTTPRequest.Uri` stays the URI the request was created with.

The HTTP method is kept for every followed redirect, including `301`, `302`, and `303`.

The plugin sets `Referer` to the URI it just left. When the new host differs from the current one, it also removes headers that must not be sent to another origin: `Authorization`, `Cookie`, `Origin`, `Host`, `Proxy-Authorization`, cache validators (`If-None-Match`, `If-Modified-Since`), and `Content-Length`.

`OnBeforeRedirection` runs before that new request is sent, on a thread other than Unity's main thread. Return `false` to stop following the redirect and surface the redirect response instead:

```cs
request.RedirectSettings.OnBeforeRedirection += (req, resp, redirectUri) =>
{
    return redirectUri.Host == "example.com";
};
```

`IsRedirected` can be `true` while `RedirectCount` is still `0`. That happens when the [local cache](caching-internals.md) serves the response, which is also modeled as a redirection.

## Timeouts

Each request has a [`TimeoutSettings`](../api-reference/Settings/TimeoutSettings.md) instance. Values left unset fall back to the host's [`HTTRequestSettings`](../api-reference/Settings/HTTRequestSettings.md):

| Setting | What it limits | Default |
| --- | --- | --- |
| `ConnectTimeout` | Time spent waiting for a connection after the request is queued | 20 seconds |
| `Timeout` | Time spent processing the request after a connection starts working on it | `TimeSpan.MaxValue` |

`TimeSpan.Zero` or a negative `ConnectTimeout` disables the connect timeout. The request timeout is effectively disabled until a shorter value is assigned, because the default is `TimeSpan.MaxValue`.

Set them for one request:

```cs
request.TimeoutSettings.ConnectTimeout = TimeSpan.FromSeconds(5);
request.TimeoutSettings.Timeout = TimeSpan.FromSeconds(30);
```

Or for every host:

```cs
var defaults = Best.HTTP.Shared.HTTPManager.PerHostSettings.Get("*").RequestSettings;
defaults.ConnectTimeout = TimeSpan.FromSeconds(10);
defaults.RequestTimeout = TimeSpan.FromSeconds(60);
```

A connect timeout finishes the request in `HTTPRequestStates.ConnectionTimedOut`. A processing timeout finishes it in `HTTPRequestStates.TimedOut`. Once processing has started, only the request timeout applies.

## Custom Proxy

`HTTPManager.Proxy` is copied onto each new request. Assign `request.ProxySettings.Proxy` to use a different proxy, or set it to `null` to bypass the global proxy for that call:

```cs
using Best.HTTP.Proxies;

request.ProxySettings.Proxy = new HTTPProxy(new Uri("http://proxy.example.com:8080"));
```

How to configure HTTP and SOCKS proxies is covered in [HTTP Proxies](../../Shared/proxy/http-proxies.md) and [SOCKSv5 Proxies](../../Shared/proxy/socks-proxies.md). Automatic detection is covered in [Proxy Autodetect](../../Shared/proxy/proxy-autodetect.md).
