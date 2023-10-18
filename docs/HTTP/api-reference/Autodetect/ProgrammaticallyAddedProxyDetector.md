# ProgrammaticallyAddedProxyDetector

This one just returns with HTTPManager.Proxy, so when ProgrammaticallyAddedProxyDetector is used in the first place for the ProxyDetector, HTTPManager.Proxy gets the highest priority. 

## **Fields**:
### **Continouos**
: In Continouos mode the ProxyDetector will check for a proxy for every request. 
### **CacheFirstFound**
: This mode will cache the first Proxy found and use it for consecutive requests. 
## **Methods**:

### **Detach**
: Call Detach() to disable ProxyDetector's logic to find and set a proxy. 