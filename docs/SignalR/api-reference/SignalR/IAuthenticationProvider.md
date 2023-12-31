---
comments: true
---
# IAuthenticationProvider

Interface for authentication providers. 

## **Fields**:
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) IsPreAuthRequired**
: Gets a value indicating whether pre-authentication is required before any request made. 
	!!! note ""
		If returns `true`, the implementation **MUST** implement the [StartAuthentication](#void-startauthentication), [Cancel](#void-cancel) methods and use the [OnAuthenticationSucceded](#onauthenticationsuccededdelegate-onauthenticationsucceded) and [OnAuthenticationFailed](#onauthenticationfaileddelegate-onauthenticationfailed) events!

### **[OnAuthenticationSuccededDelegate](OnAuthenticationSuccededDelegate.md) OnAuthenticationSucceded**
: The concrete implementation must call this event when the pre-authentication is succeded. When [IsPreAuthRequired](#boolean-ispreauthrequired) is `false`, no-one will subscribe to this event. 
### **[OnAuthenticationFailedDelegate](OnAuthenticationFailedDelegate.md) OnAuthenticationFailed**
: The concrete implementation must call this event when the pre-authentication is failed. When [IsPreAuthRequired](#boolean-ispreauthrequired) is `false`, no-one will subscribe to this event. 
## **Methods**:

### Void StartAuthentication()
: This function called once, before the SignalR negotiation begins. If [IsPreAuthRequired](#boolean-ispreauthrequired) is `false`, then this step will be skipped. 

### Void PrepareRequest([HTTPRequest](../../../HTTP/api-reference/HTTP/HTTPRequest.md))
: Prepares a request by adding authentication information, before it's sent. 

### [Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri) PrepareUri([Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri))
: Modifies the provided URI if necessary. 

### Void Cancel()
: Cancels any ongoing authentication process. 