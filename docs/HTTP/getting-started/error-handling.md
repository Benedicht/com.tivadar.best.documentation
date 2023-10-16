---
comments: true
---

# Error Handling

Error handling is crucial for a well-functioning application. 
By providing as much detail as possible implementor applications can decide how to react and handle different error cases and can log them for future processing to improve their service.
To support these scenarios the plugin doesn't just let the upper layers that *something happened*, but indicates the type of issue through its `State` and `Exception` property.

## Request States

The first three values of the `HTTPRequestStates` enum is for internal use, what's interesting for clients is allocated in the second half:

- **Finished:** A request completes with a `Finished` state if it can succesfully obtain the whole, final response. 

    !!! warning "The response still can contain unexpected status code (4xx, 5xx), it's advised to check the response's status code before processing the content!"

- **Error:** A request completes with an `Error` state if it encounters any unrecoverable error while it tries to connect to the server or during receiving the response. 
The possible causes of this state is very broad, but I list a few common cases for reference:

    - Unreachable internet
    - Any connection error during processing
    - The server denies connecting to the specified port
    - DNS can't resolve the IP address of the specified host
    - Failed TLS negotiation

    The `Exception` property of the request is populated only in this case of states, it contains the reference to the exception encountered and couldn't recover from.
    !!! note "Please note that information in the Exception property is only there to help further debugging, it shouldn't be displayed to the user!"    

- **Aborted:** A request completes with an `Aborted` state if the `Abort()` function is called on the request.
- **ConnectionTimedOut:** A request completes with an `ConnectionTimedOut` state when a connect timeout is set and it's overdue.
- **TimedOut:** A request completes with an `TimedOut` state when a request timeout is set and it's overdue.