---
comments: true
title: Headers
---

# Sending and Receiving Headers

The STOMP protocol, and consequently Best STOMP, support the setting and sending of custom headers during connection, subscription requests, and message exchanges.

## During Connection

Custom headers can be sent during the connection request using the [ConnectParametersBuilder](../api-reference/Builders/ConnectParametersBuilder.md)'s `WithHeader` function.
You can call `WithHeader` multiple times to add more than one header:

```cs hl_lines="6-9"
var parameters = new ConnectParametersBuilder()
    .WithHost("localhost", 15674)
    .WithTransport(SupportedTransports.WebSocket).WithPath("/ws")
    .WithVirtualHost("/")
    .WithCredentials(new Credentials("guest", "guest"))
    .WithHeader("Header-1", "Value 1")
    .WithHeader("Header-2", "Value 2")
    // ...
    .WithHeader("Header-N", "Value N")
    .Build();
```

Brokers can also send headers while acknowledging the connection. These broker-sent headers are accessible through the [ServerParameters](../api-reference/STOMP/ServerParameters.md)'s `Headers` dictionary:

```cs hl_lines="5-6"
void OnConnected(Client client, ServerParameters data, IncomingFrame frame)
{
    Debug.Log($"OnConnected('{data.Id}', '{data.Server}')");

    if (data.Headers.TryGetValue("Header-1", out var value))
        Debug.Log(value);
}
```

!!! Tip
    Access the broker's parameters anytime after connection through the [Client's ServerParameters property](../api-reference/STOMP/Client.md#serverparameters-serverparameters):
    ```cs
    if (client.ServerParameters.Headers.TryGetValue("Header-1", out var value))
        Debug.Log(value);
    ```

## During Subscription

Similarly, custom headers can be sent during subscription requests using the [SubscriptionBuilder](../api-reference/Builders/SubscriptionBuilder.md)'s `WithHeader` function:

```cs hl_lines="5-8"
client.CreateSubscriptionBuilder("/queue/test")
    .WithAcknowledgmentMode(AcknowledgmentModes.ClientIndividual)
    .WithCallback(OnTestQueueCallback)
    .WithAcknowledgmentCallback(OnSubsriptionAck)
    .WithHeader("Header-1", "Value 1")
    .WithHeader("Header-2", "Value 2")
    // ...
    .WithHeader("Header-N", "Value N")
    .BeginSubscribe();
```

Brokers can send key-value pairs when acknowledging a subscription request.
Access these headers via the [IncomingFrame](../api-reference/STOMP/IncomingFrame.md)'s `Header` property:

```cs
private void OnSubsriptionAck(Client client, Subscription subscription, IncomingFrame frame)
{
    Debug.Log($"Subscription created: {subscription.Destination}");

    if (frame.Headers.TryGetValue("Header-1", out var value))
        Debug.Log(value);

}
```

## During Message Sending and Receiving

A client can add additional metadata to its outgoing messages during message sending using the [MessageBuilder](../api-reference/Builders/MessageBuilder.md)'s `WithHeader` call.
Any header added by the client be retained by the broker and any receiving client can retrive them.

To add a header to an outgoing message the [MessageBuilder](../api-reference/Builders/MessageBuilder.md)'s `WithHeader` can be used:

```cs hl_lines="3"
client.CreateMessageBuilder("/queue/test")
                .WithContent("Hello World!")
                .WithHeader("custom-header", "custom header value!")
                .BeginSend();
```

While receiving messages, the [Message](../api-reference/STOMP/Message.md) has its own `Headers` property, holding all the header key-value pairs:

```cs hl_lines="5-6"
private void OnTestQueueCallback(Client client, Subscription subscription, Message message)
{
    Debug.Log($"[{subscription.Destination}]: {message}");

    if (message.Headers.TryGetValue("custom-header", out var header) )
        Debug.Log(header);
}
```