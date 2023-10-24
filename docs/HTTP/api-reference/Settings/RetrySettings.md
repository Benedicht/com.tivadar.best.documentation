---
comments: true
---
# RetrySettings

Represents settings related to request retry behavior. 

## **Fields**:
### **Retries**
: Gets the number of times that the plugin has retried the request. 
### **MaxRetries**
: Gets or sets the maximum number of retry attempts allowed. To disable retries, set this value to `0`. The default value is `1` for GET requests, otherwise `0`. 
## **Methods**:

### **#ctor**
: Initializes a new instance of the RetrySettings class with the specified maximum retry attempts. 