---
comments: true
---
# SubscriptionBuilder

A builder to help in creation of a new [Subscription](../STOMP/Subscription.md). 

**Remarks:**

A new builder can be created by using the [CreateSubscriptionBuilder](../STOMP/Client.md#subscriptionbuilder-createsubscriptionbuilderstring) function!


## **Methods**:

### [SubscriptionBuilder]() WithAcknowledgmentMode([AcknowledgmentModes](../STOMP/AcknowledgmentModes.md))
: Sets the [acknowledgment mode](../STOMP/AcknowledgmentModes.md) for the subscription. 

### WithAcknowledgmentCallback(Client, Subscription})
: Sets a callback to be invoked upon acknowledgment of the subscription. 

### WithCallback(Client, Subscription, Message})
: Sets a callback to be invoked when a message is received on this subscription. 

### [SubscriptionBuilder]() WithHeader([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Adds a custom header to the subscription. 

### Void BeginSubscribe()
: Begins the process of subscribing to the destination. 

### [Task](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.Tasks.Task-1)&lt;[Subscription](../STOMP/Subscription.md)&gt; SubscribeAsync()
: Begins the process of subscribing to the destination. 