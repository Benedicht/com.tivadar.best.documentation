# DefaultRetryPolicy

Provides a default retry policy with predefined backoff times (0, 2, 10, 30 seconds). 


## **Methods**:

### **#ctor**
: Initializes a new instance of the DefaultRetryPolicy class with default backoff times. 

### **#ctor**
: Initializes a new instance of the DefaultRetryPolicy class with custom backoff times. 

### **GetNextRetryDelay**
: Determines the delay duration before the next connection attempt based on the given [RetryContext](../SignalR/RetryContext.md). 