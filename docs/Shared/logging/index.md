---
comments: true
---

# Logging

Logging is a critical component of any system or library. 
It provides visibility into the internal workings of a process and can be invaluable when diagnosing issues, understanding flow, or enhancing the performance of a system. 
In the context of the Best HTTP library and all protocols depending on it, logging can provide insights into requests, responses, errors, what and how failed; and other related events.

## Changing Verbosity
Verbosity determines the amount and detail of the logs. 
Depending on the verbosity level set, you might get logs ranging from high-level events to detailed debugging information.

To change the verbosity in the Best HTTP library:

```cs
using Best.HTTP.Shared;
using Best.HTTP.Shared.Logger;

// Set to desired level, diagnostic level in this case
HTTPManager.Logger.Level = Loglevels.All;
```

Available log levels:

- `Loglevels.None`: No logs.
- `Loglevels.Error`: Only error messages.
- `Loglevels.Warning`: Error and warning messages.
- `Loglevels.Information`: Error, warning, and informational messages.
- `Loglevels.All`: All messages including detailed diagnostic logs.

## Unity and File Outputs
### Unity Output:

By default, logs from the Best HTTP library are written to Unity's console.
You can view these logs in Unity's console window, making it easy to diagnose and troubleshoot issues during development.

If you set the Output to another one, you can switch back to default this way:
```cs
HTTPManager.Logger.Output = new UnityOutput();
```

### File Output:

If you wish to redirect these logs to a file for easier parsing, filtering, or for archiving purposes, you can do so:

```cs
HTTPManager.Logger.Output = new FileOutput("path_to_log_file.log");
```

Remember to replace "path_to_log_file.log" with your desired file path.