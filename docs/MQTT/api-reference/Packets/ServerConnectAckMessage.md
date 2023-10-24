---
comments: true
---
# ServerConnectAckMessage

Container for a server-sent Connect acknowledgement message. https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901074

## **Fields**:
### **SessionPresent**
: True if the server could resume to a previous session. 
### **ReceiveMaximum**
: The Server uses this value to limit the number of QoS 1 and QoS 2 publications that it is willing to process concurrently for the Client. It does not provide a mechanism to limit the QoS 0 publications that the Client might try to send. If the Receive Maximum value is absent, then its value defaults to 65,535. 
### **MaximumPacketSize**
: Maximum Packet Size the Server is willing to accept 
### **AssignedClientIdentifier**
: Server assigned ClientId. 
	!!! note ""
		The Client Identifier which was assigned by the Server because a zero length Client Identifier was found in the CONNECT packet.
