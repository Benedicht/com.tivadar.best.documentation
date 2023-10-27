---
comments: true
---
# ConnectionOptions

Connection related options to pass to the MQTTClient. 

## Examples
!!! Example

	```cs title="Simple example on how to create a connection:"
	ConnectionOptions options = new ConnectionOptions
	{
	    Host = "localhost",
	    Port = 1883,
	    ProtocolVersion = SupportedProtocolVersions.MQTT_3_1_1
	};
	
	var client = new MQTTClient(options);
	```
## **Fields**:
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Host**
: Host name or IP address of the broker. 
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) Port**
: Port number where the broker is listening on. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) UseTLS**
: Whether to use a secure protocol (TLS over TCP or wss://). 
### **[SupportedTransports](SupportedTransports.md) Transport**
: Selected transport to connect with. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Path**
: Optional path for websocket, its default is "/mqtt". 
### **[SupportedProtocolVersions](SupportedProtocolVersions.md) ProtocolVersion**
: The protocol version that the plugin has to use to connect with to the server. 