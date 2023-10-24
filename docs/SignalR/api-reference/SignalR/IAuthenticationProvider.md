---
comments: true
---
# IAuthenticationProvider

Interface for authentication providers. 

## **Fields**:
### **IsPreAuthRequired**
: Gets a value indicating whether pre-authentication is required before any request made. 
	!!! note ""
		If returns `true`, the implementation **MUST** implement the [StartAuthentication](../SignalR/IAuthenticationProvider.md#startauthentication), [Cancel](../SignalR/IAuthenticationProvider.md#cancel) methods and use the [OnAuthenticationSucceded](../SignalR/IAuthenticationProvider.md#onauthenticationsucceded) and [OnAuthenticationFailed](../SignalR/IAuthenticationProvider.md#onauthenticationfailed) events!

### **OnAuthenticationSucceded**
: The concrete implementation must call this event when the pre-authentication is succeded. When [IsPreAuthRequired](../SignalR/IAuthenticationProvider.md#ispreauthrequired) is `false`, no-one will subscribe to this event. 
### **OnAuthenticationFailed**
: The concrete implementation must call this event when the pre-authentication is failed. When [IsPreAuthRequired](../SignalR/IAuthenticationProvider.md#ispreauthrequired) is `false`, no-one will subscribe to this event. 
## **Methods**:

### **StartAuthentication**
: This function called once, before the SignalR negotiation begins. If [IsPreAuthRequired](../SignalR/IAuthenticationProvider.md#ispreauthrequired) is `false`, then this step will be skipped. 

### **PrepareRequest**
: Prepares a request by adding authentication information, before it's sent. 

### **PrepareUri**
: Modifies the provided URI if necessary. 

### **Cancel**
: Cancels any ongoing authentication process. 