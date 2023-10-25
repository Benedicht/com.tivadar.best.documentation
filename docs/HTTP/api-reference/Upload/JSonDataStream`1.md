---
comments: true
---
# JSonDataStream`1

An [UploadStreamBase](UploadStreamBase.md) implementation to convert and upload the object as JSON data. It sets the `"Content-Type"` header to `"application/json; charset=utf-8"`. 

**Remarks:**

This stream keeps a reference to the object until the preparation in [BeforeSendHeaders](JSonDataStream`1.md#beforesendheaders). This means, changes to the object after passing it to the constructor will be reflected in the sent data too.

The return value of **Stream.Read** is treated specially in the plugin: 

- **Less than zero(-1) value**:  indicates that no data is currently available but more is expected in the future. In this case, when new data becomes available the IThreadSignaler object must be signaled.
- **Zero (0)**:  means that the stream is closed, no more data can be expected.

 A zero value to signal stream closure can follow a less than zero value.


## **Methods**:

### **BeforeSendHeaders**
: Called before sending out the request's headers. It sets the `"Content-Type"` header to `"application/json; charset=utf-8"`. 

### **Read**
: Reads a sequence of bytes from the current stream and advances the position within the stream by the number of bytes read. 

### **Dispose**
: Releases the unmanaged resources used by the [JSonDataStream`1](JSonDataStream`1.md) and optionally releases the managed resources. 