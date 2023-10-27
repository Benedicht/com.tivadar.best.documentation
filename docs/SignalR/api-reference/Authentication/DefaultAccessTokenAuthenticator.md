---
comments: true
---
# DefaultAccessTokenAuthenticator

Represents the default access token authenticator that uses the Bearer token scheme for HTTP and WebSockets. 

## **Fields**:
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) IsPreAuthRequired**
: Indicates that no pre-authentication step is required for this type of authentication. 
### **[OnAuthenticationSuccededDelegate](../SignalR/OnAuthenticationSuccededDelegate.md) OnAuthenticationSucceded**
: This event is not used because [IsPreAuthRequired](#boolean-ispreauthrequired) is `false`. 
### **[OnAuthenticationFailedDelegate](../SignalR/OnAuthenticationFailedDelegate.md) OnAuthenticationFailed**
: This event is not used because [IsPreAuthRequired](#boolean-ispreauthrequired) is `false`. 
## **Methods**:

### **StartAuthentication**
: Not used as IsPreAuthRequired is false 

### **PrepareRequest**
: Prepares the HTTP request by adding appropriate authentication headers or query parameters based on the request type. 

### **PrepareUri**
: Prepares the URI by appending the access token if necessary. 

### **Cancel**
: Cancels any ongoing authentication operations. 