# TimeoutSettings

Represents settings related to connection-timeouts and processing duration. 

## **Fields**:
### **QueuedAt**
: Gets the timestamp when the request was queued for processing. 
### **ProcessingStarted**
: Gets the timestamp when the processing of the request started by a connection. 
### **ConnectTimeout**
: Gets or sets the maximum time to wait for establishing the connection to the target server. If set to 	 or lower, no connect timeout logic is executed. Default value is 20 seconds. 
### **Timeout**
: Gets or sets the maximum time to wait for the request to finish after the connection is established. 
## **Methods**:

### **IsConnectTimedOut**
: Returns 	 if the request has been stuck in the connection phase for too long. 

### **IsTimedOut**
: Returns 	 if the time has passed the specified Timeout setting since processing started or if the connection has timed out. 

### **#ctor**
: Initializes a new instance of the TimeoutSettings class for a specific [HTTPRequest](../HTTP/HTTPRequest.md)	. 