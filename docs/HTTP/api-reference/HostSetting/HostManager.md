---
comments: true
---
# HostManager

The [HostManager]() class provides centralized management for [HostVariant](HostVariant.md) objects associated with HTTP requests and connections. 

**Remarks:**

The [HostManager]() class acts as a central registry for managing [HostVariant](HostVariant.md) objects, each associated with a unique [HostKey](HostKey.md). It facilitates the creation, retrieval, and management of [HostVariant](HostVariant.md) instances based on HTTP requests and connections. 

 A [HostVariant](HostVariant.md) represents a specific host and port combination (e.g., "http://example.com:80" or "https://example.com:443") and manages the connections and request queues for that host. The class ensures that a single [HostVariant](HostVariant.md) instance is used for each unique host, helping optimize resource usage and connection pooling. 

 Key features of the [HostManager]() class include: 

- **Creation and Retrieval**:  The class allows you to create and retrieve [HostVariant](HostVariant.md) instances based on HTTP requests, connections, or [HostKey](HostKey.md). It ensures that a single [HostVariant](HostVariant.md) is used for each unique host. 
- **Queue Management**:  The [HostManager]() manages the queue of pending requests for each [HostVariant](HostVariant.md), ensuring efficient request processing. 
- **Connection Management**:  The class handles the management of connections associated with [HostVariant](HostVariant.md) objects, including recycling idle connections, removing idle connections, and shutting down connections when needed. 



 Usage of the [HostManager]() class is typically transparent to developers and is handled internally by the Best HTTP library. However, it provides a convenient and efficient way to manage connections and requests when needed. 


## **Methods**:

### **GetHostVariant**
: Gets the [HostVariant](HostVariant.md) associated with an HTTP request. 

### **GetHostVariant**
: Gets the [HostVariant](HostVariant.md) associated with a HostKey. 

### **RemoveAllIdleConnections**
: Removes all idle connections for all hosts. 

### **TryToSendQueuedRequests**
: Tries to send queued requests for all hosts. 

### **Shutdown**
: Shuts down all connections for all hosts. 

### **Clear**
: Clears all hosts and their associated variants. 