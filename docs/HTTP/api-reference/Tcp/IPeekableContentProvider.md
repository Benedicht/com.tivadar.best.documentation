# IPeekableContentProvider

The IPeekableContentProvider interface defines an abstraction for providing content to an [IContentConsumer](../Tcp/IContentConsumer.md) with the ability to peek at the content without consuming it. It is an essential part of content streaming over a TCP connection. 

**Remarks**:

Key Functions of IPeekableContentProvider: 

- **Content Provision:**: 
- **Two-Way Binding:**: 
- **Unbinding:**: 



## **Fields**:
### **Peekable**
: Gets the [PeekableContentProviderStream](../Streams/PeekableContentProviderStream.md) associated with this content provider, which allows peeking at the content without consuming it. 
### **Consumer**
: Gets the [IContentConsumer](../Tcp/IContentConsumer.md) implementor that will be notified through [OnContent](../Tcp/IContentConsumer.md#oncontent) calls when new data is available in the TCPStreamer. 
## **Methods**:

### **SetTwoWayBinding**
: Sets up a two-way binding between this content provider and an [IContentConsumer](../Tcp/IContentConsumer.md). This enables bidirectional communication between the provider and consumer. 

### **Unbind**
: Unbinds the content provider from its associated content consumer. This terminates the association between the provider and consumer. 

### **UnbindIf**
: Unbinds the content provider from a specific content consumer if it is currently bound to that consumer. 