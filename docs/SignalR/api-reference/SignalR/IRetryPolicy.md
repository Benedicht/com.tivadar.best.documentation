---
comments: true
---
# IRetryPolicy

Defines a contract for implementing retry policies in case of connection failures. 


## **Methods**:

### [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable-1)&lt;[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan)&gt; GetNextRetryDelay([RetryContext](RetryContext.md))
: Determines the delay duration before the next connection attempt based on the given [RetryContext](RetryContext.md). 