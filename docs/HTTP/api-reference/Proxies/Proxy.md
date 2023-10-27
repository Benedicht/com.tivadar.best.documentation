---
comments: true
---
# Proxy

Base class for proxy implementations, providing common proxy configuration and behavior. 

**Remarks:**

The Proxy class serves as the base class for various proxy client implementations, such as [HTTPProxy](HTTPProxy.md) and [SOCKSProxy](SOCKSProxy.md). It provides a foundation for configuring proxy settings and handling proxy-related functionality common to all proxy types, like connecting to a proxy, setting up a request to go through the proxy and deciding whether an address is usable with the proxy or the plugin must connect directly. 

## **Fields**:
### **[Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri) Address**
: Address of the proxy server. It has to be in the http://proxyaddress:port form. 
### **[Credentials](../Authentication/Credentials.md) Credentials**
: Credentials for authenticating with the proxy server. 
### **[List](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Generic.List-1)&lt;[String](https://learn.microsoft.com/en-us/dotnet/api/System.String)&gt; Exceptions**
: List of exceptions for which the proxy should not be used. Elements of this list are compared to the Host (DNS or IP address) part of the uri. 
## **Methods**:

### **UseProxyForAddress**
: Determines whether the proxy should be used for a specific address based on the configured exceptions. 