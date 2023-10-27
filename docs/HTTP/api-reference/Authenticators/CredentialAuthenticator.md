---
comments: true
---
# CredentialAuthenticator

An [IAuthenticator](IAuthenticator.md) implementation for HTTP Basic or Digest authentication. 

## **Fields**:
### **[Credentials](../Authentication/Credentials.md) Credentials**
: Gets or sets the [Credentials](../Authentication/Credentials.md) associated with this authenticator. 
## **Methods**:

### Void SetupRequest([HTTPRequest](../HTTP/HTTPRequest.md))
: Sets up the required headers for the HTTP request based on the provided credentials. 

### [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) HandleChallange([HTTPRequest](../HTTP/HTTPRequest.md), [HTTPResponse](../HTTP/HTTPResponse.md))
: Handles the server response with a 401 (Unauthorized) status code and a WWW-Authenticate header. The authenticator might determine the authentication method to use and initiate authentication if needed. 