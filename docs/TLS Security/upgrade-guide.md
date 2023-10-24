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
- [x] **Test Extensively:** After upgrading, test all functionalities in your project that utilize the Best TLS Security package to ensure they work as expected.

## ^^List of Breaking Changes^^

I have worked hard to enhance features, fix issues, and introduce new capabilities - here's what you need to know:

### 1. Namespace changes

Instead of one big package the new version is split into multiple packages. This packaging change is reflected in how the plugins' namespaces are named. 
TLS Security got its own namespace `Best.MQTT`, upgrading namespace usings can be done by replacing `BestMQTT` to `Best.MQTT`.

??? Example
    === "BestHTTP/2"
        ```cs 
        using BestHTTP.Addons.TLSSecurity;

        TLSSecurity.Setup();
        ```
    === "Best.MQTT"
        ```cs 
        using Best.TLSSecurity;

        TLSSecurity.Setup();
        ```

## General Tips

1. **Stay Updated on Documentation:** Keep an eye on the official documentation for the Best MQTT package. 
It's regularly updated with new information, tutorials, and solutions to common problems.
2. **Engage with the Community:** Join discussions on our [Community and Support page](../Shared/support.md) to share your experiences, ask questions, and get advice on the upgrade process.
3. **Check for Updates Regularly:** Ensure you always have the latest features, improvements, and bug fixes by regularly checking for updates.
