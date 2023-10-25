---
comments: true
---
# WebSocketOverHTTP2Settings

Settings for HTTP/2 connections when the Connect protocol is available. 

## **Fields**:
### **EnableWebSocketOverHTTP2**
: Set it to false to disable Websocket Over HTTP/2 (RFC 8441). It's true by default. 
### **EnableImplementationFallback**
: Set it to disable fallback logic from the Websocket Over HTTP/2 implementation to the 'old' HTTP/1 implementation when it fails to connect. 