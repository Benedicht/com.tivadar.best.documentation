# Retry

!!! Note "Best SignalR, by default, uses [0, 2, 10, 30] seconds of delays before giving up and considering the SignalR hub connection as failed."

## Automatic reconnection and the IRetryPolicy interface

```cs
/// <summary>
/// Defines a contract for implementing retry policies in case of connection failures.
/// </summary>
public interface IRetryPolicy
{
    /// <summary>
    /// This function must return with a delay time to wait until a new connection attempt, or null to do not do another one.
    /// </summary>
    TimeSpan? GetNextRetryDelay(RetryContext context);
}
```

`GetNextRetryDelay` receives a `RetryContext` object as a parameter and must return a `TimeSpan` indicating a delay between the next reconnect attempt, or null to do not try to do further attempts and report the connection broken.

## RetryContext

`RetryContext` has the following fields:

- **PreviousRetryCount**: Previous reconnect attempts. A successful connection sets it back to zero.
- **ElapsedTime**: Elapsed time since the original connection error.
- **RetryReason**: String representation of the connection error.

When called, `GetNextRetryDelay` always receives an up to date `RetryContext`.

## Default implementation

The default `IRetryPolicy` implementation that the plugin uses by default looks like this:
```cs title="The Default Retry Policy"
public sealed class DefaultRetryPolicy : IRetryPolicy
{
    private static TimeSpan?[] DefaultBackoffTimes = new TimeSpan?[]
    {
        TimeSpan.Zero,
        TimeSpan.FromSeconds(2),
        TimeSpan.FromSeconds(10),
        TimeSpan.FromSeconds(30),
        null
    };

    TimeSpan?[] backoffTimes;

    public DefaultRetryPolicy()
    {
        this.backoffTimes = DefaultBackoffTimes;
    }

    public DefaultRetryPolicy(TimeSpan?[] customBackoffTimes)
    {
        this.backoffTimes = customBackoffTimes;
    }

    public TimeSpan? GetNextRetryDelay(RetryContext context)
    {
        if (this.backoffTimes == null || context.PreviousRetryCount >= this.backoffTimes.Length)
            return null;

        return this.backoffTimes[context.PreviousRetryCount];
    }
}
```

To use it, an instance must be set to the HubConnection's `ReconnectPolicy` property:
!!! Example
    ```cs
    hub = new HubConnection(new Uri("..."), new JsonProtocol(new LitJsonEncoder()), options);
    hub.ReconnectPolicy = new DefaultRetryPolicy();
    ```

    Or with custom backoff times:
    ```cs
    hub = new HubConnection(new Uri(base.sampleSelector.BaseURL + this._path), new JsonProtocol(new LitJsonEncoder()), options);

    hub.ReconnectPolicy = new DefaultRetryPolicy(new TimeSpan?[] {
        TimeSpan.FromSeconds(5),
        TimeSpan.FromSeconds(15),
        TimeSpan.FromSeconds(45),
        TimeSpan.FromSeconds(90),
        null
    });
    ```