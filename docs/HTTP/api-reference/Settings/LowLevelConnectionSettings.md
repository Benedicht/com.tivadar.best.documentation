---
comments: true
---
# LowLevelConnectionSettings

Represents the low-level TCP buffer settings for connections. 

## **Fields**:
### **TCPWriteBufferSize**
: Gets or sets the size of the TCP write buffer in bytes.  
	!!! note ""
		Default value is 1 MiB.

				This determines the maximum amount of data that that the [TCPStreamer](../Tcp/TCPStreamer.md) class can buffer up if it's already in a write operation. Increasing this value can potentially improve write performance, especially for large messages or data streams.  However, setting it too high might consume a significant amount of memory, especially if there are many active connections. 

### **ReadBufferSize**
: Gets or sets the size of the read buffer in bytes.  
	!!! note ""
		Default value is 1 MiB.

				This determines the maximum amount of data that low level streams and the [TCPStreamer](../Tcp/TCPStreamer.md) can buffer up for consuming by higher level layers. Adjusting this value can affect the read performance of the application.  Like the write buffer, setting this too high might be memory-intensive, especially with many connections.  It's advised to find a balance that suits the application's needs and resources. 
