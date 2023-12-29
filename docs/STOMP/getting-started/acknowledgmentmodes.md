---
comments: true
title: Acknowledgment Modes
---

STOMP provides different acknowledgment modes for handling messages sent by the broker. 
These modes determine how the client acknowledges the receipt and processing of messages. 
Best STOMP supports all the three [acknowledgment modes](../api-reference/STOMP/AcknowledgmentModes.md) defined by STOMP: [Auto](../api-reference/STOMP/AcknowledgmentModes.md#acknowledgmentmodesauto) (the default), [Client](../api-reference/STOMP/AcknowledgmentModes.md#acknowledgmentmodesclient), and [ClientIndividual](../api-reference/STOMP/AcknowledgmentModes.md#acknowledgmentmodesclientindividual).

## Overview

### Auto

- **Behavior:** The server assumes the client has received and processed the message as soon as it is sent.
- **Usage:** Opt for this mode when minimal network traffic is desired and message loss is acceptable.
- **Risks:** This mode may result in message loss if the client fails to process the message.

### Client

- **Behavior:** The client must explicitly send ACK frames to acknowledge processed messages.
- **Cumulative Acknowledgment:** Acknowledging a message also acknowledges all previously received messages on the subscription.
- **Usage:** Ideal for ensuring message delivery without loss. If certain messages are not processed, the client should send NACK frames.

### ClientIndividual

- **Behavior:** Similar to Client mode, but ACK or NACK frames are not cumulative.
- **Usage:** Use when individual message processing acknowledgment is required, without implying acknowledgment of previous messages.

## Setting the Acknowledgment Mode

To set the acknowledgment mode for a subscription, use the [WithAcknowledgmentMode](../api-reference/Builders/SubscriptionBuilder.md#subscriptionbuilder-withacknowledgmentmodeacknowledgmentmodes) function of the [SubscriptionBuilder](../api-reference/Builders/SubscriptionBuilder.md):

```cs hl_lines="2"
client.CreateSubscriptionBuilder("/queue/test")
      .WithAcknowledgmentMode(AcknowledgmentModes.ClientIndividual)
      .WithCallback(OnTestQueueCallback)
      .WithAcknowledgmentCallback(OnSubscriptionAck)
      .BeginSubscribe();
```

## Acknowledging Messages

For `Client` and `ClientIndividual` modes, you must explicitly acknowledge messages by calling [Message](../api-reference/STOMP/Message.md)'s [SendACK](../api-reference/STOMP/Message.md#void-sendacktransaction):

```cs hl_lines="5-6"
private void OnTestQueueCallback(Client client, Subscription subscription, Message message)
{
    Debug.Log($"[{subscription.Destination}]: {message}");

    if (subscription.AcknowledgmentMode != AcknowledgmentModes.Auto)
        message.SendACK();
}
```

If, for some reason a message couldn't be handled or processed by the client, an NACK (non-acknowledgment) message should be sent:

```cs hl_lines="5-6"
private void OnTestQueueCallback(Client client, Subscription subscription, Message message)
{
    Debug.Log($"[{subscription.Destination}]: {message}");

    if (subscription.AcknowledgmentMode != AcknowledgmentModes.Auto)
        message.SendNACK();
}
```

## ACKs and transactions

Both `ACK` and `NACK` messages can be sent in a context of a [transaction](transactions.md), in witch case a transaction instance can be passed as theirs parameter.

## Why Use Different Acknowledgment Modes?

- **Control Over Message Handling:** Choose how rigorously your client handles message acknowledgments.
- **Network Efficiency vs. Reliability:** Auto mode reduces network traffic but at the risk of losing messages. Client and ClientIndividual modes enhance reliability at the cost of increased network communication.
- **Application Requirements:** The choice depends on your application's need for reliability, message ordering, and network constraints.

## Final Notes

Selecting the right acknowledgment mode is crucial for the reliability and efficiency of your messaging system. 
Best STOMP provides flexible options to suit various application needs, ensuring robust and effective real-time messaging in Unity projects.