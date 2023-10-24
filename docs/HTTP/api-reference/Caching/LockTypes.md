---
comments: true
---
# LockTypes

Possible lock-states a cache-content can be in. 

## **Fields**:
### **Unlocked**
: No reads or writes are happening on the cached content. 
### **Write**
: There's one writer operating on the cached content. No other writes or reads allowed while this lock is held on the content. 
### **Read**
: There's at least one read operation happening on the cached content. No writes allowed while this lock is held on the content. 