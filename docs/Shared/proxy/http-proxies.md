---
comments: true
---

# HTTP Proxies

`HTTPProxy` (`Best.HTTP.Proxies`) routes a connection through an HTTP proxy. The same type is used for plain HTTP and for HTTPS or WSS tunnels.

Assign it once for every request, or override it on a single request. A per-request value replaces the global one; it does not merge with it.

```cs title="Global proxy"
using Best.HTTP.Proxies;
using Best.HTTP.Shared;

HTTPManager.Proxy = new HTTPProxy(new Uri("http://proxy.example.com:8080"));
```

```cs title="One request"
request.ProxySettings.Proxy = new HTTPProxy(new Uri("http://other-proxy.example.com:8080"));
```

```cs title="Skip the global proxy for one request"
request.ProxySettings.Proxy = null;
```

The proxy address uses an `http://host:port` URI. That scheme names the proxy endpoint. It does not decide whether the target request is HTTP or HTTPS.

## Authentication

Pass a `Credentials` value (`Best.HTTP.Request.Authentication`) when the proxy requires a username and password. `AuthenticationTypes.Basic` sends a `Proxy-Authorization` header up front. `AuthenticationTypes.Digest`, and `AuthenticationTypes.Unknown`, wait for a `407 Proxy Authentication Required` challenge and then resend the request.

```cs
using Best.HTTP.Request.Authentication;

HTTPManager.Proxy = new HTTPProxy(
    new Uri("http://proxy.example.com:8080"),
    new Credentials(AuthenticationTypes.Basic, "user", "password"));
```

`Unknown` is the right choice when the proxy's scheme is not known ahead of time. The first challenge selects Basic or Digest.

## Transparent and tunneling proxies

A new `HTTPProxy` is transparent, sends the whole target URI when a request line needs it, and opens an explicit tunnel for secure protocols:

| Property | Default | Effect |
| --- | --- | --- |
| `IsTransparent` | `true` | The proxy forwards HTTP requests. Set it to `false` to open a `CONNECT` tunnel for the connection. |
| `SendWholeUri` | `true` | In non-transparent mode, the request target is the absolute URI. Set it to `false` to send only the path and query. |
| `NonTransparentForHTTPS` | `true` | HTTPS and WSS still use a `CONNECT` tunnel when `IsTransparent` is `true`. |

```cs title="Always tunnel, path and query only"
var proxy = new HTTPProxy(
    new Uri("http://proxy.example.com:8080"),
    credentials: null,
    isTransparent: false,
    sendWholeUri: false,
    nonTransparentForHTTPS: true);
```

## Hosts that must bypass the proxy

`Proxy.Exceptions` is matched against the target host. Leave it unset to send every host through the proxy.

- `"example.com"` matches that host only.
- `".example.com"` matches that host and any host that ends with `.example.com`.
- `"*"` disables the proxy for every host.

```cs
var proxy = new HTTPProxy(new Uri("http://proxy.example.com:8080"));
proxy.Exceptions = new System.Collections.Generic.List<string>
{
    "localhost",
    ".internal.example"
};

HTTPManager.Proxy = proxy;
```

`SOCKSProxy` uses this same exception list.

## WebGL

`HTTPProxy` is not included in WebGL player builds. The browser owns the connection there and applies its own proxy settings. Editor play mode still compiles the type.

For discovering a proxy from the environment, the operating system, or Android, see [Proxy Autodetect](proxy-autodetect.md).
