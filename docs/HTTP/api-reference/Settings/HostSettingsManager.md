---
comments: true
---
# HostSettingsManager

Manages host-specific settings for HTTP requests based on hostnames. The HostSettingsManager is a powerful tool for fine-tuning HTTP request and connection behaviors on a per-host basis. It enables you to define custom settings for specific hostnames  while maintaining default settings for all other hosts. This level of granularity allows you to optimize and customize HTTP requests for different endpoints within your application. 

**Remarks:**

When host-specific settings are not found for a given host variant, the default [HostSettings](HostSettings.md) associated with the "*" host will be returned. 


## **Methods**:

### [HostSettings](HostSettings.md) AddDefault([Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri))
: Adds default settings for the host part of the specified URI. This is equivalent to calling [Add](#hostsettings-adduri,-hostsettings) with the a new [HostSettings](HostSettings.md). 

### [HostSettings](HostSettings.md) AddDefault([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Adds default settings for the the specified host name. This is equivalent to calling [Add](#hostsettings-addstring,-hostsettings) with the a new [HostSettings](HostSettings.md). 

### [HostSettings](HostSettings.md) Add([Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri), [HostSettings](HostSettings.md))
: Adds host-specific settings for the host part of the specified URI. 

### [HostSettings](HostSettings.md) Add([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [HostSettings](HostSettings.md))
: Adds host-specific settings for the specified hostname. 

### [HostSettings](HostSettings.md) Get([HostVariant](../HostSetting/HostVariant.md))
: Gets [HostSettings](HostSettings.md) for the host part of the specified [HostVariant](../HostSetting/HostVariant.md). Returns the default settings associated with "*" when not found. 

### [HostSettings](HostSettings.md) Get([HostKey](../HostSetting/HostKey.md))
: Gets [HostSettings](HostSettings.md) for the host part of the specified [HostKey](../HostSetting/HostKey.md). Returns the default settings associated with "*" when not found. 

### [HostSettings](HostSettings.md) Get([Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri))
: Gets [HostSettings](HostSettings.md) for the host part of the specified [Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri). Returns the default settings associated with "*" when not found. 

### [HostSettings](HostSettings.md) Get([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Gets [HostSettings](HostSettings.md) for the host part of the specified hostname. Returns the default settings associated with "*" when not found. 

### Void Clear()
: Clears all host-specific settings and resetting the default ("*") with default values. 