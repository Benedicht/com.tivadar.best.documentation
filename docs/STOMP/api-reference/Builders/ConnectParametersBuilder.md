---
comments: true
---
# ConnectParametersBuilder

Provides a builder for creating and configuring [ConnectParameters](../STOMP/ConnectParameters.md). 


## **Methods**:

### [ConnectParametersBuilder]() WithHost([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Sets the host name for the connection. 

### [ConnectParametersBuilder]() WithHost([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32))
: Sets the host name and port number for the connection. 

### [ConnectParametersBuilder]() WithPort([Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32))
: Sets the port number for the connection. 

### [ConnectParametersBuilder]() WithTLS([Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean))
: Enables the use of TLS for the connection to open a secure communication channel between the client and broker. 

### [ConnectParametersBuilder]() WithTransport([SupportedTransports](../STOMP/SupportedTransports.md))
: Sets the transport protocol for the connection. 

### [ConnectParametersBuilder]() WithPath([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Sets the path for WebSocket connections. 

### [ConnectParametersBuilder]() WithVirtualHost([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Sets the virtual host for the connection. 

### [ConnectParametersBuilder]() WithCredentials([Credentials](../../../HTTP/api-reference/Authentication/Credentials.md))
: Sets the credentials for authentication with the broker. 

### [ConnectParametersBuilder]() WithHeartBeat([TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan), [TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan), [TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan))
: Sets the heartbeat preferences for the connection. 

### [ConnectParametersBuilder]() WithHeader([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Adds a custom header to the connection parameters. 

### [ConnectParameters](../STOMP/ConnectParameters.md) Build()
: Builds and returns the configured [ConnectParameters](../STOMP/ConnectParameters.md) instance. 