---
comments: true
---
# CredentialAuthenticator

An [IAuthenticator](IAuthenticator.md) implementation for HTTP Basic or Digest authentication. 

## **Fields**:
### **Credentials**
: Gets or sets the [Credentials](../Authentication/Credentials.md) associated with this authenticator. 
## **Methods**:

### **SetupRequest**
: Sets up the required headers for the HTTP request based on the provided credentials. 

### **HandleChallange**
: Handles the server response with a 401 (Unauthorized) status code and a WWW-Authenticate header. The authenticator might determine the authentication method to use and initiate authentication if needed. 