# Introduction

This guide will walk you through setting up a basic Best SignalR connection, invoking methods, and handling real-time communication.

## Setting up the HubConnection

`HubConnection` is your entry point to establish a connection with SignalR. Here's an example creating one:

```cs
hub = new HubConnection(new Uri("https://server/hub"), new JsonProtocol(new LitJsonEncoder()));
```
Here's a deeper dive into the HubConnection class and its components.

## Protocols

SignalR Core supports different protocols to encode its messages like Json and MessagePack. The safest is to use json, as that's the default encoder of the server. But if possible it's recommended to use MessagePack. 
More can be read about this under the [Encoders topic](../intermediate-topics/encoders.md).
On this page the `JsonProtocol` combined with the `LitJsonEncoder` will be used, as these work out of the box.

A new `HubConnection` object must be initialized with the uri of the server endpoint and with the protocol that the client want to communicate with:
```cs
hub = new HubConnection(new Uri("https://server/hub"), new JsonProtocol(new LitJsonEncoder()));
```

`HubConnection`'s constructor can accept a `HubOptions` instance too:
```cs
HubOptions options = new HubOptions();
hub = new HubConnection(new Uri("https://server/hub"), new JsonProtocol(new LitJsonEncoder()), options);
```

## Connecting to the server

To start the protocol's connection process the `StartConnect` and `ConnectAsync` functions can be used.

!!! Example
    === "StartConnect"
        ```cs hl_lines="4"
        var hub = new HubConnection(new Uri("https://server/hub"), new JsonProtocol(new LitJsonEncoder()));
        hub.OnConnected = (hub) => Debug.Log("Connected!");

        hub.StartConnect();
        ```

    === "ConnectAsync"
        ```cs hl_lines="3"
        var hub = new HubConnection(new Uri("https://server/hub"), new JsonProtocol(new LitJsonEncoder()));
    
        await hub.ConnectAsync();

        Debug.Log("Connected!");
        ```

## Invoking server methods

To invoke a method on a server that doesn't return a value, the `Send` and `SendAsync` methods can be used.
Their first parameter is the name of the method on the server, than a parameter list can be passed that will be sent to the server.

!!! Example
    === "Send"
        ```cs
        hub.Send("Send", "my message");
        ```
    === "SendAsync"
        ```cs
        await hub.SendAsync("Send", "my message");
        ```
    === "SendAsync With CancellationToken"
        ```cs hl_lines="1 5"
        using (var source = new CancellationTokenSource(TimeSpan.FromSeconds(2)))
        {
            try
            {
		        await hub.SendAsync("Send", source.Token, "my message");
	        }
            catch(TaskCanceledException)
            {
                Debug.Log("Timed out!");
            }
        }
        ```
        !!! Note "It can't cancel an already sent call, the server still going to process it, but the client going to give back controll sooner."
	

    ```cs title="Related Server Code"
    public class TestHub : Hub
    {
        public Task Send(string message)
        {
            return Clients.All.SendAsync("Send", $"{Context.ConnectionId}: {message}");
        }
    }
    ```

## Invoking server functions

Invoking a server function can be done with the generic `Invoke<TResult>` or `InvokeAsync<TResult>` functions. `TResult` is the expected type that the server function returns with.

!!! Example
    ```cs hl_lines="1 5"
    hub.Invoke<int>("Add", 10, 20)
        .OnSuccess(result => Debug.log("10+20: " + result))
        .OnError(error => Debug.log("Add(10, 20) failed to execute. Error: " + error));
	
    var addResult = await hub.InvokeAsync<int>("Add", 10, 20);
    AddText(string.Format("'<color=green>Add(10, 20)</color>' returned: '<color=yellow>{0}</color>'", addResult)).AddLeftPadding(20);
    ```

`Invoke` returns with an `IFuture<TResult>` that can be used to subscribe to various Invoke related events:

- **OnSuccess**: Callback passed for OnSuccess is called when the server side function is executed and the callback's parameter will be function's return value.
- **OnError**: Callback passed to this function will be called when there's an error executing the function. The error can be a client or server error. The callback's error parameter will contain information about the error.
- **OnComplete**: Callback passed to this function will be called after an *OnSuccess* **or** *OnError* callback.

`InvokeAsync` returns with `Task<TResult>` that can be awaited. As a second parameter a `CancellationToken` can be added to cancel the call on client side.

!!! Example
    ```cs hl_lines="1 5"
    using (var source = new CancellationTokenSource(TimeSpan.FromSeconds(2)))
    {
        try
        {
            var addResult = await hub.InvokeAsync<int>("Add", source.Token, 10, 20);
            // ...
        }
        catch(TaskCanceledException)
        {
            Debug.Log("Timed out!");
        }
    }
    ```

    ```cs title="Related Server Code"
    public class TestHub : Hub
    {
        public int Add(int x, int y)
        {
            return x + y;
        }
    }
    ```

!!! Note "All `Send`, `Invoke` and theirs `Async` counterparts are going to wait for a completion message from the server and their IFuture/Task completes when received it."

## Server callable client methods

Clients can define server-callable methods using the generic and non-generic `On` method. 
The non-generic `On` can be used when the server-callable method has no parameter and the generic one for methods with at least one parameter.

!!! Example
    ```cs
    // Generic On with one string argument.
    hub.On("Send", (string arg) => Debug.log("Server-sent text: " + arg));

    // Generic On, with one type:
    hub.On<Person>("Person", (person) => Debug.log("Server-sent data: " + person.ToString()));

    // Generic On, with two types:
    hub.On<Person, Person>("TwoPersons", (person1, person2) => Debug.log("..."));

    sealed class Person
    {
        public string Name { get; set; }
        public long Age { get; set; }

        public override string ToString()
        {
            return string.Format("[Person Name: '{0}', Age: '<color=yellow>{1}</color>']", this.Name, this.Age.ToString());
        }
    }
    ```

    ```cs title="Relating Server Code"
    public class TestHub : Hub
    {
	    public override async Task OnConnectedAsync()
        {
            await Clients.All.SendAsync("Send", $"{Context.ConnectionId} joined");

            await Clients.Client(Context.ConnectionId).SendAsync("Person", new Person { Name = "Person 007", Age = 35 });
		
            await Clients.Client(Context.ConnectionId).SendAsync("TwoPersons", new Person { Name = "Person 008", Age = 36 }, new Person { Name = "Person 009", Age = 37 });
        }
    }
    ```

## Server callable client functions

Server code that uses `InvokeAsync` and expects an `int` result:
!!! Example
    ```cs title="Server Code"
    public async Task SomeMethod(IHubContext<TestHub> context)
    {
        int min = 0, max = 10;
        var randomValue = Random.Shared.Next(0, 10);
        var result = await context.Clients.Client(Context.ConnectionId).InvokeAsync<int>("GetResult", $"Guess the value between {min} and {max}.", min, max);
        if (result == randomValue)
        {
            await context.Clients.Client(Context.ConnectionId).SendAsync("EndResult", $"You guessed correctly ({result})!");
        }
        else
        {
            await context.Clients.Client(Context.ConnectionId).SendAsync("EndResult", $"You guessed incorrectly({result}), value was {randomValue}");
        }
    }
    ```

    ```cs title="Client-side Code"
    // Trigger SomeMethod on the server
    hub.Send("SomeMethod");

    // Function callback
    hub.On<string, int, int, int>("GetResult", (string description, int min, int max) =>
    {
        UnityEngine.Debug.Log(description);

        return UnityEngine.Random.Range(min, max);
    });

    // Final result called by the server
    hub.On<string>("EndResult", (result) =>
    {
        UnityEngine.Debug.Log(result);
    });
    ```

`hub.Send("SomeMethod");` calls `SomeMethod` on the server triggering the whole logic. The first callback for `GetResult` receives the three arguments(`description`, `min` and `max`) and must return with an `int` result
When the server receives `result` it continues its execution and compares it its own `randomValue` calling `EndResult` on the client.

## Disconnection and errors

To disconnect from the server and close the connection gracefully, the `StartClose`/`CloseAsync` functions can be used:

!!! Example
    === "StartClose"
        ```cs hl_lines="4"
        var hub = new HubConnection(new Uri("https://server/hub"), new JsonProtocol(new LitJsonEncoder()));
        hub.OnClosed = (hub) => Debug.Log("Closed!");

        hub.OnConnected = (hub) => { 
          Debug.Log("Connected!");

          // Start to close the connection
          hub.StartClose();
        };

        hub.StartConnect();
        ```

    === "ConnectAsync"
        ```cs hl_lines="3"
        var hub = new HubConnection(new Uri("https://server/hub"), new JsonProtocol(new LitJsonEncoder()));
    
        await hub.ConnectAsync();

        Debug.Log("Connected!");

        await hub.CloseAsync();

        Debug.Log("Closed!");
        ```

Like `StartConnect()`/`ConnectAsync()` calles are paired with `OnConnected`, `StartClose()`/`CloseAsync()` are paired with the `OnClosed` event. 
These events are called even if their' Async peer is used.

!!! Note "`OnClosed` is called only when the server or client initiates the closure of the Hub connection and could terminate gracefully. If there's a network error, only the `OnError` event will be called as it always means that the client disconnected from the server!"