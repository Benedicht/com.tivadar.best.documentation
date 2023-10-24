---
comments: true
---
# HTTPUpdateDelegator

Will route some U3D calls to the HTTPManager. 

## **Fields**:
### **Instance**
: The singleton instance of the HTTPUpdateDelegator 
### **IsCreated**
: True, if the Instance property should hold a valid value. 
### **IsThreadRunning**
: It's true if the dispatch thread running. 
### **CurrentThreadingMode**
: The current threading mode the plugin is in. 
### **ThreadFrequencyInMS**
: How much time the plugin should wait between two update call. Its default value 100 ms. 
### **OnBeforeApplicationQuit**
: Called in the OnApplicationQuit function. If this function returns False, the plugin will not start to shut down itself. 
### **OnApplicationForegroundStateChanged**
: Called when the Unity application's foreground state changed. 
## **Methods**:

### **ResetSetup**
: Called after scene loaded to support Configurable Enter Play Mode (https://docs.unity3d.com/2019.3/Documentation/Manual/ConfigurableEnterPlayMode.html) 

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
