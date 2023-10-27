---
comments: true
---
# HTTP1ConnectionSettings

Settings for HTTP/1 connections. 

## **Fields**:
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) TryToReuseConnections**
: Indicates whether the connection should be open after receiving the response. 
	!!! note ""
		If set to `true`, internal TCP connections will be reused whenever possible. If making rare requests to the server, it's recommended to change this to `false`. 

### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) MaxConnectionIdleTime**
: The maximum time a connection can remain idle before being closed. 