---
comments: true
---
# RetryContext

Represents context information related to a retry attempt. 

## **Fields**:
### **[UInt32](https://learn.microsoft.com/en-us/dotnet/api/System.UInt32) PreviousRetryCount**
: Previous reconnect attempts. A successful connection sets it back to zero. 
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) ElapsedTime**
: Elapsed time since the original connection error. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) RetryReason**
: String representation of the connection error. 