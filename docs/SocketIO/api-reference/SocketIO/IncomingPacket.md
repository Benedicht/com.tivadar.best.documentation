# IncomingPacket

Represents a packet received from the the Socket.IO server. 

## **Fields**:
### **Empty**
: Represents an uninitialized packet. 
### **TransportEvent**
: Event type of this packet on the transport layer. 
### **SocketIOEvent**
: The packet's type in the Socket.IO protocol. 
### **Id**
: The internal ack-id of this packet. 
### **Namespace**
: The sender namespace's name. 
### **AttachementCount**
: Count of binary data expected after the current packet. 
### **Attachements**
: list of binary data received. 
### **EventName**
: The decoded event name from the payload string. 
### **DecodedArgs**
: The decoded arguments by the parser. 
### **DecodedArg**
: Decoded argument if there's only one. Otherwise they are in the DecodedArgs property. 
### **Payload**
: In case of JSon serialization, it's the json payload sent by the server. 
## **Methods**:

### **ToString**
: Returns with the Payload of this packet. 