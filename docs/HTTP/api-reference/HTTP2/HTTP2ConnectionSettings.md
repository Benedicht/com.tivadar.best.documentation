---
comments: true
---
# HTTP2ConnectionSettings

Settings for HTTP/2 connections. 

## **Fields**:
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) EnableHTTP2Connections**
: When set to false, the plugin will not try to use HTTP/2 connections. 
### **[UInt32](https://learn.microsoft.com/en-us/dotnet/api/System.UInt32) HeaderTableSize**
: Maximum size of the HPACK header table. 
### **[UInt32](https://learn.microsoft.com/en-us/dotnet/api/System.UInt32) MaxConcurrentStreams**
: Maximum concurrent http2 stream on http2 connection will allow. Its default value is 128; 
### **[UInt32](https://learn.microsoft.com/en-us/dotnet/api/System.UInt32) InitialStreamWindowSize**
: Initial window size of a http2 stream. Its default value is 65535, can be controlled through the HTTPRequest's DownloadSettings object. 
### **[UInt32](https://learn.microsoft.com/en-us/dotnet/api/System.UInt32) InitialConnectionWindowSize**
: Global window size of a http/2 connection. Its default value is the maximum possible value on 31 bits. 
### **[UInt32](https://learn.microsoft.com/en-us/dotnet/api/System.UInt32) MaxFrameSize**
: Maximum size of a http2 frame. 
### **[UInt32](https://learn.microsoft.com/en-us/dotnet/api/System.UInt32) MaxHeaderListSize**
: Not used. 
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) MaxIdleTime**
: With HTTP/2 only one connection will be open so we can keep it open longer as we hope it will be reused more. 
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) PingFrequency**
: Time between two ping messages. 
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) Timeout**
: Timeout to receive a ping acknowledgement from the server. If no ack reveived in this time the connection will be treated as broken. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) EnableConnectProtocol**
: Set to true to enable RFC 8441 "Bootstrapping WebSockets with HTTP/2" (https://tools.ietf.org/html/rfc8441). 
### **[WebSocketOverHTTP2Settings](WebSocketOverHTTP2Settings.md) WebSocketOverHTTP2Settings**
: Settings for WebSockets over HTTP/2 (RFC 8441) 