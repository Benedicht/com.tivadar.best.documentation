---
title: Certification Manager Window
comments: true
---

## Certification Manager Window

The *Window/Best TLS Security/Certification Window* menu item (or CTRL+ALT+E shortcut) opens the addon's Certification Manager. Using this window certificates can be added, updated and deleted.

![Certification Manager Window](media/CertificationManager.png){ loading=lazy }

1. trusted-root-cas
2. trusted-intermediate-certificates
3. client-certificates
4. #testing-http-requests
5. #bottom-toolbar

## Testing HTTP Requests

A basic GET request can be sent out for the given domain to test the current setup.

![Intermediate Certificates](media/TestRequest.png){ loading=lazy }
	
1. Input field for the domain to test
2. Send button
3. Result of the request

!!! Warning "Because of [Connection Pooling](../../../Shared/connections/pooling.md) a request that otherwise would fail can succeed if there's an already open connection to the domain!"

## Bottom Toolbar

![Intermediate Certificates](media/BottomBar.png){ loading=lazy }

1. Name and version number of this addon
