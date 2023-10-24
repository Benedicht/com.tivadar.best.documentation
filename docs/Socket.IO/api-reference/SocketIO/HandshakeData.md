---
comments: true
---
# HandshakeData

Helper class to parse and hold handshake information. 

## **Fields**:
### **Sid**
: Session ID of this connection. 
### **Upgrades**
: List of possible upgrades. 
### **PingInterval**
: What interval we have to set a ping message. 
### **PingTimeout**
: What time have to pass without an answer to our ping request when we can consider the connection disconnected. 
### **MaxPayload**
: This defines how many bytes a single message can be, before the server closes the socket. 