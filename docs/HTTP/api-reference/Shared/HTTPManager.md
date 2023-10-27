---
comments: true
---
# HTTPManager

Global entry point to access and manage main services of the plugin. 

## **Fields**:
### **[OnSetupFinishedDelegate](OnSetupFinishedDelegate.md) `#!cs HTTPManager.OnSetupFinished`**
: Delegate for the setup finished event. 
### **[HostSettingsManager](../Settings/HostSettingsManager.md) `#!cs HTTPManager.PerHostSettings`**
: Instance of the per-host settings manager. 
### **[DateTime](https://learn.microsoft.com/en-us/dotnet/api/System.DateTime) `#!cs HTTPManager.CurrentFrameDateTime`**
: Cached DateTime value for cases where high resolution isn't needed. 
	!!! note ""
		Warning!! It must be used only on the main update thread!

### **[Func](https://learn.microsoft.com/en-us/dotnet/api/System.Func-1)&lt;[String](https://learn.microsoft.com/en-us/dotnet/api/System.String)&gt; RootSaveFolderProvider**
: By default the plugin will save all cache and cookie data under the path returned by Application.persistentDataPath. You can assign a function to this delegate to return a custom root path to define a new path. 
### **[Proxy](../Proxies/Proxy.md) `#!cs HTTPManager.Proxy`**
: The global, default proxy for all HTTPRequests. The HTTPRequest's Proxy still can be changed per-request. Default value is null. 
### **HeartbeatManager `#!cs HTTPManager.Heartbeats`**
: Heartbeat manager to use less threads in the plugin. The heartbeat updates are called from the OnUpdate function. 
### **[ILogger](../Logger/ILogger.md) `#!cs HTTPManager.Logger`**
: A basic Best.HTTP.Logger.ILogger implementation to be able to log intelligently additional informations about the plugin's internal mechanism. 
### **[IIOService](../FileSystem/IIOService.md) `#!cs HTTPManager.IOService`**
: An IIOService implementation to handle filesystem operations. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) `#!cs HTTPManager.UserAgent`**
: User-agent string that will be sent with each requests. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) `#!cs HTTPManager.IsQuitting`**
: It's true if the application is quitting and the plugin is shutting down itself. 
### **[HTTPCache](../Caching/HTTPCache.md) `#!cs HTTPManager.LocalCache`**
: The local content cache, maintained by the plugin. When set to a non-null value, Maintain called immediately on the cache. 
## **Methods**:

### Void HTTPManager.Setup()
: Initializes the HTTPManager with default settings. This method should be called on Unity's main thread before using the HTTP plugin. By default it gets called by [HTTPUpdateDelegator](HTTPUpdateDelegator.md). 

### [String](https://learn.microsoft.com/en-us/dotnet/api/System.String) HTTPManager.GetRootSaveFolder()
: Will return where the various caches should be saved. 

### Void HTTPManager.OnUpdate()
: Updates the HTTPManager. This method should be called regularly from a Unity event (e.g., Update, LateUpdate). It processes various events and callbacks and manages internal tasks. 

### Void HTTPManager.OnQuit()
: Shuts down the HTTPManager and performs cleanup operations. This method should be called when the application is quitting. 

### Void HTTPManager.AbortAll()
: Aborts all ongoing HTTP requests and performs an immediate shutdown of the HTTPManager. 