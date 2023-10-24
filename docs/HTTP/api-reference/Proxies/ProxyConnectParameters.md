---
comments: true
---
# ProxyConnectParameters

Represents parameters used when connecting through a proxy server. 

**Remarks:**

The ProxyConnectParameters struct defines the parameters required when initiating a connection through a proxy server. It includes information about the proxy, target URI, and callbacks for success and error handling. This struct is commonly used during the negotiation steps in the [Negotiator](../Tcp/Negotiator.md) class. 

## **Fields**:
### **MaxAuthenticationAttempts**
: The maximum number of authentication attempts allowed during proxy connection. 
### **proxy**
: The proxy server through which the connection is established. 
### **stream**
: The stream used for communication with the proxy server. 
### **uri**
: The target URI to reach through the proxy server. 
### **token**
: A cancellation token that allows canceling the proxy connection operation. 
### **AuthenticationAttempts**
: The number of authentication attempts made during proxy connection. 
### **createTunel**
: Gets or sets a value indicating whether to create a proxy tunnel. 
	!!! note ""
		A proxy tunnel, also known as a TCP tunnel, is established when communication between the client and the target server needs to be relayed through the proxy without modification. Setting this field to `true` indicates the intention to create a tunnel, allowing the data to pass through the proxy without interpretation or alteration by the proxy. This is typically used for protocols like HTTPS, where end-to-end encryption is desired, and the proxy should act as a pass-through conduit. 

### **context**
: The logging context for debugging purposes. 
### **OnSuccess**
: A callback to be executed upon successful proxy connection. 
### **OnError**
: A callback to be executed upon encountering an error during proxy connection. 
	!!! note ""
		The callback includes parameters for the current connection parameters, the encountered exception, and a flag indicating whether the connection should be retried for authentication. 
