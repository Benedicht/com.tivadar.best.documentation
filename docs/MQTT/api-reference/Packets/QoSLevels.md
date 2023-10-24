---
comments: true
---
# QoSLevels

Quality of Service Levels https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901103

## **Fields**:
### **AtMostOnceDelivery**
: The message is delivered according to the capabilities of the underlying network. No response is sent by the receiver and no retry is performed by the sender. The message arrives at the receiver either once or not at all. https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901235
### **AtLeastOnceDelivery**
: This Quality of Service level ensures that the message arrives at the receiver at least once.  https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901236
### **ExactlyOnceDelivery**
: This is the highest Quality of Service level, for use when neither loss nor duplication of messages are acceptable. There is an increased overhead associated with QoS 2. https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901237
### **Reserved**
: Must not be used! 