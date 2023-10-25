---
comments: true
---
# BufferSegment

Represents a segment (a continuous section) of a byte array, providing functionalities to  work with a portion of the data without copying. 

## **Fields**:
### **Empty**
: Represents an empty buffer segment. 
### **Data**
: The underlying data of the buffer segment. 
### **Offset**
: The starting offset of the segment within the data. 
### **Count**
: The number of bytes in the segment that contain valid data. 
## **Methods**:

### **AsAutoRelease**
: Converts the buffer segment to an AutoReleaseBuffer to use it in a local using statement. 

### **Slice**
: Creates a new segment starting from the specified offset. 
	!!! note ""
		The new segment will reference the same underlying byte[] as the original, without creating a copy of the data.


### **Slice**
: Creates a new segment with the specified offset and count. 
	!!! note ""
		The new segment will reference the same underlying byte[] as the original, without creating a copy of the data.


### **CopyTo**
: Copyies the buffer's content to the received array. 