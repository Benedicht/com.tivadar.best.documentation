# RedirectSettings

Represents settings related to handling HTTP request redirection. 

## **Fields**:
### **IsRedirected**
: Indicates whether the request has been redirected. A request's IsRedirected might be true while [RedirectCount](../RedirectSettings/.md#RedirectCount)	 is zero if the redirection is made to the local cache. 
### **RedirectUri**
: The Uri that the request is redirected to. 
### **MaxRedirects**
: How many redirection is supported for this request. The default is 10. Zero or a negative value means no redirections are supported. 
### **RedirectCount**
: Gets the number of times the request has been redirected. 
## **Methods**:

### ****
: Occurs before the plugin makes a new request to the new URI during redirection. The return value of this event handler controls whether the redirection is aborted (	) or allowed (	). This event is called on a thread other than the main Unity thread. 

### **#ctor**
: Initializes a new instance of the RedirectSettings class with the specified maximum redirections. 

### **Reset**
: Resets [IsRedirected](../RedirectSettings/.md#IsRedirected)	 and [RedirectCount](../RedirectSettings/.md#RedirectCount)	 to their default values. 