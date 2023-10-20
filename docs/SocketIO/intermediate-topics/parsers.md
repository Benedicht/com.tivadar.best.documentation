---
comments: true
---

# Parsers

## MessagePack Parser

By default the SocketManager uses a JSon parser and LitJson to encode/decode objects. It's also capable to send and receive MsgPack encoded messages if the server uses [socket.io-msgpack-parser](https://github.com/darrachequesne/socket.io-msgpack-parser).

To enable and use it, follow these steps:

1. Download and import the [Json & MessagePack Serialization](https://assetstore.unity.com/packages/tools/network/json-messagepack-serialization-59918?aid=1101lfX8E) package
2. Create a new [Asembly Definition file](https://docs.unity3d.com/Manual/ScriptCompilationAssemblyDefinitionFiles.html) under the *Plugins\GameDevWare.Serialization* folder
3. Locate the `com.tivadar.best.socketio.asmdef` file under the `com.tivadar.best.socketio\Runtime\` folder
4. Reference the newly create asmdef file and press Apply:

	![BestHTTP_AssemblyDefinition_MessagePack](../media/GameDevWare-light.png#only-light)
	![BestHTTP_AssemblyDefinition_MessagePack](../media/GameDevWare-dark.png#only-dark)
	
5. Add the **BEST_SOCKETIO_ENABLE_GAMEDEVWARE_MESSAGEPACK** define to the [Scripting Define Symbols](https://docs.unity3d.com/Manual/PlatformDependentCompilation.html) input under **PlayerSettings/Other Settings**:

	![GameDevWare_MessagePack_ScriptingDefineSymbols.png](../media/symbols_msgpack_light.png#only-light)
	![GameDevWare_MessagePack_ScriptingDefineSymbols.png](../media/symbols_msgpack_dark.png#only-dark)
	
6. Use the now available `MsgPackParser` class:
```cs hl_lines="2"
var manager = new SocketManager(new Uri("http://localhost:3000"));
manager.Parser = new MsgPackParser();
```

The `MsgPackParser` class can be found in the `com.tivadar.best.socketio\Runtime\Parsers\` folder.

## JSON.NET from Package

When [Newtonsoft's JSON .NET For Unity](https://docs.unity3d.com/Packages/com.unity.nuget.newtonsoft-json@3.2/manual/index.html) is installed through the Package Manager window (or as a dependency of another package), the Best SocketIO package can detect it and automatically enables the `JsonDotNetEncoder` class.

```cs
var manager = new SocketManager(new Uri("https://localhost:3000/"), new JsonDotNetParser());
```

## JSON.NET from the Asset Store
Another JSon parser using [Newtonsoft's JSON .NET For Unity](https://assetstore.unity.com/packages/tools/input-management/json-net-for-unity-11347?aid=1101lfX8E). 

Steps to enable it and use it:

1. Download and import the [Newtonsoft's JSON .NET For Unity](https://assetstore.unity.com/packages/tools/input-management/json-net-for-unity-11347?aid=1101lfX8E) package.
2. Add the **BEST_SOCKETIO_ENABLE_NEWTONSOFT_JSON_DOTNET_ENCODER** define to the [Scripting Define Symbols](https://docs.unity3d.com/Manual/PlatformDependentCompilation.html) input under **PlayerSettings/Other Settings** and press **Apply**:

    ![Scrypting Define Symbols](../media/symbols_json_light.png#only-light)
	![Scrypting Define Symbols](../media/symbols_json_dark.png#only-dark)
	
3. Use the now-available `JsonDotNetEncoder` class:
```cs
var manager = new SocketManager(new Uri("https://localhost:3000/"), new JsonDotNetParser());
```

`JsonDotNetParser` class can be found in the `com.tivadar.best.socketio\Runtime\Parsers\` folder.
