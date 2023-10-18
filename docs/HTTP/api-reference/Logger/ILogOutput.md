# ILogOutput

Represents an output target for log messages. 

**Remarks**:

This interface defines methods for writing log messages to an output target. Implementations of this interface are used to configure where log messages should be written. 

 Two of its out-of-the-box implementations are 

- UnityOutput
- FileOutput



## **Fields**:
### **AcceptColor**
: Gets a value indicating whether the log output supports colored text. 
## **Methods**:

### **Write**
: Writes a log entry to the output. 

### **Flush**
: Flushes any buffered log entries to the output. 