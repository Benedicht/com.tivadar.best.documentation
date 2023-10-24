---
comments: true
---
# RedirectSettings

Represents settings related to handling HTTP request redirection. 

## **Fields**:
### **IsRedirected**
: Indicates whether the request has been redirected. A request's IsRedirected might be true while [RedirectCount](../Settings/RedirectSettings.md#redirectcount) is zero if the redirection is made to the local cache. 
### **RedirectUri**
: The Uri that the request is redirected to. 
### **MaxRedirects**
: How many redirection is supported for this request. The default is 10. Zero or a negative value means no redirections are supported. 
### **RedirectCount**
: Gets the number of times the request has been redirected. 
### **OnBeforeRedirection**
: Occurs before the plugin makes a new request to the new URI during redirection. The return value of this event handler controls whether the redirection is aborted (`false`) or allowed (`true`). This event is called on a thread other than the main Unity thread. 
## **Methods**:

### **#ctor**
: Initializes a new instance of the RedirectSettings class with the specified maximum redirections. 

### **Reset**
: Resets [IsRedirected](../Settings/RedirectSettings.md#isredirected) and [RedirectCount](../Settings/RedirectSettings.md#redirectcount) to their default values. 