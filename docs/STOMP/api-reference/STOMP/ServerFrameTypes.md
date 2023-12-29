---
comments: true
---
# ServerFrameTypes

Types of frames that can be received from a STOMP server. 

## **Fields**:
### **ServerFrameTypes.Connected**
: Indicates a frame sent by the server to acknowledge a successful connection. 
### **ServerFrameTypes.Message**
: Represents a message frame containing data sent from a destination. 
### **ServerFrameTypes.Receipt**
: Indicates a receipt frame sent by the server in response to a client's request that required acknowledgment. 
### **ServerFrameTypes.Error**
: Represents an error frame sent by the server in response to an erroneous client action or message. 
### **ServerFrameTypes.Ping**
: Represents a ping frame used for maintaining the connection alive. 