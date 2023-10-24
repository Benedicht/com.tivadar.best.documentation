---
comments: true
---
# NegotiatedOptions

Options that the client and server must agree on. Values that the client would like to use are the root fields (Client*) and the server's own are in the ServerOptions. 

## **Fields**:
### **ClientKeepAlive**
: Client set keep-alive time in seconds. 
### **ClientMaximumPacketSize**
: Maximum Packet Size the Client is willing to accept 
### **ClientReceiveMaximum**
: The Client uses this value to limit the number of QoS 1 and QoS 2 publications that it is willing to process concurrently. There is no mechanism to limit the QoS 0 publications that the Server might try to send. The value of Receive Maximum applies only to the current Network Connection. If the Receive Maximum value is absent then its value defaults to 65,535. 
### **ServerOptions**
: It's available only after the State is changed to Connected! 