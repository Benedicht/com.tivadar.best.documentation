# FileOutput

Provides an implementation of [ILogOutput](../Logger/ILogOutput.md) that writes log messages to a file. 

## **Fields**:
### **AcceptColor**
: Gets a value indicating whether this log output accepts color codes. Always returns `false`. 
## **Methods**:

### **#ctor**
: Initializes a new instance of the FileOutput class with the specified file name. 

### **Write**
: Writes a log message to the file. 

### **Flush**
: Flushes any buffered log messages to the file. 

### **Dispose**
: Releases any resources used by the FileOutput instance. 