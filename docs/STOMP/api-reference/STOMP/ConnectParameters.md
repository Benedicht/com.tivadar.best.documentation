---
comments: true
---
# ConnectParameters

Represents the connection parameters required for establishing a connection with a STOMP broker. 

## **Fields**:
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Host**
: Gets or sets the host name or IP address of the broker. 
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) Port**
: Gets or sets the port number where the broker is listening. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) UseTLS**
: Gets or sets a value indicating whether to use a secure protocol (TLS over TCP; or wss:// for WebSockets). 
### **[SupportedTransports](SupportedTransports.md) Transport**
: Gets or sets the selected transport protocol to use for connecting. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Path**
: Gets or sets the optional path for WebSocket connections. Default is "/ws". 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) VirtualHost**
: The virtual host to use for the connection. If null or empty, Uri.Host will be used. 
### **[Credentials](../../../HTTP/api-reference/Authentication/Credentials.md) Credentials**
: Credentials for authentication, if required by the broker. 
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) PreferredOutgoingHeartbeats**
: Gets or sets the preferred heartbeat interval for outgoing heartbeat messages. 
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) PreferredIncomingHeartbeats**
: Gets or sets the preferred heartbeat interval for incoming heartbeat messages. 
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) Timeout**
: Gets or sets the timeout for broker heartbeats. 
### **[Dictionary](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Generic.Dictionary-2)&lt;[String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)&gt; Headers**
: Additional headers to send with the first, connect packet. 