---
comments: true
---
# UnityOutput

Provides an implementation of [ILogOutput](../Logger/ILogOutput.md) that writes log messages to the Unity Debug Console. 

## **Fields**:
### **AcceptColor**
: Gets a value indicating whether this log output accepts color codes. 
	!!! note ""
		This property returns `true` when running in the Unity Editor and `false` otherwise. 

## **Methods**:

### **Write**
: Writes a log message to the Unity Debug Console based on the specified log level. 

### **Best#HTTP#Shared#Logger#ILogOutput#Flush**
: This implementation does nothing. 