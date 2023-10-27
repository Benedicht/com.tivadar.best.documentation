---
comments: true
---
# DefaultRetryPolicy

Provides a default retry policy with predefined backoff times (0, 2, 10, 30 seconds). 


## **Methods**:

### [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable-1)&lt;[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan)&gt; GetNextRetryDelay([RetryContext](RetryContext.md))
: Determines the delay duration before the next connection attempt based on the given [RetryContext](RetryContext.md). 