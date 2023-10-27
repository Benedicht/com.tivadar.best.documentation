---
comments: true
---
# ProxySettings

Represents settings related to using a proxy server for HTTP requests. 

## **Fields**:
### **[Proxy](../Proxies/Proxy.md) Proxy**
: Gets or sets the proxy object used for the request. 
## **Methods**:

### [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) HasProxyFor([Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri))
: Checks if there is a proxy configured for the given URI. 

### Void SetupRequest([HTTPRequest](../HTTP/HTTPRequest.md))
: Sets up the HTTP request for passing through a proxy server. 

### [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) Handle407([HTTPRequest](../HTTP/HTTPRequest.md))
: Handles the proxy's response with status code `407`. 

### AddToHash(Uri, Hash128@)
: Adds the proxy address to a hash for the given request URI. 