---
comments: true
---
# ApplicationMessage

https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901106 

## **Fields**:
### **PacketId**
: https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901108 
### **SubscriptionId**
: https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901117 
### **IsDuplicate**
: Set to true if it's not the first ocassion the broker sent this application message. 
### **QoS**
: QoS this application message sent with. 
### **Retain**
: Set to true if this is a retained application message. 
### **Topic**
: The topic's name this application message is publish to. 
### **PayloadFormat**
: Payload type (binary or text). 
### **ExpiryInterval**
: Expiry interval of the application message. 
### **TopicAlias**
: Topic alias index the broker used. 
### **ResponseTopic**
: Topic name where the publisher waiting for a response to this application message. 
### **CorrelationData**
: Arbitrary data sent with the application message. 
### **UserProperties**
: Key-value pairs sent with the application message. 
### **ContentType**
: Arbitrary value set by the publisher. 
### **Payload**
: Payload of the application message. 