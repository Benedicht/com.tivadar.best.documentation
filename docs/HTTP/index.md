# Best HTTP documentation

Welcome to the Best HTTP Documentation! Best HTTP is a comprehensive networking library for Unity that empowers developers to make HTTP and HTTPS requests with ease. 
Whether you're building web applications, multiplayer games, or real-time communication solutions, Best HTTP has got you covered.

## Overview
In today's digital era, efficient and reliable web communication forms the backbone of many applications. 
Whether you're fetching data from remote servers, sending game scores, or updating user profiles, HTTP requests are indispensable. 
Recognizing the multifaceted needs of Unity developers, Best HTTP is designed to simplify these interactions, providing a streamlined and efficient means to handle web-based communication.

## Key Features
- **Supported Unity Versions**: Best HTTP is compatible with Unity versions starting from :fontawesome-brands-unity: **2021.3 onwards**.
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

## Documentation Sections

Explore the following sections to learn how to harness the power of Best HTTP in your Unity projects:

- [Installation Guide](installation.md): Get started with Best HTTP by installing the package and configuring your project.
- [Upgrade Guide](upgrade-guide.md): If you're transitioning from Best HTTP/2, this guide provides vital information on changes, improvements, and steps to upgrade seamlessly to the latest version.
- [Getting Started](getting-started\index.md): Dive into the basics of making HTTP requests, handling responses, and configuring Best HTTP for your needs.
- [Intermediate Topics](intermediate-topics\index.md): Take your skills to the next level with advanced topics, such as authentication, caching, upload/download streaming, and many more.
<!-- - [API Reference](api-reference\index.md): Discover the details of Best HTTP's classes, methods, and properties in the comprehensive API reference. -->

Whether you're a seasoned developer or just getting started with Unity, this documentation will guide you through the process of leveraging Best HTTP's capabilities to create efficient, feature-rich applications.

Let's get started with Best HTTP and elevate your Unity projects to new heights of networking excellence!