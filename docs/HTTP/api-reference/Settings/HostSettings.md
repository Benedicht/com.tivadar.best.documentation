# HostSettings

Contains settings that can be associated with a specific host or host variant. 

## **Fields**:
### **LowLevelConnectionSettings**
: Gets or sets the low-level TCP buffer settings for connections associated with the host or host variant. 
	!!! note ""
		These settings determine the buffer sizes for reading from and writing to TCP connections,  which can impact performance and memory usage. 

### **RequestSettings**
: Settings related to HTTP requests made to this host or host variant. 
### **HTTP1ConnectionSettings**
: Settings related to HTTP/1.x connection behavior. 
### **TCPRingmasterSettings**
: Settings related to TCP Ringmaster used in non-webgl platforms. 
### **HTTP2ConnectionSettings**
: Settings related to HTTP/2 connection behavior. 
### **TLSSettings**
: Settings related to TLS (Transport Layer Security) behavior. 
### **HostVariantSettings**
: Settings related to [HostVariant](../HostSetting/HostVariant.md)	 behavior. 