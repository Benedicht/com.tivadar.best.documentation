---
title: Sessions
comments: true
---

!!! Note "By default Best MQTT creates a random client ID on first connection to a broker. Most of the time there's no need to use SessionHelper."

To be able to support QoS 1 and 2 both the client and the broker must have a way to store state information. 
Best MQTT handles session creation and resuming to the last used one automatically. 
With the help of the `SessionHelper` class it's possible to manage and set sessions manually.

!!! Warning "While the server stores the clients' subscriptions, Best MQTT can't recreate the binding between a topic filter and its callback. It's highly advised to always subscribe to topic filters when connected!"

## Get a session

`SessionHelper.Get` returns with the last used session for the given host.

```cs
var session = SessionHelper.Get("broker.emqx.io");
Debug.Log(session.ClientId);
```

![Session Client Id](media/session_client_id.png)

It can be used any time. If no session created yet for the host, it creates one.

## Create a session with a concrete Client ID

`SessionHelper.Get` has a second, optional `clientId` parameter. 
If omitted returns with the last used session. 
If present tries to load session with that ID, and if not found creates and returns with a new one.

```cs
var session = SessionHelper.Get("broker.emqx.io", "My client ID");
Debug.Log(session.ClientId);
```

![Session Custom Client Id](media/session_custom_client_id.png)

!!! Warning "A client ID must be unique across the connecting clients and the same client should use the same ID for consecutive connections!"

## How to use a session

```cs
private ConnectPacketBuilder ConnectPacketBuilderCallback(MQTTClient client, ConnectPacketBuilder builder)
{
    var session = SessionHelper.Get(client.Options.Host);
    return builder.WithSession(session);
}
```

## Null Sessions

To let the server assign an ID to the client, we can create and connect with a null session. 
In case of a null session the client will not generate and send an ID, instead expects one from the server. 
When the client ID is received from the server, the plugin will create a real session.

```cs
private ConnectPacketBuilder ConnectPacketBuilderCallback(MQTTClient client, ConnectPacketBuilder builder)
{
    var host = client.Options.Host;

    if (!SessionHelper.HasAny(host))
    {
        Debug.Log("Creating null session!");
        builder = builder.WithSession(SessionHelper.CreateNullSession(host));
    }
    else
        Debug.Log("A session already present for this host.");

    return builder;
}

private void OnConnected(MQTTClient client)
{
    Debug.Log(SessionHelper.Get(client.Options.Host).ClientId);

    // ...
}
```

`SessionHelper.HasAny` returns `true` if there's any session for the given host.

If this is the first time the client connects to the host, it produces an output like this:

![Null Session Highlightedd](media/null_session_highlighted.png)

Running the script again will skip creating a new null session and will use the one created in the previous run.

![Null Session Next Run Highlighted](media/null_session_next_run_highlighted.png)

The client used the same client ID (`auto-8AEAD08D-CDA0-E6D6-50FC-3F7CE810BA71`) that received from the server previously.