# Best HTTP documentation

Welcome to the Best HTTP Documentation! Best HTTP is a comprehensive networking library for Unity that empowers developers to make HTTP and HTTPS requests with ease. 
Whether you're building web applications, multiplayer games, or real-time communication solutions, Best HTTP has got you covered.

[Buy Now on :fontawesome-brands-unity: Asset Store](#){ .md-button .md-button--primary }

## Overview
In today's digital era, efficient and reliable web communication forms the backbone of many applications. 
Whether you're fetching data from remote servers, sending game scores, or updating user profiles, HTTP requests are indispensable. 
Recognizing the multifaceted needs of Unity developers, Best HTTP is designed to simplify these interactions, providing a streamlined and efficient means to handle web-based communication.

## Key Features
- **Supported Unity Versions**: Best HTTP is compatible with Unity versions starting from :fontawesome-brands-unity: **2021.1 onwards**.
- **Cross-Platform:** Best HTTP is designed to work seamlessly across a diverse range of Unity platforms, ensuring versatility for all your development needs. Specifically, it supports:
    - :fontawesome-solid-desktop: **Desktop**: Windows, Linux, MacOS
    - :fontawesome-solid-mobile: **Mobile**: iOS, Android
    - :material-microsoft-windows: **Universal Windows Platform** (UWP)
    - :material-web: **Web Browsers**: WebGL

	This broad platform support means you can confidently use Best HTTP, regardless of your target audience or deployment strategy.

- **Versatile Request Outcome Handling**: Best HTTP ensures flexibility in managing network request outcomes to seamlessly fit within your development style and the varied structures of different applications:
    - **Traditional Callbacks:** Adopt the classic approach with regular C# callbacks. Ideal for those who prefer traditional programming patterns, allowing for simple and straightforward handling of responses.
    - **Unity Coroutines:** For those who are deeply integrated with Unity's workflow, Best HTTP provides native support for Unity's coroutines. This facilitates non-blocking operations while keeping the code structure clean and readable, particularly when sequencing multiple network requests.
    - **Async-Await Pattern:** Embrace the modern C# asynchronous programming paradigm with the async-await pattern. Best HTTP's support for this ensures that developers can write non-blocking code in a linear fashion, greatly simplifying error handling and state management for asynchronous operations.
    
    With these diverse options for request outcome handling, developers can choose the best approach that aligns with their project requirements and personal coding preferences.

- **Universal Compatibility with No Special Server Setup**: Best HTTP is designed to seamlessly integrate into any environment. 
Whether you're working with legacy systems or the latest server technologies, Best HTTP ensures smooth communication and operation. 
You don't need to worry about specific server configurations or additional setup procedures; it's built to be universally compatible. 
With Best HTTP, you gain the freedom to focus on your application's functionality, knowing that the underlying HTTP communications will work consistently across all server solutions.
- **HTTP/HTTPS Support**: Best HTTP supports both HTTP and HTTPS protocols, ensuring secure communication for your applications.
- **HTTP/2 Support**: Benefit from the advantages of HTTP/2, including faster loading times, reduced latency and **trailing headers** for advanced scenarios like **GRPC**.
- **Caching**: Implement efficient caching mechanisms to reduce redundant network requests, optimizing your application's performance and data usage.
- **Authentication**: Easily handle various authentication methods, such as Basic, Digest, and Bearer token authentication.
- **Cookie Management**: Manage cookies effortlessly, ensuring smooth user experiences in web applications.
- **Compression**: Compress and decompress data using gzip and deflate algorithms to save bandwidth and improve loading times.
- **Streaming**: Best HTTP supports streaming for both downloads and uploads. This enables you to stream large files and responses directly to storage when downloading, and stream data from storage when uploading, effectively avoiding memory bottlenecks.
- **Customization**: Tailor your HTTP requests with customizable headers, timeouts, and other parameters to meet your specific needs.
- **Built-In Profiler Support**: Best HTTP now comes with a built-in profiler, ensuring developers have direct access to critical insights without the need for external tools. 
This enhancement is instrumental in understanding the performance and network behavior of your application, thereby facilitating optimization and debugging. Key features of the built-in profiler include:
	- **Memory Profiler:** Dive into the library's internal memory usage. This tool is invaluable for ensuring optimal memory management and for identifying potential bottlenecks or leaks.
	- **Network Profiler:** This profiler allows for a granular analysis of your network operations. Notable features include:
		- **Byte Tracking:** Monitor the bytes sent and received between two frames, providing a clear overview of data transfers and insight into traffic patterns.
		- **Connection Analysis:** Stay informed on the total number of open and closed connections. This data gives a transparent view of your app's network activity.
		- **DNS Cache Profiling:** With this feature, you can track DNS cache hits and misses, aiding in the fine-tuning of DNS cache strategies and understanding potential network resolution delays.

		With the integration of this built-in profiler support, developers can not only ensure that their application's network activities are optimized but also make data-driven decisions that enhance both performance and user experience.
- **Debugging and Logging:** Comprehensive logging options enable developers to get insights into the workings of the package and simplify the debugging process.

[Buy Now on :fontawesome-brands-unity: Asset Store](#){ .md-button .md-button--primary }

## Best HTTP vs. UnityWebRequest: A Feature Matrix Comparison

When choosing a networking solution for your Unity projects, it's essential to have a clear understanding of how different tools compare.
While Best HTTP offers a comprehensive feature set tailored for various networking needs, you might be wondering how it stands up against Unity's built-in UnityWebRequest. 
To aid in your decision-making process, I've prepared a feature matrix that compares the capabilities of both tools:

| Feature                                   | Best HTTP                                           | [UnityWebRequest](https://docs.unity3d.com/ScriptReference/Networking.UnityWebRequest.html)                   |
|-------------------------------------------|-----------------------------------------------------|----------------------------------|
|**Basic HTTP Requests**               |:material-checkbox-marked-circle: Supports [GET, POST, PUT, DELETE, HEAD, PATCH, MERGE, OPTIONS, QUERY](api-reference/HTTP/HTTPMethods.md) | :material-checkbox-marked-circle: Supports GET, HEAD, POST, PUT, DELETE|
|**HTTPS Support**                     |:material-checkbox-marked-circle:{ .green } Supports different TLS backends on a per-host basis | :material-checkbox-marked-circle: Basic SSL/TLS support                |
|**Custom Headers**                    |:material-checkbox-marked-circle: Can add custom headers                            | :material-checkbox-marked-circle: Can add custom headers         |
|**Timeout Handling**                  |:material-checkbox-marked-circle:{ .green } Supports both connect & request timeouts          | :material-checkbox-marked-circle: Supports request timeouts      |
|**Progress Reporting**                |:material-checkbox-marked-circle: Provides both [download](getting-started/downloads.md#progress-tracking) and [upload](getting-started/uploads.md#progress-tracking) progress updates | :material-checkbox-marked-circle: Provides progress updates      |
|**Multi-threading & Concurrency**     |:material-checkbox-marked-circle: Can handle multiple requests concurrently         | :material-checkbox-marked-circle: Can handle multiple requests concurrently|
|**HTTP/2 Support**                    |:material-checkbox-marked-circle:{ .green } Supported with options for customizations         | :material-checkbox-marked-circle: (Depending on Unity version)   |
|**Connection Pooling**                |:material-checkbox-marked-circle:{ .green } Supported for both [HTTP/1 and HTTP/2 connections](../Shared/connections/pooling.md)  | Unknown                        |
|**DNS Caching**                       |:material-checkbox-marked-circle:{ .green } Supported [with prefetching](../Shared/DNS/dns-cache.md) capabilities | :material-minus-box:{ .red } Not Supported |
|**Download Handling**                 |:material-checkbox-marked-circle:{ .green } Supports [streaming with buffer control](getting-started/downloads.md) for memory-efficient downloads             | :material-checkbox-marked-circle: Basic streaming support        |
|**Upload Handling**                   |:material-checkbox-marked-circle:{ .green } Advanced control over [upload streams](getting-started/uploads.md)              | :material-checkbox-marked-circle: Supports basic upload handlers       |
|**Caching**                           |:material-checkbox-marked-circle:{ .green } [Advanced caching](intermediate-topics/caching-internals.md) options                          | :material-checkbox-marked-circle: Only AssetBundles           |
|**Custom Protocols**                  |:material-checkbox-marked-circle:{ .green } Supports protocol upgrades (like WebSocket)        | :material-minus-box:{ .red } Not supported              |
|**Response Handling**                 |:material-checkbox-marked-circle:{ .green } Advanced response processing with support for auth. challanges, trailing headers, etc.                     | :material-checkbox-marked-circle: Basic response processing      |
|**Blocking Mechanisms**               |:material-checkbox-marked-circle:{ .green } Supports [blocking streams for threaded processing](getting-started/downloads.md#streaming-with-blocking) | :material-minus-box: No built-in support            |
|**Access downloaded data as a Stream**|:material-checkbox-marked-circle:{ .green } Built-in support | :material-minus-box:{ .red } No built-in support |
|**Cookie Handling**                   |:material-checkbox-marked-circle:{ .green } Advanced [cookie management](getting-started/cookies.md) | :material-checkbox-marked-circle: Basic cookie support           |
|**Authentication**                    |:material-checkbox-marked-circle:{ .green } Supports [multiple authentication methods](getting-started/authentication.md) | :material-checkbox-marked-circle: No direct support              |
|**Proxy Handling**                    |:material-checkbox-marked-circle:{ .green } Advanced proxy settings and authentication | :material-checkbox-marked-circle: Basic proxy support            |
|**Auto Redirect Handling**            |:material-checkbox-marked-circle:{ .green } Supports automatic redirections with behavior change | :material-checkbox-marked-circle: Supports automatic redirections|
|**Platform Support**                  |:material-checkbox-marked-circle: Desktop and mobile platforms + WebGL | :material-checkbox-marked-circle:{ .green } Unity's platform support       |
|**Exception Handling**                |:material-checkbox-marked-circle:{ .green } Detailed [exception handling and reporting](getting-started/error-handling.md) | :material-checkbox-marked-circle: Basic error reporting         |
|**Extensions & Plugins**              |:material-checkbox-marked-circle:{ .green } Supports adding extensions and plugins | Limited or requires additional packages|
|**MovieTexture, AudioClip**           |:material-minus-box:{ .red } No support | :material-checkbox-marked-circle: Supported                      |
|**Source Code**                       |:material-checkbox-marked-circle:{ .green } Included | :material-minus-box: Isn't available               |
|**Supported programming models**      |:material-checkbox-marked-circle:{ .green } [Callbacks](getting-started/index.md#callbacks), [coroutines](getting-started/index.md#unity-coroutines), [async-await](getting-started/index.md#async-await) | :material-checkbox-marked-circle: Coroutines
|**Debugging Capabilities**            |:material-checkbox-marked-circle:{ .green } Structured diagnostic [logging](../Shared/logging/index.md)    | :material-minus-box:{ .red } Not supported |

By juxtaposing Best HTTP with UnityWebRequest, it's evident that Best HTTP is designed to offer superior flexibility, extensive features, and refined controls to cater to the diverse needs of Unity developers. Whether you're looking for advanced request handling, native WebSocket support, or in-depth profiling capabilities, Best HTTP is equipped to elevate your networking tasks to the next level.

Is the feature matrix missing something? [Let me know!](../Shared/support.md)

[Buy Now on :fontawesome-brands-unity: Asset Store](#){ .md-button .md-button--primary }

## Documentation Sections

Explore the following sections to learn how to harness the power of Best HTTP in your Unity projects:

- [Installation Guide](installation.md): Get started with Best HTTP by installing the package and configuring your project.
- [Upgrade Guide](upgrade-guide.md): If you're transitioning from Best HTTP/2, this guide provides vital information on changes, improvements, and steps to upgrade seamlessly to the latest version.
- [Getting Started](getting-started\index.md): Dive into the basics of making HTTP requests, handling responses, and configuring Best HTTP for your needs.
- [Intermediate Topics](intermediate-topics\index.md): Take your skills to the next level with advanced topics, such as authentication, caching, upload/download streaming, and many more.

Whether you're a seasoned developer or just getting started with Unity, this documentation will guide you through the process of leveraging Best HTTP's capabilities to create efficient, feature-rich applications.

Let's get started with Best HTTP and elevate your Unity projects to new heights of networking excellence!