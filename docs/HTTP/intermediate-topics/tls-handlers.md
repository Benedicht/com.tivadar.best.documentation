---
comments: true
---

# TLS Handlers

Secure connections pick a TLS backend from the host's `TLSSettings.TLSHandler`. The default is `TLSHandlers.BouncyCastle` when Bouncy Castle is compiled in, and `TLSHandlers.Framework` when `BESTHTTP_DISABLE_ALTERNATE_SSL` is defined. Change it for one host or for every host through [per-host settings](../../Shared/connections/per-host-settings.md):

```cs
using Best.HTTP.Hosts.Settings;
using Best.HTTP.Shared;

HTTPManager.PerHostSettings.Get("example.com").TLSSettings.TLSHandler = TLSHandlers.Native;
```

`TLSHandlers` has three values:

| Handler | Implementation | Notes |
| --- | --- | --- |
| `BouncyCastle` | Bundled Bouncy Castle TLS 1.3 client | Default when Bouncy Castle is compiled in. Supports HTTP/1.1 and HTTP/2 through ALPN, and can offer TLS 1.3 0-RTT early data. |
| `Framework` | .NET `SslStream` | Uses the runtime's TLS stack. Certificate validation and client certificates are configured on `FrameworkTLSSettings`. This handler does not advertise ALPN, so connections stay on HTTP/1.1. |
| `Native` | Bundled [AWS-LC](https://github.com/aws/aws-lc) 5.11.0 | TLS 1.3 only. Negotiates HTTP/2 and HTTP/1.1 through ALPN. |

WebGL player builds do not include these handlers. The browser performs TLS there.

## Bouncy Castle

`BouncyCastleSettings.EnableTls0Rtt` defaults to `true`. When a resumable session ticket allows it, idempotent requests (`GET`, `HEAD`, `OPTIONS`) may send early data. Set the flag to `false` on the host to turn that off:

```cs
HTTPManager.PerHostSettings.Get("*")
    .TLSSettings.BouncyCastleSettings.EnableTls0Rtt = false;
```

`TlsClientFactory` replaces the client used for that host. Returning `null`, or throwing, falls back to `BouncyCastleSettings.DefaultTlsClientFactory`.

## .NET SslStream

`FrameworkTLSSettings` controls the protocol versions, revocation check, server-certificate callback, and client-certificate selector. The upgrade guide shows the previous `HTTPManager` properties and their per-host replacements.

## AWS-LC

`TLSHandlers.Native` loads the bundled `besthttp_awslc` library (linked statically on iOS and tvOS). The handshake offers only TLS 1.3. Cipher suites are AWS-LC's TLS 1.3 defaults:

- `TLS_AES_128_GCM_SHA256`
- `TLS_AES_256_GCM_SHA384`
- `TLS_CHACHA20_POLY1305_SHA256`

ChaCha20-Poly1305 is ordered first when the CPU has no AES acceleration. The server certificate is checked against the operating system trust store, and the target host name is verified.

Application protocols are offered in the same order the connection reports them. With HTTP/2 enabled, that is `h2` and then `http/1.1`. The protocol the server selects is the one the connection uses. When the server selects none, the connection uses HTTP/1.1.

`NativeTlsSettings` is present for host-level configuration and currently has no fields. There is no client-certificate callback and no TLS 1.3 0-RTT on this handler. If the native library cannot be loaded, the connection fails with that load error.

Defining `BESTHTTP_DISABLE_ALTERNATE_SSL` compiles out Bouncy Castle, including `TLSHandlers.BouncyCastle` and 0-RTT. HTTP/2 and WebSocket over HTTP/2 stay in the build. The default handler in that configuration is `Framework`, which does not advertise ALPN. Set `TLSHandler` to `Native` to negotiate HTTP/2.

Binaries are included for Windows (x64 and arm64), Linux (x64 and arm64), macOS, iOS, tvOS, and Android arm64. The handler is not available in WebGL player builds.

AWS-LC and the code compiled into it are covered in [Third-Party Notices](../third-party-notices.md#aws-lc).
