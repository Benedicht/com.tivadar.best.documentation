# RetryContext

Represents context information related to a retry attempt. 

## **Fields**:
### **PreviousRetryCount**
: Previous reconnect attempts. A successful connection sets it back to zero. 
### **ElapsedTime**
: Elapsed time since the original connection error. 
### **RetryReason**
: String representation of the connection error. 