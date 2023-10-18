# Proxy

Base class for proxy implementations, providing common proxy configuration and behavior. 

**Remarks**:

The Proxy class serves as the base class for various proxy client implementations, such as [HTTPProxy](../Proxies/HTTPProxy.md) and [SOCKSProxy](../Proxies/SOCKSProxy.md). It provides a foundation for configuring proxy settings and handling proxy-related functionality common to all proxy types, like connecting to a proxy, setting up a request to go through the proxy and deciding whether an address is usable with the proxy or the plugin must connect directly. 

## **Fields**:
### **Address**
: Address of the proxy server. It has to be in the http://proxyaddress:port form. 
### **Credentials**
: Credentials for authenticating with the proxy server. 
### **Exceptions**
: List of exceptions for which the proxy should not be used. Elements of this list are compared to the Host (DNS or IP address) part of the uri. 
## **Methods**:

### **#ctor**
: Initializes a new instance of the Proxy class with the specified proxy address and credentials. 

### **BeginConnect**
: Initiates a connection through the proxy server. Used during the negotiation steps. 

### **GetRequestPath**
: Gets the request path to be used for proxy communication. In some cases with HTTPProxy, the request must send the whole uri as the request path. 

### **SetupRequest**
: Sets up an HTTP request to use the proxy as needed. 

### **UseProxyForAddress**
: Determines whether the proxy should be used for a specific address based on the configured exceptions. 