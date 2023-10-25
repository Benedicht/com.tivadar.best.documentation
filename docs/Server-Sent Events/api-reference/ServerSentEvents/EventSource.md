---
comments: true
---
# EventSource

The EventSource class provides an implementation of the [Server-Sent Events (SSE) standard](https://html.spec.whatwg.org/multipage/server-sent-events.html). SSE is a simple and efficient protocol to receive real-time updates over HTTP. Instead of continually polling the server for changes, clients can open a single connection and receive updates as they happen, making it a powerful tool for building real-time applications.  Why Use EventSource: 

- Reduces the amount of redundant data sent over the network, since there's no need to repeatedly poll the server.
- Simplifies the client-side logic, as the protocol handles reconnects and manages the connection state.
- Offers a standardized way (via [the W3C standard](https://html.spec.whatwg.org/multipage/server-sent-events.html)) to achieve real-time communication in web applications.



This class encapsulates the complexity of the SSE protocol, offering an easy-to-use API for both sending and receiving real-time updates.

**Remarks:**

How It Works: 

- A client makes a request to an SSE-supporting server, specifying that it expects the server to keep the connection open.
- The server holds the connection and sends data whenever a new event occurs. Each event is sent as a block of text terminated by a pair of newline characters.
- Clients process these events as they arrive.



## **Fields**:
### **Uri**
: Gets the URI of the remote endpoint. 
### **State**
: Gets the current state of the EventSource object. 
### **ReconnectionTime**
: Gets or sets the duration to wait before attempting a reconnection. Defaults to 2 seconds. 
	!!! note ""
		The server can override this setting.

### **LastEventId**
: Gets the ID of the last successfully received event. 
### **IsClosed**
: Gets a value indicating whether the EventSource is in the [Closed](States.md#closed) state. 
### **LoggingContext**
: Gets the logging context for the current EventSource instance. 
### **InternalRequest**
: Gets the internal [HTTPRequest](../../../HTTP/api-reference/HTTP/HTTPRequest.md) object used by the EventSource for communication. 
### **OnOpen**
: Called when successfully connected to the server. 
### **OnMessage**
: Called on every message received from the server. 
### **OnError**
: Called when an error occurs. 
### **OnRetry**
: Called when the EventSource will try to do a retry attempt. If this function returns with false, it will cancel the attempt. 
### **OnComment**
: This event is called for comments received from the server. 
### **OnClosed**
: Called when the EventSource object closed. 
### **OnStateChanged**
: Called every time when the State property changed. 
## **Methods**:

### **Open**
: Start to connect to the remote server. 

### **Close**
: Start to close the connection. 

### **On**
: With this function an event handler can be subscribed for an event name. 

### **Off**
: With this function the event handler can be removed for the given event name. 
	!!! note ""
		The event is still will be sent by the server and processed by the client.
