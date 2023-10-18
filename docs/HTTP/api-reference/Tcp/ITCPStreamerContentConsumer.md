# ITCPStreamerContentConsumer

The ITCPStreamerContentConsumer interface represents a specialized content consumer for use with [TCPStreamer](../Tcp/TCPStreamer.md). It offers methods for writing data to the streamer and handling content-related events. 

**Remarks**:

Key Functions of ITCPStreamerContentConsumer: 

- **Data Writing:**: Provides methods to write data to the associated [TCPStreamer](../Tcp/TCPStreamer.md) instance, allowing content to be sent over the TCP connection. 
- **Content Handling:**: Defines event methods for notifying consumers when new content is available, the connection is closed, or errors occur during data transfer. 




## **Methods**:

### **Write**
: Writes the specified data buffer to the associated [TCPStreamer](../Tcp/TCPStreamer.md) instance. The data is copied into a new buffer and passed to the streamer for transmission. 

### **Write**
: Writes the specified [BufferSegment](../Memory/BufferSegment.md) directly to the associated [TCPStreamer](../Tcp/TCPStreamer.md) instance. The content of the buffer is passed to the streamer for transmission, and the ownership of the buffer is transferred to the [TCPStreamer](../Tcp/TCPStreamer.md) too. 

### **OnContent**
: Called when new content is available from the associated [TCPStreamer](../Tcp/TCPStreamer.md) instance. 

### **OnConnectionClosed**
: Called when the connection is closed by the remote peer. It notifies the content consumer about the connection closure. 

### **OnError**
: Called when an error occurs during content processing or connection handling. It provides the [TCPStreamer](../Tcp/TCPStreamer.md) instance and the **Exception** that caused the error. 