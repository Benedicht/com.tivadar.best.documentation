---
comments: true
---
# BearerTokenAuthenticator

An [IAuthenticator](IAuthenticator.md) implementation for Bearer Token authentication. 

**Remarks:**

Bearer Token authentication is a method used to access protected resources on a server. It involves including a bearer token in the Authorization header of an HTTP request to prove the identity of the requester. 

## **Fields**:
### **Token**
: Initializes a new instance of the BearerTokenAuthenticator class with the specified Bearer Token. 
## **Methods**:

### **#ctor**
: Sets up the required Authorization header with the Bearer Token for the HTTP request. 
	!!! note ""
		When sending an HTTP request to a server that requires Bearer Token authentication, this method sets the Authorization header with the Bearer Token to prove the identity of the requester. This allows the requester to access protected resources on the server. 


### **HandleChallange**
: Handles the server response with a 401 (Unauthorized) status code and a WWW-Authenticate header. This authenticator does not handle challenges and always returns `false`. 
	!!! note ""
		Bearer Token authentication typically does not require handling challenges, as the Bearer Token is included directly in the Authorization header of the request. This method always returns `false`, as no additional challenge processing is needed. 
