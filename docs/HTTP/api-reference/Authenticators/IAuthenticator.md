---
comments: true
---
# IAuthenticator

Represents an interface for various authentication implementations used in HTTP requests. 


## **Methods**:

### **SetupRequest**
: Set required headers or content for the HTTP request. Called right before the request is sent out. 
	!!! note ""
		The SetupRequest method will be called every time the request is redirected or retried. 


### **HandleChallange**
: Called when the server is sending a 401 (Unauthorized) response with an WWW-Authenticate header. The authenticator might find additional knowledge about the authentication requirements (like what auth method it should use). If the authenticator is confident it can successfully (re)authenticate the request it can return true and the request will be resent to the server. 
	!!! note ""
		More details can be found here: 

		- [RFC-9110 - 401 Unauthorized](https://www.rfc-editor.org/rfc/rfc9110.html#status.401)
		- [RFC-9110 - WWW-Authenticate header](https://www.rfc-editor.org/rfc/rfc9110.html#name-www-authenticate)


