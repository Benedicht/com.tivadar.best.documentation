---
comments: true
---
# RedirectSettings

Represents settings related to handling HTTP request redirection. 

## **Fields**:
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) IsRedirected**
: Indicates whether the request has been redirected. A request's IsRedirected might be true while [RedirectCount](#int32-redirectcount) is zero if the redirection is made to the local cache. 
### **[Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri) RedirectUri**
: The Uri that the request is redirected to. 
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) MaxRedirects**
: How many redirection is supported for this request. The default is 10. Zero or a negative value means no redirections are supported. 
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) RedirectCount**
: Gets the number of times the request has been redirected. 
### **[OnBeforeRedirectionDelegate](OnBeforeRedirectionDelegate.md) OnBeforeRedirection**
: Occurs before the plugin makes a new request to the new URI during redirection. The return value of this event handler controls whether the redirection is aborted (`false`) or allowed (`true`). This event is called on a thread other than the main Unity thread. 
## **Methods**:

### Void Reset()
: Resets [IsRedirected](#boolean-isredirected) and [RedirectCount](#int32-redirectcount) to their default values. 