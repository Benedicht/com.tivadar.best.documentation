---
comments: true
---

# SOCKSv5 Proxies

`SOCKSProxy` (`Best.HTTP.Proxies`) connects through a SOCKS version 5 proxy ([RFC 1928](https://www.rfc-editor.org/rfc/rfc1928)). The plugin sends a CONNECT command and then uses the resulting tunnel for HTTP, HTTPS, WebSocket, and the other protocols built on Best HTTP.

```cs title="Global SOCKS proxy"
using Best.HTTP.Proxies;
using Best.HTTP.Shared;

HTTPManager.Proxy = new SOCKSProxy(new Uri("http://socks.example.com:1080"), null);
```

```cs title="One request"
request.ProxySettings.Proxy = new SOCKSProxy(new Uri("http://socks.example.com:1080"), null);
```

As with [`HTTPProxy`](http-proxies.md), the address is an `http://host:port` URI of the proxy itself. A per-request `ProxySettings.Proxy` replaces `HTTPManager.Proxy` for that request. Set it to `null` to connect directly.

The target host can be a domain name, an IPv4 address, or an IPv6 address.

## Authentication

Pass `null` when the proxy does not require authentication. The client then offers only "no authentication required".

When `Credentials` are set, the client offers username/password authentication ([RFC 1929](https://www.rfc-editor.org/rfc/rfc1929)) and "no authentication required", and the server chooses. The username and the password must each be 255 bytes or shorter. GSSAPI is not offered.

```cs
using Best.HTTP.Request.Authentication;

HTTPManager.Proxy = new SOCKSProxy(
    new Uri("http://socks.example.com:1080"),
    new Credentials("user", "password"));
```

SOCKS authentication happens in the SOCKS handshake. It does not use HTTP `Proxy-Authorization` or a `407` response.

## Bypassing the proxy

`Exceptions` has the same matching rules as on [`HTTPProxy`](http-proxies.md#hosts-that-must-bypass-the-proxy): an exact host, a leading-dot suffix that also matches subdomains, or `"*"` to skip the proxy entirely.

## WebGL

`SOCKSProxy` is not included in WebGL player builds. The browser owns the connection there. Editor play mode still compiles the type.
