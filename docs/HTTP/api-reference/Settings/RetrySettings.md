# RetrySettings

Represents settings related to request retry behavior. 

## **Fields**:
### **Retries**
: Gets the number of times that the plugin has retried the request. 
### **MaxRetries**
: Gets or sets the maximum number of retry attempts allowed. To disable retries, set this value to 	. The default value is 	 for GET requests, otherwise 	. 
## **Methods**:

### **#ctor**
: Initializes a new instance of the RetrySettings class with the specified maximum retry attempts. 