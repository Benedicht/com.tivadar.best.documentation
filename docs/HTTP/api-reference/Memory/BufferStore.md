# BufferStore

Private data struct that contains the size - byte arrays mapping.  

## **Fields**:
### **Size**
: Size/length of the arrays stored in the buffers. 
### **buffers**
: 
### **buffer**
: The actual reference to the stored byte array. 
### **released**
: When the buffer is put back to the pool. Based on this value the pool will calculate the age of the buffer. 
## **Methods**:

### **#ctor**
: Create a new store with its first byte[] to store. 