---
comments: true
---
# PeekableContentProviderStream

A PeekableStream implementation that also implements the [IPeekableContentProvider](../Tcp/IPeekableContentProvider.md) interface too. 


## **Methods**:

### Void Unbind()
: This will set Consumer to null. 

### Void UnbindIf([IContentConsumer](../Tcp/IContentConsumer.md))
: Set Consumer to null if the current one is the one passed in the parameter.  