---
comments: true
---
# IContentConsumer

The IContentConsumer interface represents a consumer of content provided by an [IPeekableContentProvider](IPeekableContentProvider.md). It defines methods for handling received content and connection-related events. 

**Remarks:**

Key Functions of IContentConsumer: 

- **Content Handling**: Defines methods for handling incoming content, allowing consumers to process data as it becomes available. 
- **Connection Management**: Provides event methods to notify consumers of connection closure and error conditions, facilitating graceful handling of connection-related issues. 



## **Fields**:
### **[PeekableContentProviderStream](../Streams/PeekableContentProviderStream.md) ContentProvider**
: Gets the [PeekableContentProviderStream](../Streams/PeekableContentProviderStream.md) associated with this content consumer, which allows access to incoming content. 
## **Methods**:

### **SetBinding**
: This method should not be called directly. It is used internally to set the binding between the content consumer and its associated content provider. 

### **UnsetBinding**
: This method should not be called directly. It is used internally to unset the binding between the content consumer and its associated content provider. 

### **OnContent**
: Called when new content is available from the associated content provider. 

### **OnConnectionClosed**
: Called when the connection is closed by the remote peer. It notifies the content consumer about the connection closure. 

### **OnError**
: Called when an error occurs during content processing or connection handling. It provides the exception that caused the error. 