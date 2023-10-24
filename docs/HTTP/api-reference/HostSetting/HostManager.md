---
comments: true
---
# HostManager

The [HostManager](../HostSetting/HostManager.md) class provides centralized management for [HostVariant](../HostSetting/HostVariant.md) objects associated with HTTP requests and connections. 

**Remarks:**

The [HostManager](../HostSetting/HostManager.md) class acts as a central registry for managing [HostVariant](../HostSetting/HostVariant.md) objects, each associated with a unique [HostKey](../HostSetting/HostKey.md). It facilitates the creation, retrieval, and management of [HostVariant](../HostSetting/HostVariant.md) instances based on HTTP requests and connections. 

 A [HostVariant](../HostSetting/HostVariant.md) represents a specific host and port combination (e.g., "http://example.com:80" or "https://example.com:443") and manages the connections and request queues for that host. The class ensures that a single [HostVariant](../HostSetting/HostVariant.md) instance is used for each unique host, helping optimize resource usage and connection pooling. 

 Key features of the [HostManager](../HostSetting/HostManager.md) class include: 

- **Creation and Retrieval:**:  The class allows you to create and retrieve [HostVariant](../HostSetting/HostVariant.md) instances based on HTTP requests, connections, or [HostKey](../HostSetting/HostKey.md). It ensures that a single [HostVariant](../HostSetting/HostVariant.md) is used for each unique host. 
- **Queue Management:**:  The [HostManager](../HostSetting/HostManager.md) manages the queue of pending requests for each [HostVariant](../HostSetting/HostVariant.md), ensuring efficient request processing. 
- **Connection Management:**:  The class handles the management of connections associated with [HostVariant](../HostSetting/HostVariant.md) objects, including recycling idle connections, removing idle connections, and shutting down connections when needed. 



 Usage of the [HostManager](../HostSetting/HostManager.md) class is typically transparent to developers and is handled internally by the Best HTTP library. However, it provides a convenient and efficient way to manage connections and requests when needed. 

## **Fields**:
### **hosts**
: Dictionary to store [HostKey](../HostSetting/HostKey.md)-[HostVariant](../HostSetting/HostVariant.md) mappings. 
## **Methods**:

### **GetHostVariant**
: Gets the [HostVariant](../HostSetting/HostVariant.md) associated with an HTTP request. 

### **GetHostVariant**
: Gets the [HostVariant](../HostSetting/HostVariant.md) associated with a HostKey. 

### **RemoveAllIdleConnections**
: Removes all idle connections for all hosts. 

### **TryToSendQueuedRequests**
: Tries to send queued requests for all hosts. 

### **Shutdown**
: Shuts down all connections for all hosts. 

### **Clear**
: Clears all hosts and their associated variants. 