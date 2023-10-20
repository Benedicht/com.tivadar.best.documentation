# SocketOptions

Contains settings for a [SocketManager](../SocketIO/SocketManager.md). 

## **Fields**:
### **ConnectWith**
: The SocketManager will try to connect with this transport. 
### **Reconnection**
: Whether to reconnect automatically after a disconnect (default true) 
### **ReconnectionAttempts**
: Number of attempts before giving up (default Int.MaxValue) 
### **ReconnectionDelay**
: How long to initially wait before attempting a new reconnection (default 1000ms). Affected by +/- RandomizationFactor, for example the default initial delay will be between 500ms to 1500ms. 
### **ReconnectionDelayMax**
: Maximum amount of time to wait between reconnections (default 5000ms). Each attempt increases the reconnection delay along with a randomization as above. 
### **RandomizationFactor**
: (default 0.5`), [0..1] 
### **Timeout**
: Connection timeout before a connect_error and connect_timeout events are emitted (default 20000ms) 
### **AutoConnect**
: By setting this false, you have to call SocketManager's Open() whenever you decide it's appropriate. 
### **AdditionalQueryParams**
: Additional query parameters that will be passed for accessed uris. If the value is null, or an empty string it will be not appended to the query only the key. 
### **QueryParamsOnlyForHandshake**
: If it's false, the parameters in the AdditionalQueryParams will be passed for all HTTP requests. Its default value is true. 
### **HTTPRequestCustomizationCallback**
: A callback that called for every HTTPRequest the socket.io protocol sends out. It can be used to further customize (add additional request for example) requests. 
### **Auth**
: Starting with Socket.IO v3, connecting to a namespace a client can send payload data. When the Auth callback function is set, the plugin going to call it when connecting to a namespace. Its return value must be a json string! 
### **WebsocketOptions**
: Customization options for the websocket transport. 
### **BuiltQueryParams**
: The cached value of the result of the BuildQueryParams() call. 
## **Methods**:

### **#ctor**
: Constructor, setting the default option values. 

### **BuildQueryParams**
: Builds the keys and values from the AdditionalQueryParams to an key=value form. If AdditionalQueryParams is null or empty, it will return an empty string. 