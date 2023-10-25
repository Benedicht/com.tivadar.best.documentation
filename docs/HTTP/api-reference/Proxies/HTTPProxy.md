---
comments: true
---
# HTTPProxy

Represents an HTTP proxy server that can be used to route HTTP requests through. 

**Remarks:**

The HTTPProxy class is an implementation of the [Proxy](Proxy.md) base class, specifically designed for HTTP proxy servers. It provides features such as transparent proxy support, sending the entire URI, and handling proxy authentication. This class is used to configure and manage HTTP proxy settings for HTTP requests. 

## **Fields**:
### **IsTransparent**
: Gets or sets whether the proxy can act as a transparent proxy. Default value is `true`. 
	!!! note ""
		A transparent proxy forwards client requests without modifying them. When set to `true`, the proxy behaves as a transparent proxy, meaning it forwards requests as-is. If set to `false`, it may modify requests, and this can be useful for certain advanced proxy configurations. 

### **SendWholeUri**
: Gets or sets whether the proxy - when it's in non-transparent mode - excepts only the path and query of the request URI. Default value is `true`. 
### **NonTransparentForHTTPS**
: Gets or sets whether the plugin will use the proxy as an explicit proxy for secure protocols (HTTPS://, WSS://). 
	!!! note ""
		When set to `true`, the plugin will issue a CONNECT request to the proxy for secure protocols, even if the proxy is marked as transparent. This is commonly used for ensuring proper handling of encrypted traffic through the proxy. 

## **Methods**:

### **#ctor**
: Creates a new instance of the HTTPProxy class with the specified proxy address. 

### **#ctor**
: Creates a new instance of the HTTPProxy class with the specified proxy address and credentials. 

### **#ctor**
: Creates a new instance of the HTTPProxy class with the specified proxy address, credentials, and transparency settings. 

### **#ctor**
: Creates a new instance of the HTTPProxy class with the specified proxy address, credentials, transparency settings, and URI handling. 

### **#ctor**
: Creates a new instance of the [HTTPProxy](HTTPProxy.md) class with the specified proxy address, credentials, transparency settings, URI handling, and HTTPS behavior. 