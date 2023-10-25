---
comments: true
---
# DefaultRetryPolicy

Provides a default retry policy with predefined backoff times (0, 2, 10, 30 seconds). 


## **Methods**:

### **GetNextRetryDelay**
: Determines the delay duration before the next connection attempt based on the given [RetryContext](RetryContext.md). 