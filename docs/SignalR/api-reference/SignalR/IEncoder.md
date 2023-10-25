---
comments: true
---
# IEncoder

Common interface for communication protocol encoders. 


## **Methods**:

### **Encode``1**
: Function to encode the received value as a byte representation, returned as a [BufferSegment](../../../HTTP/api-reference/Memory/BufferSegment.md). 

### **DecodeAs``1**
: Function to create a strongly typed object from the received [BufferSegment](../../../HTTP/api-reference/Memory/BufferSegment.md). 

### **ConvertTo**
: Function to convert the received object to another type, or make sure its already in that one. 