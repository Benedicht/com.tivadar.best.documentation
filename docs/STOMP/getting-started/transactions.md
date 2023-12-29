---
comments: true
title: Transactions
---

# Using STOMP Transactions with Best STOMP

STOMP transactions are a powerful feature that allows grouping multiple operations into a single unit. 
These transactions ensure that all operations within them either succeed or fail together. 
Best STOMP's implementation of STOMP transactions offers a reliable way to handle grouped messaging tasks in Unity.

## Understanding STOMP Transactions
STOMP transactions are used to execute a series of messaging operations as a single atomic operation. 
This is particularly useful in scenarios where the consistency of a set of messages is critical.

## When to Use Transactions

- **Batch Message Processing:** When multiple messages need to be processed together.
- **Consistency Guarantee:** To ensure that either all messages are processed successfully or none are, maintaining data consistency.
- **Error Handling:** Transactions allow for easier error handling in complex messaging scenarios.

## The Transaction Class

The Transaction class in Best STOMP represents a STOMP transaction. It includes methods to begin, commit, or abort transactions.

### Key Properties and Methods

- **Id:** Unique identifier of the transaction.
- **Session:** The STOMP client session associated with the transaction.
- **Begin(callback)/BeginAsync():** Starts the transaction with an optional acknowledgment callback.
- **Commit(callback)/CommitAsync():** Commits all operations within the transaction.
- **Abort(callback)/AbortAsync():** Aborts the transaction, discarding all operations.

## Implementing Transactions in Best STOMP

### Creating a Transaction
To create a transaction, use the CreateTransaction method of the Client object:

```cs title="Creating a Transaction"
var transaction = client.CreateTransaction();
```

### Beginning a Transaction
Start the transaction using the `Begin` method. Optionally, provide a callback to handle acknowledgment:

!!! Example ""
    === "Callback"
        ```cs
        transaction.Begin((client, tr) => 
        {
            Debug.Log($"Transaction({tr}) Begin!");
            // Additional transactional operations...
        });
        ```
    === "Async"
        ```cs
        await transaction.BeginAsync();
        ```

### Sending Messages in a Transaction
Use `CreateMessageBuilder` to construct messages. Specify the transaction using `WithTransaction`:

```cs hl_lines="3"
client.CreateMessageBuilder("/queue/test")
      .WithContent("Hello World!")
      .WithTransaction(transaction)
      .BeginSend();
```

### Committing a Transaction
Commit the transaction to apply all operations:

!!! Example ""
    === "Callback"
        ```cs
        transaction.Commit((client, tr) => 
        {
            Debug.Log($"Transaction({tr}) committed!");
        });
        ```
    === "Async"
        ```cs
        await transaction.CommitAsync();
        ```

### Aborting a Transaction
If needed, abort the transaction to discard all operations:

!!! Example ""
    === "Callback"
        ```cs
        transaction.Abort((client, tr) => 
        {
            Debug.Log($"Transaction({tr}) aborted!");
        });
        ```
    === "Async"
        ```cs
        await transaction.AbortAsync();
        ```

### Full Example
Here's a complete example demonstrating the use of transactions in Best STOMP:

??? Example
    ```cs hl_lines="53-54 63 70 79 85"
    using Best.HTTP.Request.Authentication;
    using Best.STOMP;

    using System;
    using System.Threading.Tasks;

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
                .WithAcknowledgmentMode(AcknowledgmentModes.Auto)
                .WithCallback(OnTestQueueCallback)
                .WithAcknowledgmentCallback(OnSubsriptionAck)
                .BeginSubscribe();
        }

        private void OnDisconnected(Client client, Error error)
            => Debug.Log($"OnDisconnected({client}, {error})");

        private void OnSubsriptionAck(Client client, Subscription subscription)
        {
            Debug.Log($"Subscription created: {subscription.Destination}");

            DoTransaction(client);
        }

        private void DoTransaction(Client client)
        {
            client.CreateTransaction()
                  .Begin(async (client, tr) =>
                  {
                      Debug.Log($"Transaction({tr}) Begin!");

                      try
                      {
                          client.CreateMessageBuilder("/queue/test")
                                          .WithContent("Hello Transaction World!")
                                          .WithAcknowledgmentCallback((client, frame) => Debug.Log("Text Message Processed!"))
                                          .WithTransaction(tr)
                                          .BeginSend();

                          client.CreateMessageBuilder("/queue/test")
                                          .WithContent(new byte[10])
                                          .WithContentType("application/octet-stream")
                                          .WithAcknowledgmentCallback((client, frame) => Debug.Log("Binary Message Processed!"))
                                          .WithTransaction(tr)
                                          .BeginSend();

                          Debug.Log("Messages sent!");

                          // Wait a few seconds before committing
                          await Task.Delay(TimeSpan.FromSeconds(5));

                          // Commit all messagtes
                          await tr.CommitAsync();

                          Debug.Log($"Transaction({tr}) committed!");
                      }
                      catch
                      {
                          await tr.AbortAsync();
                          Debug.Log($"Transaction({tr}) aborted!");
                      }
                  });
        }

        private void OnTestQueueCallback(Client client, Subscription subscription, Message message)
        {
            Debug.Log($"[{subscription.Destination}]: {message}");
            
            if (subscription.AcknowledgmentMode != AcknowledgmentModes.Auto)
                message.SendACK(transaction: null);
        }

        private void OnDisable()
            => this.stompClient?.BeginDisconnect();
    }
    ```

And running it should produce an output like this:

  ![Transaction](media/transaction-light.png#only-light){ loading=lazy }
  ![Transaction](media/transaction-dark.png#only-dark){ loading=lazy }

Messages are sent by the broker only after the client is committed the transaction!

## Why Use Transactions?

- **Atomic Operations:** Ensures that all operations in a transaction are completed successfully or none at all.
- **Error Recovery:** Simplifies error handling by allowing rollback of operations in case of failure.
- **Data Integrity:** Maintains the consistency of message processing and delivery.

STOMP transactions in Best STOMP are essential for scenarios where the integrity of a series of messaging operations is crucial. 
They provide a structured way to manage complex messaging tasks, ensuring consistency and reliability in your Unity applications.