---
comments: true
---
# Client

Represents a client for communicating with a [STOMP (Simple Text Oriented Messaging Protocol)](https://stomp.github.io) v1.2 broker. 

**Remarks:**

STOMP is a simple, text-based protocol offering an interoperable wire format that enables clients to communicate with a wide range of message brokers and queueing systems, ensuring broad compatibility across different STOMP message brokers. This class manages the connection lifecycle, message subscription and publishing, transaction handling, and heartbeating as per the [STOMP 1.2](https://stomp.github.io/stomp-specification-1.2.html) specification. 

 Key features include: 

- Connecting and disconnecting from a STOMP broker.
- Subscribing to message destinations and receiving messages.
- Sending messages to destinations in the broker.
- Handling message acknowledgments and transactions.
- Maintaining the client state and managing heartbeats to ensure a live connection.

 The client supports both callback and async-await based operation patterns, making it suitable for various application scenarios. 

## **Fields**:
### **[ConnectParameters](ConnectParameters.md) Parameters**
: Gets the parameters used for establishing a connection with the STOMP server. 
### **[ServerParameters](ServerParameters.md) ServerParameters**
: Gets the parameters negotiated with the STOMP broker after a successful connection. 
### **[States](States.md) State**
: Current state of the STOMP client. State changed events are emitted through the [OnStateChanged](#actionclient,-states,-states-onstatechanged) event. 
### **[Action](https://learn.microsoft.com/en-us/dotnet/api/System.Action-3)&lt;[Client](), [ServerParameters](ServerParameters.md), [IncomingFrame](IncomingFrame.md)&gt; OnConnected**
: Called when the client successfully connected to the broker. 
### **[Action](https://learn.microsoft.com/en-us/dotnet/api/System.Action-2)&lt;[Client](), [Error](Error.md)&gt; OnDisconnected**
: Called after the client disconnects from the broker. 
### **[Action](https://learn.microsoft.com/en-us/dotnet/api/System.Action-3)&lt;[Client](), [States](States.md), [States](States.md)&gt; OnStateChanged**
: Called for every internal state change of the client. 
### **[Func](https://learn.microsoft.com/en-us/dotnet/api/System.Func-3)&lt;[Client](), [IncomingFrame](IncomingFrame.md), [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean)&gt; OnFrame**
: Called for every frame received from the broker. 
## **Methods**:

### Void BeginConnect([ConnectParameters](ConnectParameters.md), [CancellationToken](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.CancellationToken))
: Initiates a connection to the STOMP broker using the provided [ConnectParameters](ConnectParameters.md). 

### [Task](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.Tasks.Task-1)&lt;[ServerParameters](ServerParameters.md)&gt; ConnectAsync([ConnectParameters](ConnectParameters.md), [CancellationToken](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.CancellationToken))
: Using the [ConnectParameters](ConnectParameters.md) passed as its parameter begins the connection procedure to the broker. 

### Void BeginDisconnect()
: Initiates the disconnection process from the STOMP broker. 

### [Task](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.Tasks.Task-1)&lt;[Error](Error.md)&gt; DisconnectAsync()
: Asynchronously disconnects from the STOMP broker. 

### [Transaction](Transaction.md) CreateTransaction()
: Creates a new [transaction](Transaction.md) for sending and receiving messages in a transactional context. 

### [SubscriptionBuilder](../Builders/SubscriptionBuilder.md) CreateSubscriptionBuilder([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Begins the construction of a new subscription to the specified destination. 

### [Subscription](Subscription.md) FindSubscription([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Searches for a subscription by its destination. 

### [MessageBuilder](../Builders/MessageBuilder.md) CreateMessageBuilder([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Begins the construction of a new message to a specified destination. 