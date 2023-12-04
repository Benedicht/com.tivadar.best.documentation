---
comments: true
---
# ProxyDetectionMode

Possible detection modes the [ProxyDetector](ProxyDetector.md) can be in. 

## **Fields**:
### **ProxyDetectionMode.Continuous**
: In Continuous mode the ProxyDetector will check for a proxy for every request. 
### **ProxyDetectionMode.CacheFirstFound**
: This mode will cache the first Proxy found and use it for consecutive requests. 