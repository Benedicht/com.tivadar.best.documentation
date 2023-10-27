---
comments: true
---
# HandshakeData

Helper class to parse and hold handshake information. 

## **Fields**:
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Sid**
: Session ID of this connection. 
### **[List](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Generic.List-1)&lt;[String](https://learn.microsoft.com/en-us/dotnet/api/System.String)&gt; Upgrades**
: List of possible upgrades. 
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) PingInterval**
: What interval we have to set a ping message. 
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) PingTimeout**
: What time have to pass without an answer to our ping request when we can consider the connection disconnected. 
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) MaxPayload**
: This defines how many bytes a single message can be, before the server closes the socket. 