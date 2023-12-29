---
comments: true
---
# HostVariantSettings

Settings for [HostVariant](../HostSetting/HostVariant.md)s. 

## **Fields**:
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) MaxConnectionPerVariant**
: The maximum number of connections allowed per host variant. 
### **[Single](https://learn.microsoft.com/en-us/dotnet/api/System.Single) MaxAssignedRequestsFactor**
: Factor used when calculations are made whether to open a new connection to the server or not. 
	!!! note ""
		It has an effect on HTTP/2 connections only. 

				Higher values (gte `1.0f`) delay, lower values (lte `1.0f`) bring forward creation of new connections.
