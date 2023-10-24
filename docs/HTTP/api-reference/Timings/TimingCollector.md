---
comments: true
---
# TimingCollector

Helper class to store, calculate and manage request related events and theirs duration, referenced by [Timing](../HTTP/HTTPRequest.md#timing) field. 

## **Fields**:
### **Created**
: When the TimingCollector instance created. 
### **Finished**
: When the closing Finish event is sent. 
### **Events**
: List of added events. 
## **Methods**:

### **Finish**
: Finish the last event. 

### **Abort**
: Abort the currently running event. 

### **AddEvent**
: When the event happened and for how long. 