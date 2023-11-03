---
comments: true
---

# Per-Host Settings

The [HostSettingsManager](../../HTTP/api-reference/Settings/HostSettingsManager.md) class in the `Best.HTTP.Hosts.Settings` namespace is a comprehensive solution for managing host-specific settings for HTTP requests. 
This guide will help you grasp its functionality, understand its relevance, and employ it efficiently in your applications.
It can be accessed via [HTTPManager.PerHostSettings](../../HTTP/api-reference/Shared/HTTPManager.md).

## What Does It Do?
The HostSettingsManager allows you to fine-tune HTTP request and connection behaviors based on the hostname. 
This can be beneficial when interacting with multiple endpoints, each requiring its unique set of configurations.

## Key Features
- **Host-Specific Settings:** Enables custom configurations for specific hostnames.
- **Fallback Configuration:** If a specific hostname configuration is not found, a default configuration (`*`) is used.
- **Subdomain Matching:** Supports wildcard (`*`) notation for matching subdomains. E.g., `*.example.com` matches `a.example.com` and `a.b.example.com` but not `example.com`.

## Why Use It?

- **Granular Control:** In large-scale applications, different servers or services might need unique connection settings. Instead of using a one-size-fits-all configuration, HostSettingsManager allows you to specify settings per hostname.
- **Efficient Resource Utilization:** For instance, by disabling connection pooling or HTTP/2 for particular services, you can ensure optimal resource utilization and performance.
- **Simplified Management:** HostSettingsManager offers a structured way to manage host-specific settings, making it easier to maintain and modify configurations as your application scales.

## How to Use It

### Initializing

The manager instance is accessible through [HTTPManager.PerHostSettings](../../HTTP/api-reference/Shared/HTTPManager.md) with default settings for the root/fallback/default configuration (`*`).

There are multiple ways to add new configurations, but the most straightforward is to use [AddDefault](../../HTTP/api-reference/Settings/HostSettingsManager.md#adddefault) and alter its fields:
```cs
var settings = HTTPManager.PerHostSettings.AddDefault("example.com");
settings.RequestSettings.RequestTimeout = TimeSpan.FromSeconds(20);
```

Now all requests sent to `example.com` will use a 20 seconds request timeout.

!!! warning
    Adding or modifying settings isn't thread-safe, initialize them before any other plugin related call!

### How To Retrieve Settings for a Host

```cs
var settings = HTTPManager.PerHostSettings.Get("example.com");
```

If settings for the specified hostname aren't found, the manager will return the default settings associated with '`*`'.

### Modifying Global Settings
For example, to turn off connection pooling and HTTP/2 for global settings:

```cs
var globalSettings = HTTPManager.PerHostSettings.Get("*");
globalSettings.HTTP1ConnectionSettings.TryToReuseConnections = false;
globalSettings.HTTP2ConnectionSettings.EnableHTTP2Connections = false;
```

### Adding Settings for Multiple Hosts
You can easily add settings for multiple hosts. By default, both connection pooling and HTTP/2 are enabled:

```cs
HTTPManager.PerHostSettings.Add(host_1, new HostSettings());
HTTPManager.PerHostSettings.Add(host_2, new HostSettings());
```

### Clearing All Settings
To remove all configurations and reset the default call `Clear()`:

```cs
HTTPManager.PerHostSettings.Clear();
```

Clear keeps the fallback configuration (`*`), but resets its settings back to default.