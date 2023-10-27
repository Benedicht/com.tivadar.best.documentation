---
comments: true
---
# UnityOutput

Provides an implementation of [ILogOutput](ILogOutput.md) that writes log messages to the Unity Debug Console. 

## **Fields**:
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) AcceptColor**
: Gets a value indicating whether this log output accepts color codes. 
	!!! note ""
		This property returns `true` when running in the Unity Editor and `false` otherwise. 

## **Methods**:

### Void Write([Loglevels](Loglevels.md), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Writes a log message to the Unity Debug Console based on the specified log level. 