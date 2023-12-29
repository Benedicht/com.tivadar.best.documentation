---
comments: true
---

Step-by-step getting started guide with Best STOMP in Unity.

## Initial Setup

- [Install Dependencies](../installation.md): Ensure that the Best HTTP and Best WebSockets packages are installed in your Unity project.
- Add Best STOMP: Import the Best STOMP package into your Unity project.

## Create a New Script

- Create a Script: In your Unity project, create a new C# script. You can name it like `STOMPPlayground`.
- Namespace and Usings: Start by declaring the necessary namespaces:

```cs hl_lines="1-2"
using Best.HTTP.Request.Authentication;
using Best.STOMP;

using System;
using UnityEngine;
```

## Script Setup
- The `STOMPPlayground` class is already inheriting from `MonoBehaviour` and a `Start` method should be ready to be use.
- Declare Client: Inside your class, declare a [Client](../api-reference/STOMP/Client.md) object.

Now it should look something like this:

```cs hl_lines="9"
using Best.HTTP.Request.Authentication;
using Best.STOMP;

using System;
using UnityEngine;

public class STOMPPlayground : MonoBehaviour
{
    Client stompClient;

    public void Start()
    {
    }
}
```

## Define Callbacks and Connect

- Initialize and subscribe to connection events in the `Start` method:

```cs hl_lines="5-6 9 14"
public void Start()
{
    stompClient = new Client();

    stompClient.OnConnected += OnConnected;
    stompClient.OnDisconnected += OnDisconnected;
}

private void OnConnected(Client client, ServerParameters serverParams, IncomingFrame frame)
{
    Debug.Log($"OnConnected('{serverParams.Id}', '{serverParams.Server}')");
}

private void OnDisconnected(Client client, Error error)
    => Debug.Log($"OnDisconnected({client}, {error})");
```

- Setup connection parameters and start the connection process

```cs
// Create and configure ConnectParameters using ConnectParametersBuilder.
var parameters = new ConnectParametersBuilder()
    .WithHost("localhost", 15674)
    .WithTransport(SupportedTransports.WebSocket).WithPath("/ws")
    .WithVirtualHost("/")
    .WithCredentials(new Credentials("guest", "guest"))
    .Build();

// Begin connection
stompClient.BeginConnect(parameters);
```

!!! Tip "Both the connect and disconnect methods of the client support asynchronous operations with their respective [ConnectAsync](../api-reference/STOMP/Client.md#taskserverparameters-connectasyncconnectparameters-cancellationtoken) and [DisconnectAsync](../api-reference/STOMP/Client.md#taskerror-disconnectasync) functions."

With this setup our STOMP client is able to connect to a `RabbitMQ` broker using the [STOMP protocol over WebSockets](https://www.rabbitmq.com/web-stomp.html).

??? Example "The full code should looke like this"
    ```cs
    using Best.HTTP.Request.Authentication;
    using Best.STOMP;

    using System;

    using UnityEngine;

    public class STOMPPlayground : MonoBehaviour
    {
        Client stompClient;
        public void Start()
        {
            stompClient = new Client();

            stompClient.OnConnected += OnConnected;
            stompClient.OnDisconnected += OnDisconnected;

            var parameters = new ConnectParametersBuilder()
                .WithHost("localhost", 15674)
                .WithTransport(SupportedTransports.WebSocket).WithPath("/ws")
                .WithVirtualHost("/")
                .WithCredentials(new Credentials("guest", "guest"))
                .Build();

            stompClient.BeginConnect(parameters);
        }

        private void OnConnected(Client client, ServerParameters data, IncomingFrame frame)
        {
            Debug.Log($"OnConnected('{data.Id}', '{data.Server}')");
        }

        private void OnDisconnected(Client client, Error error)
            => Debug.Log($"OnDisconnected({client}, {error})");
    }
    ```

## Implement Subscription and Messaging

Now that we can connect to the broker, we can start add subscriptions and send messages.
To add a subscription we can use the `OnConnected` event, because that's the earliest event that we know the client is connected and can send STOMP messages to the broker.

We have to use the STOMP client's [CreateSubscriptionBuilder](../api-reference/STOMP/Client.md#subscriptionbuilder-createsubscriptionbuilderstring) to create and set up a [SubscriptionBuilder](../api-reference/Builders/SubscriptionBuilder.md).
The minimum data we have to provide is the subscription destination (`"/queue/test"` in this case) that we have to pass to the [CreateSubscriptionBuilder](../api-reference/STOMP/Client.md#subscriptionbuilder-createsubscriptionbuilderstring] call.
When we finished setting up the builder, call its [BeginSubscribe](../api-reference/Builders/SubscriptionBuilder.md#void-beginsubscribe) method to actually start the subscription process.

```cs
private void OnConnected(Client client, ServerParameters data, IncomingFrame frame)
{
    Debug.Log($"OnConnected('{data.Id}', '{data.Server}')");

    client.CreateSubscriptionBuilder("/queue/test")
        .WithCallback(OnTestQueueCallback)
        .WithAcknowledgmentCallback(OnSubsriptionAck)
        .BeginSubscribe();
}

private void OnSubsriptionAck(Client client, Subscription subscription)
    => Debug.Log($"Subscription created: {subscription.Destination}");

private void OnTestQueueCallback(Client client, Subscription subscription, Message message)
{
    Debug.Log($"[{subscription.Destination}]: {message}");
}
```

In this example we have two callbacks:

1. **`OnSubsriptionAck`** will be called when the subscription is acknowledged by the broker.
2. **`OnTestQueueCallback`** will be called every time when the broker is sending a message to the client.

After, or even in the `OnConnected` event the client is free to send messages to the broker. Sending a message is similar to how the subscription is created, a [MessageBuilder](../api-reference/Builders/MessageBuilder.md) can be created 
using the STOMP client's [CreateMessageBuilder](../api-reference/STOMP/Client.md#messagebuilder-createmessagebuilderstring) and passing the message's destination (`"/queue/test"` in this case).

!!! Example 
    === "BeginSend"
        ```cs
        client.CreateMessageBuilder("/queue/test")
                .WithContent("Hello Text World!")
                .WithHeader("custom-header", "custom header value!")
                .WithAcknowledgmentCallback((client, frame) => Debug.Log("Message Sent & Processed!"))
                .BeginSend();
        ```
    === "SendAsync"
        ```cs
        await client.CreateMessageBuilder("/queue/test")
                .WithContent("Hello Text World!")
                .WithHeader("custom-header", "custom header value!")
                .SendAsync();
        Debug.Log("Message Sent & Processed!");
        ```


Most of the calls are optional, but setting the destination, content and calling [BeginSend](../api-reference/Builders/MessageBuilder.md#void-beginsend) are mandatory.

??? Example "Full code"
    ```cs
    using Best.HTTP.Request.Authentication;
    using Best.STOMP;

    using System;

    using UnityEngine;

    public class STOMPPlayground : MonoBehaviour
    {
        Client stompClient;

        public void Start()
        {
            stompClient = new Client();

            stompClient.OnConnected += OnConnected;
            stompClient.OnDisconnected += OnDisconnected;

            var parameters = new ConnectParametersBuilder()
                .WithHost("localhost", 15674)
                .WithTransport(SupportedTransports.WebSocket).WithPath("/ws")
                .WithVirtualHost("/")
                .WithCredentials(new Credentials("guest", "guest"))
                .Build();

            stompClient.BeginConnect(parameters);
        }

        private void OnConnected(Client client, ServerParameters data, IncomingFrame frame)
        {
            Debug.Log($"OnConnected('{data.Id}', '{data.Server}')");

            client.CreateSubscriptionBuilder("/queue/test")
                .WithCallback(OnTestQueueCallback)
                .WithAcknowledgmentCallback(OnSubsriptionAck)
                .BeginSubscribe();
        }

        private void OnSubsriptionAck(Client client, Subscription subscription)
            => Debug.Log($"Subscription created: {subscription.Destination}");

        private void OnTestQueueCallback(Client client, Subscription subscription, Message message)
        {
            Debug.Log($"[{subscription.Destination}]: {message}");
        }

        private void OnDisconnected(Client client, Error error)
            => Debug.Log($"OnDisconnected({client}, {error})");
    }
    ```

## Clean Up

As a final code-step, we can add some clean-up. When the `GameObject` is destroyed by Unity, disconnect from the server:

```cs
private void OnDisable()
    => this.stompClient?.BeginDisconnect();
```

Of course, this step is different for every application, the STOMP client doesn't have to be bound to a `GameObject` or let alone to one scene, it can even outlive scene transitions.

## Final Code

This is the final, working code:

```cs
using Best.HTTP.Request.Authentication;
using Best.STOMP;

using System;

using UnityEngine;

public class STOMPPlayground : MonoBehaviour
{
    Client stompClient;

    public void Start()
    {
        stompClient = new Client();

        stompClient.OnConnected += OnConnected;
        stompClient.OnDisconnected += OnDisconnected;

        var parameters = new ConnectParametersBuilder()
            .WithHost("localhost", 15674)
            .WithTransport(SupportedTransports.WebSocket).WithPath("/ws")
            .WithVirtualHost("/")
            .WithCredentials(new Credentials("guest", "guest"))
            .Build();

        stompClient.BeginConnect(parameters);
    }

    private void OnConnected(Client client, ServerParameters data, IncomingFrame frame)
    {
        Debug.Log($"OnConnected('{data.Id}', '{data.Server}')");

        client.CreateSubscriptionBuilder("/queue/test")
            .WithCallback(OnTestQueueCallback)
            .WithAcknowledgmentCallback(OnSubsriptionAck)
            .BeginSubscribe();
    }

    private void OnSubsriptionAck(Client client, Subscription subscription)
        => Debug.Log($"Subscription created: {subscription.Destination}");

    private void OnTestQueueCallback(Client client, Subscription subscription, Message message)
    {
        Debug.Log($"[{subscription.Destination}]: {message}");
    }

    private void OnDisconnected(Client client, Error error)
        => Debug.Log($"OnDisconnected({client}, {error})");

    private void OnDisable()
        => this.stompClient?.BeginDisconnect();
}
```

!!! Note "A lot of details are left out for brevity, for example don't forget to wrap your classes in namespaces."

## Test Your Setup

Run the Script: Attach the script to a `GameObject` in your Unity scene and enter Play mode to test the STOMP client functionality.

Running the code above connecting to a local RabbitMQ broker would produce an output like this:

  ![Script Run](media/script-run-light.png#only-light){ loading=lazy }
  ![Script Run](media/script-run-dark.png#only-dark){ loading=lazy }