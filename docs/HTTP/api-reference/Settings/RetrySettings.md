---
comments: true
---
# RetrySettings

Represents settings related to request retry behavior. 

## **Fields**:
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) Retries**
: Gets the number of times that the plugin has retried the request. 
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) MaxRetries**
: Gets or sets the maximum number of retry attempts allowed. To disable retries, set this value to `0`. The default value is `1` for GET requests, otherwise `0`. 