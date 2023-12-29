---
comments: true
---
# Subscription

Represents a subscription to a destination in the STOMP broker. 

## **Fields**:
### **[Client](Client.md) Client**
: Gets the client associated with this subscription. 
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) Id**
: Gets the unique identifier of the subscription. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Destination**
: Gets the destination to which this subscription is subscribed. 
### **[AcknowledgmentModes](AcknowledgmentModes.md) AcknowledgmentMode**
: Gets the acknowledgment mode for this subscription. 
## **Methods**:

### Add(Client, Subscription, Message})
: Adds a callback to be invoked when a message is received on this subscription. 

### Void Clear()
: Clears all callbacks associated with this subscription. 

### Remove(Client, Subscription, Message})
: Removes a specific callback from this subscription. 

### BeginUnsubscribe(Client, Subscription})
: Begins the process of unsubscribing from the destination and optionally executes a callback upon acknowledgment. 

### [Task](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.Tasks.Task-1)&lt;[Subscription]()&gt; UnsubscribeAsync()
: Begins the process of unsubscribing from the destination and optionally executes a callback upon acknowledgment. 