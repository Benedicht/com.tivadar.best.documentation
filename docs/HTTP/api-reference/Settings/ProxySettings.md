---
comments: true
---
# ProxySettings

Represents settings related to using a proxy server for HTTP requests. 

## **Fields**:
### **Proxy**
: Gets or sets the proxy object used for the request. 
## **Methods**:

### **HasProxyFor**
: Checks if there is a proxy configured for the given URI. 

### **SetupRequest**
: Sets up the HTTP request for passing through a proxy server. 

### **Handle407**
: Handles the proxy's response with status code `407`. 

### **AddToHash**
: Adds the proxy address to a hash for the given request URI. 