---
comments: true
---
# SocketOptions

Contains settings for a [SocketManager](SocketManager.md). 

## **Fields**:
### **TransportTypes ConnectWith**
: The SocketManager will try to connect with this transport. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) Reconnection**
: Whether to reconnect automatically after a disconnect (default true) 
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) ReconnectionAttempts**
: Number of attempts before giving up (default Int.MaxValue) 
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) ReconnectionDelay**
: How long to initially wait before attempting a new reconnection (default 1000ms). Affected by +/- RandomizationFactor, for example the default initial delay will be between 500ms to 1500ms. 
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) ReconnectionDelayMax**
: Maximum amount of time to wait between reconnections (default 5000ms). Each attempt increases the reconnection delay along with a randomization as above. 
### **[Single](https://learn.microsoft.com/en-us/dotnet/api/System.Single) RandomizationFactor**
: (default 0.5`), [0..1] 
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) Timeout**
: Connection timeout before a connect_error and connect_timeout events are emitted (default 20000ms) 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) AutoConnect**
: By setting this false, you have to call SocketManager's Open() whenever you decide it's appropriate. 
### **ObservableDictionary&lt;[String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)&gt; AdditionalQueryParams**
: Additional query parameters that will be passed for accessed uris. If the value is null, or an empty string it will be not appended to the query only the key. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) QueryParamsOnlyForHandshake**
: If it's false, the parameters in the AdditionalQueryParams will be passed for all HTTP requests. Its default value is true. 
### **HTTPRequestCallbackDelegate HTTPRequestCustomizationCallback**
: A callback that called for every HTTPRequest the socket.io protocol sends out. It can be used to further customize (add additional request for example) requests. 
### **[Func](https://learn.microsoft.com/en-us/dotnet/api/System.Func-3)&lt;[SocketManager](SocketManager.md), [Socket](Socket.md), [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)&gt; Auth**
: Starting with Socket.IO v3, connecting to a namespace a client can send payload data. When the Auth callback function is set, the plugin going to call it when connecting to a namespace. Its return value must be a json string! 
### **WebsocketOptions WebsocketOptions**
: Customization options for the websocket transport. 