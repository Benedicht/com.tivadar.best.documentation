---
comments: true
---
# IncomingPacket

Represents a packet received from the the Socket.IO server. 

## **Fields**:
### **[IncomingPacket]() `#!cs IncomingPacket.Empty`**
: Represents an uninitialized packet. 
### **TransportEventTypes TransportEvent**
: Event type of this packet on the transport layer. 
### **[SocketIOEventTypes](SocketIOEventTypes.md) SocketIOEvent**
: The packet's type in the Socket.IO protocol. 
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) Id**
: The internal ack-id of this packet. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Namespace**
: The sender namespace's name. 
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) AttachementCount**
: Count of binary data expected after the current packet. 
### **[List](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Generic.List-1)&lt;[BufferSegment](../../../HTTP/api-reference/Memory/BufferSegment.md)&gt; Attachements**
: list of binary data received. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) EventName**
: The decoded event name from the payload string. 
### **[Object[]](https://learn.microsoft.com/en-us/dotnet/api/System.Object[]) DecodedArgs**
: The decoded arguments by the parser. 
### **[Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object) DecodedArg**
: Decoded argument if there's only one. Otherwise they are in the DecodedArgs property. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Payload**
: In case of JSon serialization, it's the json payload sent by the server. 
## **Methods**:

### **ToString**
: Returns with the Payload of this packet. 