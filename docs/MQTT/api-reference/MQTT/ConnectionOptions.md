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
### **Host**
: Host name or IP address of the broker. 
### **Port**
: Port number where the broker is listening on. 
### **UseTLS**
: Whether to use a secure protocol (TLS over TCP or wss://). 
### **Transport**
: Selected transport to connect with. 
### **Path**
: Optional path for websocket, its default is "/mqtt". 
### **ProtocolVersion**
: The protocol version that the plugin has to use to connect with to the server. 