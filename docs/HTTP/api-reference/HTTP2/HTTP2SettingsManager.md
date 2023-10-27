---
comments: true
---
# HTTP2SettingsManager

Class to manager local and remote HTTP/2 settings. 

## **Fields**:
### **[HTTP2SettingsRegistry](HTTP2SettingsRegistry.md) MySettings**
: This is the ACKd or default settings that we sent to the server. 
### **[HTTP2SettingsRegistry](HTTP2SettingsRegistry.md) InitiatedMySettings**
: This is the setting that can be changed. It will be sent to the server ASAP, and when ACKd, it will be copied to MySettings. 
### **[HTTP2SettingsRegistry](HTTP2SettingsRegistry.md) RemoteSettings**
: Settings of the remote peer 