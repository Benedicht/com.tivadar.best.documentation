---
comments: true
---
# HTTP2SettingsRegistry

Represents a registry for HTTP/2 settings. 

## **Fields**:
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) IsReadOnly**
: Gets a value indicating whether the registry is read-only. 
### **[Action](https://learn.microsoft.com/en-us/dotnet/api/System.Action-4)&lt;[HTTP2SettingsRegistry](), [HTTP2Settings](HTTP2Settings.md), [UInt32](https://learn.microsoft.com/en-us/dotnet/api/System.UInt32), [UInt32](https://learn.microsoft.com/en-us/dotnet/api/System.UInt32)&gt; OnSettingChangedEvent**
: Event triggered when a setting changes. 
### **[UInt32](https://learn.microsoft.com/en-us/dotnet/api/System.UInt32) Item**
: Indexer to get or set values based on an [HTTP2Settings](HTTP2Settings.md) key. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) IsChanged**
: Gets a value indicating whether any setting has changed. 
## **Methods**:

### **Merge**
: Merges the specified settings into the current registry. 

### **Merge**
: Merges settings from another HTTP2SettingsRegistry into the current registry. 