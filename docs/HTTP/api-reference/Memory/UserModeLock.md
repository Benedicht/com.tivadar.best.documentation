# UserModeLock

Light-weight user-mode lock for code blocks that has rare contentions and doesn't take a long time to finish. 

## **Fields**:
### **IsEnabled**
: Setting this property to false the pooling mechanism can be disabled. 
### **RemoveOlderThan**
: Buffer entries that released back to the pool and older than this value are moved when next maintenance is triggered. 
### **RunMaintenanceEvery**
: How often pool maintenance must run. 
### **MinBufferSize**
: Minimum buffer size that the plugin will allocate when the requested size is smaller than this value, and canBeLarger is set to true. 
### **MaxBufferSize**
: Maximum size of a buffer that the plugin will store. 
### **MaxPoolSize**
: Maximum accumulated size of the stored buffers. 
### **RemoveEmptyLists**
: Whether to remove empty buffer stores from the free list. 
### **IsDoubleReleaseCheckEnabled**
: If it set to true and a byte[] is released more than once it will log out an error. 
## **Methods**:

### **Get**
: Get byte[] from the pool. If canBeLarge is true, the returned buffer might be larger than the requested size. 

### **Release**
: Release back a byte array to the pool. 

### **Resize**
: Resize a byte array. It will release the old one to the pool, and the new one is from the pool too. 

### **Clear**
: Remove all stored entries instantly. 

### **Maintain**
: Internal function called by the plugin to remove old, non-used buffers. 