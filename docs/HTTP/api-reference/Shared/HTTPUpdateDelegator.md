---
comments: true
---
# HTTPUpdateDelegator

Will route some U3D calls to the HTTPManager. 

## **Fields**:
### **[HTTPUpdateDelegator]() `#!cs HTTPUpdateDelegator.Instance`**
: The singleton instance of the HTTPUpdateDelegator 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) `#!cs HTTPUpdateDelegator.IsCreated`**
: True, if the Instance property should hold a valid value. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) `#!cs HTTPUpdateDelegator.IsThreadRunning`**
: It's true if the dispatch thread running. 
### **[ThreadingMode](ThreadingMode.md) CurrentThreadingMode**
: The current threading mode the plugin is in. 
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) `#!cs HTTPUpdateDelegator.ThreadFrequencyInMS`**
: How much time the plugin should wait between two update call. Its default value 100 ms. 
### **[Func](https://learn.microsoft.com/en-us/dotnet/api/System.Func-1)&lt;[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean)&gt; OnBeforeApplicationQuit**
: Called in the OnApplicationQuit function. If this function returns False, the plugin will not start to shut down itself. 
### **[Action](https://learn.microsoft.com/en-us/dotnet/api/System.Action-1)&lt;[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean)&gt; OnApplicationForegroundStateChanged**
: Called when the Unity application's foreground state changed. 
## **Methods**:

### **CheckInstance**
: Will create the HTTPUpdateDelegator instance and set it up. 

### **IsMainThread**
: Return true if the call happens on the Unity main thread. Setup must be called before to save the thread id! 

### **SetThreadingMode**
: Set directly the threading mode to use. 

### **SwapThreadingMode**
: Swaps threading mode between Unity's Update function or a distinct thread. 

### **PingUpdateThread**
: Pings the update thread to call HTTPManager.OnUpdate immediately. 
	!!! note ""
		Works only when the current threading mode is Threaded!
