---
comments: true
---
# ServerConnectAckMessage

Container for a server-sent Connect acknowledgement message. [https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901074](https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901074)

## **Fields**:
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) SessionPresent**
: True if the server could resume to a previous session. 
### **[UInt16](https://learn.microsoft.com/en-us/dotnet/api/System.UInt16) ReceiveMaximum**
: The Server uses this value to limit the number of QoS 1 and QoS 2 publications that it is willing to process concurrently for the Client. It does not provide a mechanism to limit the QoS 0 publications that the Client might try to send. If the Receive Maximum value is absent, then its value defaults to 65,535. 
### **[UInt32](https://learn.microsoft.com/en-us/dotnet/api/System.UInt32) MaximumPacketSize**
: Maximum Packet Size the Server is willing to accept 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) AssignedClientIdentifier**
: Server assigned ClientId. 
	!!! note ""
		The Client Identifier which was assigned by the Server because a zero length Client Identifier was found in the CONNECT packet.
