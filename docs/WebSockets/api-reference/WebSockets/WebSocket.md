---
comments: true
---
# WebSocket

Implements the WebSocket standard for duplex, two-way communications. 

## **Fields**:
### **MaxFragmentSize**
: Maximum payload size of a websocket frame. Its default value is 32 KiB. 
### **IsOpen**
: The connection to the WebSocket server is open. 
### **BufferedAmount**
: Data waiting to be written to the wire. 
### **SendPings**
: Set to `true` to start sending Ping frames to the WebSocket server. 
### **PingFrequency**
: The delay between two Pings in milliseconds. Minimum value is 100ms, default is 10 seconds. 
### **CloseAfterNoMessage**
: If [SendPings](WebSocket.md#sendpings) set to `true`, the plugin will close the connection and emit an [OnClosed](WebSocket.md#onclosed) event if no message is received from the server in the given time. Its default value is 2 sec. 
### **InternalRequest**
: The internal [HTTPRequest](../../../HTTP/api-reference/HTTP/HTTPRequest.md) object. 
### **Extensions**
: [IExtension](../Extensions/IExtension.md)	 implementations the plugin will negotiate with the server to use. 
### **Latency**
: Latency calculated from ping-pong message round-trip times. 
### **LastMessageReceived**
: When the WebSocket instance received the last message from the server. 
### **OnInternalRequestCreated**
: When the `Websocket Over HTTP/2` implementation fails to connect and [WebSocketOverHTTP2Settings](../../../HTTP/api-reference/HTTP2/WebSocketOverHTTP2Settings.md)`.`[EnableImplementationFallback](../../../HTTP/api-reference/HTTP2/WebSocketOverHTTP2Settings.md#enableimplementationfallback) is `true`, the plugin tries to fall back to the HTTP/1 implementation. When this happens a new [InternalRequest](WebSocket.md#internalrequest) is created and all previous custom modifications (like added headers) are lost. With OnInternalRequestCreated these modifications can be reapplied. 
### **OnOpen**
: Called when the connection to the WebSocket server is established. 
### **OnMessage**
: Called when a new textual message is received from the server. 
### **OnBinary**
: Called when a Binary message received.  The content of the [BufferSegment](../../../HTTP/api-reference/Memory/BufferSegment.md) must be used or copied to a new array in the callbacks because the plugin reuses the memory immediately after the callback by placing it back to the [BufferPool](../../../HTTP/api-reference/Memory/BufferPool.md)! 
	!!! note ""
		Note that the memory will be reused when this event returns. Either process it in this call or make a copy from the received data.

### **OnClosed**
: Called when the WebSocket connection is closed. 
### **Context**
: Logging context of this websocket instance. 
## **Methods**:

### **Open**
: Start the opening process. 
	!!! note ""
		It's a non-blocking call. To get notified when the WebSocket instance is considered open and can send/receive, use the [OnOpen](WebSocket.md#onopen) event.


### **Send**
: It will send the given textual message to the remote server. 

### **Send**
: It will send the given binary message to the remote server. 

### **Send**
: It will send the given binary message to the remote server. 

### **SendAsBinary**
: Will send the data in one or more binary frame and takes ownership over it calling BufferPool.Release when the data sent. 

### **SendAsText**
: Will send data as a text frame and takes owenership over the memory region releasing it to the BufferPool as soon as possible. 

### **Close**
: It will initiate the closing of the connection to the server. 

### **Close**
: It will initiate the closing of the connection to the server sending the given code and message. 