---
title: TLS Security
comments: true
---

## Setup

After importing the package call `#!cs TLSSecurity.Setup();` somewhere in your startup code:

```cs
/* (1)! */
#if !UNITY_WEBGL || UNITY_EDITOR
using BestHTTP.Addons.TLSSecurity;

TLSSecurity.Setup();
#endif
```

1. Under WebGL BestHTTP/2 must use the underlying browser's `XmlHTTPRequest` implementation, all TLS verification is done by the browser.

Calling `#!cs TLSSecurity.Setup()` going to set up the addon and installs itself as the default TlsClient factory. 
One part of the setup phase is to load the databases into memory and write it to the application's persistent data path (with default settings) and unload the resource. 
This step needed as the databases going to open those files and read into memory only the required chunks.
While it has some disk overhead, more complexity, can work on platforms and devices where it can create and write into a new file, it greatly reduces runtime memory requirements.
This step also done only once, when the files are there no resources going to be loaded and written.

An update mechanism implemented to deliver new updates by generating a hash for the database. 
If the cached file's hash and the hash stored for the application doesn't match, the file-installation steps will be executed again to write the updated database to the cache.