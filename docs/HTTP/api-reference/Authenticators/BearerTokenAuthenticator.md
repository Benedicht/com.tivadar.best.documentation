---
comments: true
---
# BearerTokenAuthenticator

An [IAuthenticator](IAuthenticator.md) implementation for Bearer Token authentication. 

**Remarks:**

Bearer Token authentication is a method used to access protected resources on a server. It involves including a bearer token in the Authorization header of an HTTP request to prove the identity of the requester. 

## **Fields**:
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Token**
: Initializes a new instance of the BearerTokenAuthenticator class with the specified Bearer Token. 
## **Methods**:

### [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) HandleChallange([HTTPRequest](../HTTP/HTTPRequest.md), [HTTPResponse](../HTTP/HTTPResponse.md))
: Handles the server response with a 401 (Unauthorized) status code and a WWW-Authenticate header. This authenticator does not handle challenges and always returns `false`. 
	!!! note ""
		Bearer Token authentication typically does not require handling challenges, as the Bearer Token is included directly in the Authorization header of the request. This method always returns `false`, as no additional challenge processing is needed. 
