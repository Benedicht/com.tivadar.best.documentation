---
comments: true
---
# IPeekableContentProvider

The IPeekableContentProvider interface defines an abstraction for providing content to an [IContentConsumer](IContentConsumer.md) with the ability to peek at the content without consuming it. It is an essential part of content streaming over a TCP connection. 

**Remarks:**

Key Functions of IPeekableContentProvider: 

- **Content Provision**: It provides content to an associated [IContentConsumer](IContentConsumer.md) without immediately consuming the content. This allows the consumer to examine the data before processing. 
- **Two-Way Binding**: Supports establishing a two-way binding between the [IPeekableContentProvider]() and an [IContentConsumer](IContentConsumer.md), enabling bidirectional communication between the provider and consumer. 
- **Unbinding**: Provides methods for unbinding a content consumer, terminating the association between the provider and consumer. 



## **Fields**:
### **[PeekableContentProviderStream](../Streams/PeekableContentProviderStream.md) Peekable**
: Gets the [PeekableContentProviderStream](../Streams/PeekableContentProviderStream.md) associated with this content provider, which allows peeking at the content without consuming it. 
### **[IContentConsumer](IContentConsumer.md) Consumer**
: Gets the [IContentConsumer](IContentConsumer.md) implementor that will be notified through [OnContent](IContentConsumer.md#void-oncontent) calls when new data is available in the TCPStreamer. 
## **Methods**:

### Void SetTwoWayBinding([IContentConsumer](IContentConsumer.md))
: Sets up a two-way binding between this content provider and an [IContentConsumer](IContentConsumer.md). This enables bidirectional communication between the provider and consumer. 

### Void Unbind()
: Unbinds the content provider from its associated content consumer. This terminates the association between the provider and consumer. 

### Void UnbindIf([IContentConsumer](IContentConsumer.md))
: Unbinds the content provider from a specific content consumer if it is currently bound to that consumer. 