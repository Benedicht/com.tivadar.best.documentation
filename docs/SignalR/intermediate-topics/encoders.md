---
comments: true
---

# Encoders

SignalR Core can use different encodings to send and receive messages. Current supported encodings are `JSon` and `MessagePack`.
Using these are not automatic, as most of these implementations require 3rd party plugins and/or changes to the server.

!!! Note "If possible use MessagePack. It's a binary protocol, and more efficient both memory and cpu wise than the text based Json!"

## JSon

For the plugin, the JSon encoder is available without any additional steps. The `JsonProtocol` class is a generic implementation that can work with different encoders that can use concreate JSON parsers. 
The one that comes with the plugin is the `LitJsonEncoder`.

!!! Example "`#!cs var hub = new HubConnection(new Uri("https://server/hub"), new JsonProtocol(new LitJsonEncoder()));`"

## How to Enable and Use Newtonsoft's JSON .NET For Unity Encoder

!!! Note "The plugin will detect its presence if [installed](https://docs.unity3d.com/Packages/com.unity.nuget.newtonsoft-json@3.2/manual/index.html) through the `Package Manager` (directly or indirectly as a dependency of another package)."

There's an encoder implementation that uses the [Newtonsoft's JSON .NET For Unity](https://assetstore.unity.com/packages/tools/input-management/json-net-for-unity-11347?aid=1101lfX8E) package.

Steps to enable it and use it:

1. Download and import the [Newtonsoft's JSON .NET For Unity](https://assetstore.unity.com/packages/tools/input-management/json-net-for-unity-11347?aid=1101lfX8E) package.
2. Add the **BEST_SIGNALR_ENABLE_NEWTONSOFT_JSON_DOTNET_ENCODER** define to the [Scripting Define Symbols](https://docs.unity3d.com/Manual/PlatformDependentCompilation.html) input under **PlayerSettings/Other Settings**:

	![Scrypting Define Symbols](media/JSONDotNet_ScriptingDefineSymbols-light.png#only-light)
	![Scrypting Define Symbols](media/JSONDotNet_ScriptingDefineSymbols-dark.png#only-dark)
	
3. Use the now-available `JsonDotNetEncoder` class:

	!!! Example "`#!cs var hub = new HubConnection(new Uri("https://server/hub"), new JsonProtocol(new JsonDotNetEncoder()));`"

!!! Warning "Event if newtonsoft-json is installed through the Package Manager and detected automatically, its usage isn't automatic, you have to use it as the parameter of the `JsonProtocol` constructor!"

## MessagePack-CSharp

The official SignalR Core server implementation uses [MessagePack-CSharp](https://github.com/neuecc/MessagePack-CSharp) to serialize/deserialize message on the server side.

To use the same package, here are the steps for Best SignalR:

1. Follow the [instructions](https://github.com/neuecc/MessagePack-CSharp#unity) to install MessagePack-CSharp.
2. Locate the `com.Tivadar.Best.SignalR.asmdef` file. Depending how you installed the package, it can be under your */Assets/com.tivadar.best.signalr* or */Packages/com.tivadar.best.signalr* folders.
3. Add MessagePack.asmdef (located in Scripts\MessagePack\) to the list of Assembly Definition References and press Apply.
4. Add the **BEST_SIGNALR_ENABLE_MESSAGEPACK_CSHARP** symbol to the [Scripting Define Symbols](https://docs.unity3d.com/Manual/PlatformDependentCompilation.html) input under **PlayerSettings/Other Settings** and press Apply.
5. The `MessagePackCSharpProtocol` class is now available, it can be used to create a new HubConnection object.

    !!! Example "`#!cs var hub = new HubConnection(new Uri("https://server/hub"), new MessagePackCSharpProtocol());`"

!!! Warning "Carefully read through the [Unity Support](https://github.com/neuecc/MessagePack-CSharp#unity-support) and [AOT Code Generation](https://github.com/neuecc/MessagePack-CSharp#aot-code-generation-support-for-unityxamarin) topics to be able to properly set up MessagePack-CSharp!"

## GameDevWare MessagePack

By default the server has support for the JSon encoding but by [adding new packages and a few lines of code](https://docs.microsoft.com/en-us/aspnet/core/signalr/messagepackhubprotocol) the MessagePack encoding can be enabled too.

There's a MessagePack encoding implementation for the plugin, but it's disabled by default. To enable and use it, follow these steps:

1. Download and import the [Json & MessagePack Serialization](https://assetstore.unity.com/packages/tools/network/json-messagepack-serialization-59918?aid=1101lfX8E) package.
2. Create a new [Asembly Definition file](https://docs.unity3d.com/Manual/ScriptCompilationAssemblyDefinitionFiles.html) under the *Plugins\GameDevWare.Serialization* folder.
2. Locate the `com.Tivadar.Best.SignalR.asmdef` file. Depending how you installed the package, it can be under your */Assets/com.tivadar.best.signalr* or */Packages/com.tivadar.best.signalr* folders.
4. Reference the newly create asmdef file and press Apply.
5. Add the **BEST_SIGNALR_ENABLE_GAMEDEVWARE_MESSAGEPACK** define to the [Scripting Define Symbols](https://docs.unity3d.com/Manual/PlatformDependentCompilation.html) input under **PlayerSettings/Other Settings**.
6. Use the now available `MessagePackProtocol` class:

    !!! Example "`#!cs var hub = new HubConnection(new Uri("https://server/hub"), new MessagePackProtocol());`"

As you can see, the `MessagePackProtocol` uses only one class, there's no MessagePackEncoder as it's very specific and uses directly the *Json & MessagePack Serialization* classes.

The `MessagePackProtocol` class can be found in the `com.Tivadar.Best.SignalR\Runtime\Encoders\` folder.
