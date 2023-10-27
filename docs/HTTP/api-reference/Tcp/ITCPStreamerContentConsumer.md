---
comments: true
---
# ITCPStreamerContentConsumer

The ITCPStreamerContentConsumer interface represents a specialized content consumer for use with [TCPStreamer](TCPStreamer.md). It offers methods for writing data to the streamer and handling content-related events. 

**Remarks:**

Key Functions of ITCPStreamerContentConsumer: 

- **Data Writing**: Provides methods to write data to the associated [TCPStreamer](TCPStreamer.md) instance, allowing content to be sent over the TCP connection. 
- **Content Handling**: Defines event methods for notifying consumers when new content is available, the connection is closed, or errors occur during data transfer. 




## **Methods**:

### Write(Byte[], Int32, Int32)
: Writes the specified data buffer to the associated [TCPStreamer](TCPStreamer.md) instance. The data is copied into a new buffer and passed to the streamer for transmission. 

### Void Write([BufferSegment](../Memory/BufferSegment.md))
: Writes the specified [BufferSegment](../Memory/BufferSegment.md) directly to the associated [TCPStreamer](TCPStreamer.md) instance. The content of the buffer is passed to the streamer for transmission, and the ownership of the buffer is transferred to the [TCPStreamer](TCPStreamer.md) too. 

### Void OnContent([TCPStreamer](TCPStreamer.md))
: Called when new content is available from the associated [TCPStreamer](TCPStreamer.md) instance. 

### Void OnConnectionClosed([TCPStreamer](TCPStreamer.md))
: Called when the connection is closed by the remote peer. It notifies the content consumer about the connection closure. 

### Void OnError([TCPStreamer](TCPStreamer.md), [Exception](https://learn.microsoft.com/en-us/dotnet/api/System.Exception))
: Called when an error occurs during content processing or connection handling. It provides the [TCPStreamer](TCPStreamer.md) instance and the [Exception](https://learn.microsoft.com/en-us/dotnet/api/System.Exception) that caused the error. 