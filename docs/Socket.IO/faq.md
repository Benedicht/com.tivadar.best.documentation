---
comments: true
---

# Frequently Asked Questions

## Q: **Whitch platforms are supported?**

**A:** All major platforms are officially supported, specifically:

- **Desktop**: Windows, Linux, MacOS
- **Mobile**: iOS, Android
- **Universal Windows Platform** (UWP)
- **Web**: WebGL
- Furthermore, user reports suggest that Best Socket.IO also functions on the following platforms. However, due to the lack of testing capabilities, official support for these platforms is not provided:
	- :fontawesome-brands-xbox: Xbox
	- :fontawesome-brands-playstation: PlayStation
	- :simple-nintendoswitch: Nintendo Switch
	
	Please note that while there is evidence of compatibility with these platforms, I'm unable to offer official support or guarantee full functionality due to testing limitations.

## Q: **What is the supported Socket.IO version?**

**A:** Best Socket.IO supports the latest version of Socket.IO: **v4.x** (Socket.IO protocol v5).

Below is a compatibility table for your reference, which includes compatibility with the Python based implementation, [Flask-SocketIO](https://flask-socketio.readthedocs.io/en/latest/index.html) too:

| JavaScript Socket.IO version | Socket.IO protocol revision | Engine.IO protocol revision | Flask-SocketIO version | python-socketio version | python-engineio version |
|:----------------------------:|:---------------------------:|:---------------------------:|:----------------------:|:-----------------------:|:-----------------------:|
| 4.x | 5 | 4 | 5.x | 5.x| 4.x |

## Q: **What's the license of the plugin?**

**A:** The Best Socket.IO plugin is licensed under the Unity Asset Store End User License Agreement (EULA). This means that your use, distribution, and modification of the plugin are governed by the terms and conditions set forth in the Asset Store EULA. For a detailed understanding of your rights and obligations under this license, please refer to the full [Asset Store EULA text](https://unity.com/legal/as-terms)[^1].

If you have specific licensing questions or concerns related to the Best Socket.IO plugin, please don't hesitate to reach out to our support.

[^1]: The EULA itself can be found under Appendix 1

## Q: **My Socket.IO servers are behind a load balancer (AWS ALB). How can I setup the asset to send the required cookies (AWSALB)?**

**A:** The plugin handles necessary cookie management, so there's no need to set the cookies directly for every request. However, when built for the web (WebGL), cookies are managed by the underlying browser, and requests must be created by setting their `withCredentials` flag to true:

```cs
var options = new SocketOptions();
#if UNITY_WEBGL && !UNITY_EDITOR
options.HTTPRequestCustomizationCallback = (man, req) => req.WithCredentials = true;
#endif

var manager = new SocketManager(new Uri("https://myserver"), options);
```