---
comments: true
---
# DefaultAccessTokenAuthenticator

Represents the default access token authenticator that uses the Bearer token scheme for HTTP and WebSockets. 

## **Fields**:
### **IsPreAuthRequired**
: Indicates that no pre-authentication step is required for this type of authentication. 
### **OnAuthenticationSucceded**
: This event is not used because [IsPreAuthRequired](DefaultAccessTokenAuthenticator.md#ispreauthrequired) is `false`. 
### **OnAuthenticationFailed**
: This event is not used because [IsPreAuthRequired](DefaultAccessTokenAuthenticator.md#ispreauthrequired) is `false`. 
## **Methods**:

### **StartAuthentication**
: Not used as IsPreAuthRequired is false 

### **PrepareRequest**
: Prepares the HTTP request by adding appropriate authentication headers or query parameters based on the request type. 

### **PrepareUri**
: Prepares the URI by appending the access token if necessary. 

### **Cancel**
: Cancels any ongoing authentication operations. 