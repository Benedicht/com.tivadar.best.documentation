---
comments: true
---
# IRetryPolicy

Defines a contract for implementing retry policies in case of connection failures. 


## **Methods**:

### **GetNextRetryDelay**
: Determines the delay duration before the next connection attempt based on the given [RetryContext](../SignalR/RetryContext.md). 