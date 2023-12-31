---
comments: true
---
# TimeoutSettings

Represents settings related to connection-timeouts and processing duration. 

## **Fields**:
### **[DateTime](https://learn.microsoft.com/en-us/dotnet/api/System.DateTime) QueuedAt**
: Gets the timestamp when the request was queued for processing. 
### **[DateTime](https://learn.microsoft.com/en-us/dotnet/api/System.DateTime) ProcessingStarted**
: Gets the timestamp when the processing of the request started by a connection. 
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) ConnectTimeout**
: Gets or sets the maximum time to wait for establishing the connection to the target server. If set to `TimeSpan.Zero` or lower, no connect timeout logic is executed. Default value is 20 seconds. 
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) Timeout**
: Gets or sets the maximum time to wait for the request to finish after the connection is established. 
## **Methods**:

### [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) IsConnectTimedOut([DateTime](https://learn.microsoft.com/en-us/dotnet/api/System.DateTime))
: Returns `true` if the request has been stuck in the connection phase for too long. 

### [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) IsTimedOut([DateTime](https://learn.microsoft.com/en-us/dotnet/api/System.DateTime))
: Returns `true` if the time has passed the specified Timeout setting since processing started or if the connection has timed out. 