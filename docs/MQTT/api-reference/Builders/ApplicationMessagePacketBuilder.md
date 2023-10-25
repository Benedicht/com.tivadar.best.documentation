---
comments: true
---
# ApplicationMessagePacketBuilder

Builder to create an application message. https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901100


## **Methods**:

### **WithQoS**
: Build the packet with the given QoS level. 

### **WithRetain**
: Build the packet with the given retain flag. 

### **WithPayloadFormatIndicator**
: Build the packet with the given payload format indicator. 

### **WithMessageExpiryInterval**
: Set the application message's expiry interval (it's in seconds). 

### **WithResponseTopic**
: Set the application message's response topic. 

### **WithCorrelationData**
: Optional data sent with the application message. 

### **WithUserProperty**
: Optional key value pairs that will be sent with the application message. 

### **WithContentType**
: Optional Content-Type value to help process the application message's payload. 

### **WithPayload**
: Set the application message's payload. 

### **WithPayload**
: Set the application message's payload. It also sets the payload format indicator to PayloadTypes.UTF8. 

### **BeginPublish**
: Begin sending the application message to the broker. 