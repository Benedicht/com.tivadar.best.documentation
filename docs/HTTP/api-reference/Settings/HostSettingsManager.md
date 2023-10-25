---
comments: true
---
# HostSettingsManager

Manages host-specific settings for HTTP requests based on hostnames. The HostSettingsManager is a powerful tool for fine-tuning HTTP request and connection behaviors on a per-host basis. It enables you to define custom settings for specific hostnames  while maintaining default settings for all other hosts. This level of granularity allows you to optimize and customize HTTP requests for different endpoints within your application. 

**Remarks:**

When host-specific settings are not found for a given host variant, the default [HostSettings](HostSettings.md) associated with the "*" host will be returned. 


## **Methods**:

### **#ctor**
: Initializes a new instance of the [HostSettingsManager](HostSettingsManager.md) class with default settings for all hosts ("*"). 

### **AddDefault**
: Adds default settings for the host part of the specified URI. This is equivalent to calling [Add](HostSettingsManager.md#add) with the a new [HostSettings](HostSettings.md). 

### **AddDefault**
: Adds default settings for the the specified host name. This is equivalent to calling [Add](HostSettingsManager.md#add) with the a new [HostSettings](HostSettings.md). 

### **Add**
: Adds host-specific settings for the host part of the specified URI. 

### **Add**
: Adds host-specific settings for the specified hostname. 

### **Get**
: Gets [HostSettings](HostSettings.md) for the host part of the specified [HostVariant](../HostSetting/HostVariant.md). Returns the default settings associated with "*" when not found. 

### **Get**
: Gets [HostSettings](HostSettings.md) for the host part of the specified [HostKey](../HostSetting/HostKey.md). Returns the default settings associated with "*" when not found. 

### **Get**
: Gets [HostSettings](HostSettings.md) for the host part of the specified **Uri**. Returns the default settings associated with "*" when not found. 

### **Get**
: Gets [HostSettings](HostSettings.md) for the host part of the specified hostname. Returns the default settings associated with "*" when not found. 

### **Clear**
: Clears all host-specific settings and resetting the default ("*") with default values. 