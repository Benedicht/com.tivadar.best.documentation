# MultipartFormDataStream

An [UploadStreamBase](../Upload/UploadStreamBase.md) based implementation of the `multipart/form-data` Content-Type. It's very memory-effective, streams are read into memory in chunks. 

**Remarks**:

The return value of **Stream.Read** is treated specially in the plugin: 

- **Less than zero(-1) value**:  indicates that no data is currently available but more is expected in the future. In this case, when new data becomes available the IThreadSignaler object must be signaled.
- **Zero (0)**:  means that the stream is closed, no more data can be expected.

 A zero value to signal stream closure can follow a less than zero value.

## **Fields**:
### **Length**
: Gets the length of this multipart/form-data stream. 
### **boundary**
: A random boundary generated in the constructor. 
## **Methods**:

### **#ctor**
: Initializes a new instance of the MultipartFormDataStream class. 

### **AddField**
: Adds a textual field to the multipart/form-data stream. 

### **AddField**
: Adds a textual field to the multipart/form-data stream. 

### **AddField**
: Adds a stream field to the multipart/form-data stream. 

### **AddStreamField**
: Adds a stream field to the multipart/form-data stream. 

### **AddStreamField**
: Adds a stream field to the multipart/form-data stream. 

### **AddStreamField**
: Adds a stream field to the multipart/form-data stream. 

### **Read**
: Reads data from the multipart/form-data stream into the provided buffer. 