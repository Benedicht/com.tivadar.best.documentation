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
- [x] **Test Extensively:** After upgrading, test all functionalities in your project that utilize the Best SSE package to ensure they work as expected.

## ^^List of Breaking Changes^^

I have worked hard to enhance features, fix issues, and introduce new capabilities - here's what you need to know:

### Namespace changes

Instead of one big package the new version is split into multiple packages. This packaging change is reflected in how the plugins' namespaces are named. 
Server-Sent Events got its own namespace `Best.ServerSentEvents`, upgrading namespace usings can be done by replacing `BestHTTP.ServerSentEvents` to `Best.ServerSentEvents`.

!!! Example
    === "BestHTTP"
        `#!cs var manager = eventSource = new BestHTTP.ServerSentEvents.EventSource(new Uri("https://server/sse"));`
    === "Best.ServerSentEvents"
        `#!cs var manager = eventSource = new Best.ServerSentEvents.EventSource(new Uri("https://server/sse"));`

### API Changes

Removed the constructor's second, optional parameter. It was introduced as a workaround that doesn't need anymore.

!!! Example
    === "BestHTTP"
        `#!cs var manager = eventSource = new BestHTTP.ServerSentEvents.EventSource(new Uri("https://server/sse"), 256);`
    === "Best.ServerSentEvents"
        `#!cs var manager = eventSource = new Best.ServerSentEvents.EventSource(new Uri("https://server/sse"));`

### Request customization changes

If you had any request customization using `EventSource`'s `InternalRequest`, you might want to browse through the [Best HTTP Upgrade Guide](../HTTP/upgrade-guide.md) too.

Simple changes, major upgrades. You're now on the latest version!

## General Tips

1. **Stay Updated on Documentation:** Keep an eye on the official documentation for the Best Server-Sent Events package. 
It's regularly updated with new information, tutorials, and solutions to common problems.
2. **Engage with the Community:** Join discussions on our [Community and Support page](../Shared/support.md) to share your experiences, ask questions, and get advice on the upgrade process.
3. **Check for Updates Regularly:** Ensure you always have the latest features, improvements, and bug fixes by regularly checking for updates.
