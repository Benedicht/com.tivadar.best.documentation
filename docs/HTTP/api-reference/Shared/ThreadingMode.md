---
comments: true
---
# ThreadingMode

Threading mode the plugin will use to call HTTPManager.OnUpdate(). 

## **Fields**:
### **UnityUpdate**
: HTTPManager.OnUpdate() is called from the HTTPUpdateDelegator's Update functions (Unity's main thread). 
### **Threaded**
: The plugin starts a dedicated thread to call HTTPManager.OnUpdate() periodically. 
### **None**
: HTTPManager.OnUpdate() will not be called automatically. 