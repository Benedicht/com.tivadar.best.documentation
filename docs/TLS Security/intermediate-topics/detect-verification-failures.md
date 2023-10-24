---
comments: true
---

# How To Detect Verification Failures

If certification verification fails, the connection going to be terminated and the `HTTPReqest`'s `State` will be set as `HTTPRequestStates.Error`.
The request's Exception property is a reference to an exception containing more information about the issue:

```cs hl_lines="14-16"
void OnRequestFinished(HTTPRequest req, HTTPResponse resp)
{
    switch (req.State)
    {
        // The request finished without any problem.
        case HTTPRequestStates.Finished:
            Debug.Log("Done!");
            break;

        // The request finished with an unexpected error. The request's Exception property may contain more info about the error.
        case HTTPRequestStates.Error:
            Debug.LogError("Request Finished with Error! " + (req.Exception != null ? (req.Exception.Message + "\n" + req.Exception.StackTrace) : "No Exception"));

            TlsFatalAlert tlsException = req.Exception as TlsFatalAlert;
            if (tlsException != null)
                Debug.LogException(tlsException);
            break;

        default:
            Debug.LogError("Processing the request failed!");
            break;
    }
}
```

For a failed TLS verification, it should produce two log lines, something like this:

![TLS Error Log Entries](media/TLSErrorLogEntries.png)