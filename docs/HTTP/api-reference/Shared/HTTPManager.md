---
comments: true
---
# HTTPManager

Global entry point to access and manage main services of the plugin. 

## **Fields**:
### **OnSetupFinished**
: Delegate for the setup finished event. 
### **PerHostSettings**
: Instance of the per-host settings manager. 
### **CurrentFrameDateTime**
: Cached DateTime value for cases where high resolution isn't needed. 
	!!! note ""
		Warning!! It must be used only on the main update thread!

### **RootSaveFolderProvider**
: By default the plugin will save all cache and cookie data under the path returned by Application.persistentDataPath. You can assign a function to this delegate to return a custom root path to define a new path. 
### **Proxy**
: The global, default proxy for all HTTPRequests. The HTTPRequest's Proxy still can be changed per-request. Default value is null. 
### **Heartbeats**
: Heartbeat manager to use less threads in the plugin. The heartbeat updates are called from the OnUpdate function. 
### **Logger**
: A basic Best.HTTP.Logger.ILogger implementation to be able to log intelligently additional informations about the plugin's internal mechanism. 
### **IOService**
: An IIOService implementation to handle filesystem operations. 
### **UserAgent**
: User-agent string that will be sent with each requests. 
### **IsQuitting**
: It's true if the application is quitting and the plugin is shutting down itself. 
### **LocalCache**
: The local content cache, maintained by the plugin. When set to a non-null value, Maintain called immediately on the cache. 
## **Methods**:

### **Setup**
: Initializes the HTTPManager with default settings. This method should be called on Unity's main thread before using the HTTP plugin. By default it gets called by [HTTPUpdateDelegator](HTTPUpdateDelegator.md). 

### **GetRootSaveFolder**
: Will return where the various caches should be saved. 

### **OnUpdate**
: Updates the HTTPManager. This method should be called regularly from a Unity event (e.g., Update, LateUpdate). It processes various events and callbacks and manages internal tasks. 

### **OnQuit**
: Shuts down the HTTPManager and performs cleanup operations. This method should be called when the application is quitting. 

### **AbortAll**
: Aborts all ongoing HTTP requests and performs an immediate shutdown of the HTTPManager. 