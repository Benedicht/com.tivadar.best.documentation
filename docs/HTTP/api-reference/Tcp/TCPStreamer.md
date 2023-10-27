---
comments: true
---
# TCPStreamer

The TCPStreamer class is a versatile component that abstracts the complexities of TCP communication, making it easier to handle data streaming between networked applications or devices. It ensures reliable and efficient data transfer while handling various aspects of network communication and error management. 

**Remarks:**

TCPStreamer serves several key functions: 

- **Data Streaming**: It enables the streaming of data between two endpoints over a TCP connection, ideal for scenarios involving the transfer of large data volumes in manageable chunks. 
- **Buffer Management**: The class efficiently manages buffering for both incoming and outgoing data, ensuring smooth and efficient data transfer. 
- **Asynchronous Communication**: Utilizing asynchronous communication patterns, it supports non-blocking operations, essential for applications requiring concurrent data processing. 
- **Error Handling**: Comprehensive error-handling mechanisms address exceptions that may occur during TCP communication, enhancing robustness in the face of network issues or errors. 
- **Resource Management**: It handles memory buffer management and resource disposal when the TCP connection is closed or the class is disposed. 
- **Integration with Heartbeat**: Implementing the `IHeartbeat` interface, it can be seamlessly integrated into systems using heartbeat mechanisms for network connection monitoring and management. 



## **Fields**:
### **[ITCPStreamerContentConsumer](ITCPStreamerContentConsumer.md) ContentConsumer**
: Gets or sets the content consumer that interacts with this [TCPStreamer]() instance, allowing data to be written to the streamer for transmission. 
### **[Socket](https://learn.microsoft.com/en-us/dotnet/api/System.Net.Sockets.Socket) Socket**
: Gets the underlying [Socket](#socket-socket) associated with this [TCPStreamer]() instance. 
### **[LoggingContext](../Logger/LoggingContext.md) Context**
: Gets the optional [LoggingContext](../Logger/LoggingContext.md) associated with this [TCPStreamer]() instance, facilitating logging and diagnostics. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) IsConnectionClosed**
: Gets a value indicating whether the TCP connection is closed. 
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) MinReceiveBufferSize**
: Gets the minimum receive buffer size for the TCP socket. 
### **[Int64](https://learn.microsoft.com/en-us/dotnet/api/System.Int64) Length**
: Gets the total length of buffered data for reading from the stream. 
## **Methods**:

### **DequeueReceived**
: Dequeues received data from the stream's buffer and returns a [BufferSegment](../Memory/BufferSegment.md) containing the data. 

### **BeginReceive**
: Begins receiving data from the TCP connection asynchronously. This method ensures that only one receive operation happens at a time. 
	!!! note ""
		When calling this method, it ensures that there is only one active receive operation at a time, preventing overlapping receives. This optimization helps prevent data loss and improves the reliability of the receive process. 


### **EnqueueToSend**
: Enqueues data to be sent over the TCP connection. The data is added to the stream's outgoing buffer for transmission. 

### **Dispose**
: Disposes of the [TCPStreamer]() instance, releasing associated resources. 