---
comments: true
---
# FileOutput

Provides an implementation of [ILogOutput](ILogOutput.md) that writes log messages to a file. 

## **Fields**:
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) AcceptColor**
: Gets a value indicating whether this log output accepts color codes. Always returns `false`. 
## **Methods**:

### **Write**
: Writes a log message to the file. 

### **Flush**
: Flushes any buffered log messages to the file. 

### **Dispose**
: Releases any resources used by the FileOutput instance. 