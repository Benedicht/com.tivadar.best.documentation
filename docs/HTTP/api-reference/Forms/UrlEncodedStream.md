---
comments: true
---
# UrlEncodedStream

An [UploadStreamBase](../Upload/UploadStreamBase.md) implementation representing a stream that prepares and sends data as URL-encoded form data in an HTTP request. 

**Remarks:**

This stream is used to send data as URL-encoded form data in an HTTP request. It sets the `"Content-Type"` header to `"application/x-www-form-urlencoded"`. URL-encoded form data is typically used for submitting form data to a web server. It is commonly used in HTTP POST requests to send data to a server, such as submitting HTML form data.

The return value of **Stream.Read** is treated specially in the plugin: 

- **Less than zero(-1) value**:  indicates that no data is currently available but more is expected in the future. In this case, when new data becomes available the IThreadSignaler object must be signaled.
- **Zero (0)**:  means that the stream is closed, no more data can be expected.

 A zero value to signal stream closure can follow a less than zero value.

While it's possible, it's not advised to send binary data url-encoded!

## **Fields**:
### **Length**
: Gets the length of the stream. 
## **Methods**:

### **BeforeSendHeaders**
: Sets up the HTTP request by adding the `"Content-Type"` header as `"application/x-www-form-urlencoded"`. 

### **AddBinaryData**
: Adds binary data to the form. It is not advised to send binary data with an URL-encoded form due to the conversion cost of binary to text conversion. 