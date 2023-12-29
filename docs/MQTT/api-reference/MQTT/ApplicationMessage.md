---
comments: true
---
# ApplicationMessage

https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901106 

## **Fields**:
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) IsDuplicate**
: Set to true if it's not the first occasion the broker sent this application message. 
### **[QoSLevels](../Packets/QoSLevels.md) QoS**
: QoS this application message sent with. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) Retain**
: Set to true if this is a retained application message. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Topic**
: The topic's name this application message is publish to. 
### **PayloadTypes PayloadFormat**
: Payload type (binary or text). 
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) ExpiryInterval**
: Expiry interval of the application message. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) ResponseTopic**
: Topic name where the publisher waiting for a response to this application message. 
### **[BufferSegment](../../../HTTP/api-reference/Memory/BufferSegment.md) CorrelationData**
: Arbitrary data sent with the application message. 
### **[List](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Generic.List-1)&lt;[KeyValuePair](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Generic.KeyValuePair-2)&lt;[String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)&gt;&gt; UserProperties**
: Key-value pairs sent with the application message. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) ContentType**
: Arbitrary value set by the publisher. 
### **[BufferSegment](../../../HTTP/api-reference/Memory/BufferSegment.md) Payload**
: Payload of the application message. 