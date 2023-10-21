# Message

Represents a single Server-Sent Event message as specified by the W3C SSE specification. This encapsulates individual data sent over an SSE connection, providing event details, payload data, and related metadata. Each message can represent actual data or comments from the server. 

## **Fields**:
### **Id**
: Represents the unique identifier for the event message, utilized to ensure message continuity in case of connection disruptions. 
### **Event**
: Name of the event, or an empty string. 
### **Data**
: The actual payload of the message. 
### **Retry**
: A reconnection time, in milliseconds. This must initially be a user-agent-defined value, probably in the region of a few seconds. 
### **IsComment**
: If this is true, the Data property holds the comment sent by the server. 