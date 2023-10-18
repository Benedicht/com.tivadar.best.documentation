# HTTP1ConnectionSettings

Settings for HTTP/1 connections. 

## **Fields**:
### **TryToReuseConnections**
: Indicates whether the connection should be open after receiving the response. 
	!!! note ""
		If set to 		, internal TCP connections will be reused whenever possible. If making rare requests to the server, it's recommended to change this to 		. 

### **MaxConnectionIdleTime**
: The maximum time a connection can remain idle before being closed. 