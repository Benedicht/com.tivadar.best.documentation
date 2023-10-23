---
comments: true
---

# Upgrade Guide

This guide is designed to help users seamlessly transition from **Best HTTP/2** to the new major release (v3.x).
If you're updating your package, please read through the relevant sections to ensure a smooth upgrade.

## Pre-upgrade Checklist
- [x] **Backup Your Project:** Always create a backup of your entire project before starting the upgrade process. This allows you to revert changes if something goes awry.
- [x] **Review Deprecated Features:** Check if you're using any features or methods that were marked as deprecated in the last release. Transition away from these first.

## Post-upgrade Steps
- [x] **Update API Calls:** If the new version introduced new methods or altered existing ones, update your calls accordingly.
- [x] **Test Extensively:** After upgrading, test all functionalities in your project that utilize the Best WebSockets package to ensure they work as expected.

## ^^List of Breaking Changes^^

I have worked hard to enhance features, fix issues, and introduce new capabilities - here's what you need to know:

### 1. Namespace changes

Instead of one big package the new version is split into multiple packages. This packaging change is reflected in how the plugins' namespaces are named. 
WebSockets got its own namespace `Best.WebSockets`, upgrading namespace usings can be done by replacing `BestHTTP.WebSocket` to `Best.WebSockets`.

??? Example
    === "BestHTTP"
        `#!cs new BestHTTP.WebSocket.WebSocket(new Uri(address));`
    === "Best.WebSockets"
        `#!cs new Best.WebSockets.WebSocket(new Uri(address));`

### 2. Renamed StartPingThread property

The `StartPingThread` property's naming doesn't reflected its behavior, it isn't starts a new thread. 

??? Example
    === "BestHTTP"
        ```cs
        var ws = new BestHTTP.WebSocket.WebSocket(new Uri(address));
        ws.StartPingThread = true;
        ```
    === "Best WebSockets"
        ```cs
        var ws = new Best.WebSockets.WebSocket(new Uri(address));
        ws.StartPingThread = true;
        ```

### 3. Merged OnError and OnClosed events

Two handlers for similiar events was a common source of confusion among users. 
Now the WebSocket class has only an `OnClosed` event and its code parameter indicates whether it was an error or not.

Additionally `OnClosed`'s `code` parameters is now a [WebSocketStatusCodes](api-reference/WebSockets/WebSocketStatusCodes.md) enum.

??? Example
    === "BestHTTP"
        ```cs
        var ws = new BestHTTP.WebSocket.WebSocket(new Uri(address));
        ws.OnError += OnError;
        ws.OnClosed += OnClosed;

        void OnError(WebSocket.WebSocket ws, string error)
        {
            // Error
        }

        void OnClosed(WebSocket.WebSocket ws, UInt16 code, string message)
        {
            // Normal closure
        }
        ```
    === "Best Websockets"
        ```cs
        var ws = new Best.WebSockets.WebSocket(new Uri(address));
        ws.OnClosed += OnClosed;

        void OnClosed(WebSocket ws, WebSocketStatusCodes code, string message)
        {
            if (code == WebSocketStatusCodes.NormalClosure)
            {
                // Normal closure
            }
            else
            {
                // Error
            }
        }
        ```

### 4. OnBinaryNoAlloc & OnBinary event changes

The `OnBinary` event receives a `BufferSegment` containing information about the received binary data. 
The received segment must be processed in the `OnBinary` event handler because after the call it's released back the the BufferPool, or copied into a new buffer.

??? Example
    === "BestHTTP"
        ```cs
        var ws = new BestHTTP.WebSocket.WebSocket(new Uri(address));
        ws.OnBinary += OnBinary;

        void OnBinary(WebSocket.WebSocket webSocket, byte[] data)
        {
            // ...
        }
        ```
    === "Best WebSockets"
        ```cs
        var ws = new Best.WebSockets.WebSocket(new Uri(address));
        ws.OnBinary += OnBinary;

        void OnBinary(WebSocket webSocket, BufferSegment data)
        {
            // process data, or make a copy for later use:
            var buffer = new byte[data.count);
            data.CopyTo(buffer);
        }
        ```

`OnBinaryNoAlloc` event is removed, use `OnBinary` instead.

## General Tips

1. **Stay Updated on Documentation:** Keep an eye on the official documentation for the Best WebSockets package. 
It's regularly updated with new information, tutorials, and solutions to common problems.
2. **Engage with the Community:** Join discussions on our [Community and Support page](../Shared/support.md) to share your experiences, ask questions, and get advice on the upgrade process.
3. **Check for Updates Regularly:** Ensure you always have the latest features, improvements, and bug fixes by regularly checking for updates.
