# TCPStreamer

The TCPStreamer class is a versatile component that abstracts the complexities of TCP communication, making it easier to handle data streaming between networked applications or devices. It ensures reliable and efficient data transfer while handling various aspects of network communication and error management. 

**Remarks**:

TCPStreamer serves several key functions: 

- **Data Streaming:**: 
- **Buffer Management:**: 
- **Asynchronous Communication:**: 
- **Error Handling:**: 
- **Resource Management:**: 
- **Integration with Heartbeat:**: 



## **Fields**:
### **ContentConsumer**
: Gets or sets the content consumer that interacts with this [TCPStreamer](../Tcp/TCPStreamer.md)	 instance, allowing data to be written to the streamer for transmission. 
### **Socket**
: Gets the underlying [Socket](../TCPStreamer/.md#Socket)	 associated with this [TCPStreamer](../Tcp/TCPStreamer.md)	 instance. 
### **Context**
: Gets the optional [LoggingContext](../Logger/LoggingContext.md)	 associated with this [TCPStreamer](../Tcp/TCPStreamer.md)	 instance, facilitating logging and diagnostics. 
### **IsConnectionClosed**
: Gets a value indicating whether the TCP connection is closed. 
### **MinReceiveBufferSize**
: Gets the minimum receive buffer size for the TCP socket. 
### **Length**
: Gets the total length of buffered data for reading from the stream. 
### **MaxBufferedReadAmount**
: Gets or sets the maximum amount of buffered data allowed for reading from the stream. 
### **MaxBufferedWriteAmount**
: Gets or sets the maximum amount of buffered data allowed for writing to the stream. 
### **IsEnabled**
: Setting this property to false the pooling mechanism can be disabled. 
### **RemoveOlderThan**
: Buffer entries that released back to the pool and older than this value are moved when next maintenance is triggered. 
### **RunMaintenanceEvery**
: How often pool maintenance must run. 
## **Methods**:

### **#ctor**
: Initializes a new instance of the TCPStreamer class with the specified **Socket**	 and parent [LoggingContext](../Logger/LoggingContext.md)	. 

### **DequeueReceived**
: Dequeues received data from the stream's buffer and returns a [BufferSegment](../Memory/BufferSegment.md)	 containing the data. 

### **BeginReceive**
: Begins receiving data from the TCP connection asynchronously. This method ensures that only one receive operation happens at a time. 
	!!! note ""
		When calling this method, it ensures that there is only one active receive operation at a time, preventing overlapping receives. This optimization helps prevent data loss and improves the reliability of the receive process. 


### **EnqueueToSend**
: Enqueues data to be sent over the TCP connection. The data is added to the stream's outgoing buffer for transmission. 

### **Dispose**
: Disposes of the [TCPStreamer](../Tcp/TCPStreamer.md)	 instance, releasing associated resources. 

### **Close**
: Closes the TCP connection gracefully and performs cleanup operations. 