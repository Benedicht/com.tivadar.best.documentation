---
comments: true
---

# Connection Pooling in HTTP/1.1
!!! note "This discussion is pertinent to HTTP/1.1 requests. HTTP/2 employs distinct messaging techniques to facilitate state changes between client and server, eliminating the need for such pooling strategies."

## Understanding Connection Reuse
Establishing a TCP connection, especially with the added overhead of negotiating TLS for HTTPS, can be time-consuming. 
By reusing connections for subsequent requests, we can sidestep these delays. 
The plugin signals its intent to reuse the connection by dispatching a `“Connection: Keep-Alive”` header. 
However, while the server can hint at its waiting period via a returned `Keep-Alive` header too, this is a rarely employed tactic. 
This absence means both entities operate without full visibility into each other's configurations, relying solely on the `keep-alive` header for connection status.

## Challenges with Asynchronous Closure
Imagine a scenario: the server terminates an idle connection after 5 seconds, while the client try to utilise a 20-second duration. 
The client's attempt to reuse the connection after the 5-second threshold will inevitably result in a failed request.

**Solutions:**

- **Synchronize Settings:** Adjust either the server's or client's timeout settings to mirror the other. This strategy promotes maximum reuse of the TCP connection.
- **Disable Connection Reuse:** This is a safe, although most of the times inefficient approach (one exception is when sporadic requests would fall outside the idle duration anyway).

However, even synchronized settings present challenges. The server begins its countdown after response dispatch, while the client does so upon receiving it. 
High network latency can skew this timing, increasing the risk of using a closed connection. 
If leveraging connection pooling with a focus on safety, it's advisable to set the client’s timeout about a second shorter than the server's.

## Configuration in Best HTTP:

To set the client's idle time:

```cs
// TODO: 
```

To disable connection pooling:
```cs
// TODO: 
```