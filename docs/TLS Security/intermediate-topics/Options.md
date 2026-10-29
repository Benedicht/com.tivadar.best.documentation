---
title: Options
comments: true
---

## Examples

```csharp
#if !UNITY_WEBGL || UNITY_EDITOR
using Best.TLSSecurity;

// To disable the OCSP cache's memory cache:
SecurityOptions.OCSP.OCSPCache.DatabaseOptions.DiskManager.MaxCacheSizeInBytes = 0;

TLSSecurity.Setup();
#endif
```

`CertificateStorePreference` selects the store that builds the server certificate chain. The default is `PluginFirst`. Set another value before `TLSSecurity.Setup()`:

```csharp
#if !UNITY_WEBGL || UNITY_EDITOR
using Best.TLSSecurity;

SecurityOptions.CertificateStorePreference = CertificateStorePreference.SystemFirst;

TLSSecurity.Setup();
#endif
```

## SecurityOptions

Options of the addon can be accessed through the static `SecurityOptions` class:

- **CertificateStorePreference**: Which certificate store builds the server certificate chain, and whether the other store is used when the first one fails. The default is `PluginFirst`. Fallback runs after any failure of the primary store, including an explicit trust rejection. On Android and Apple platforms the system store depends on the `X509Chain` backend of the selected Unity scripting runtime.
    - **PluginOnly**: Use only the plugin's trusted root and intermediate databases.
    - **SystemOnly**: Use only the operating system certificate store. A rejection from that store stays a rejection.
    - **PluginFirst** (default): Try the plugin databases first. The system store is used only when the plugin cannot build a chain.
    - **SystemFirst**: Try the system store first. The plugin databases are used only when the system store cannot build a chain.
- **UseServerSentIntermediateCertificates**: If false, only certificates stored in the trusted intermediates database are used to reconstruct the certificate chain. When set to true (default), it improves compatibility but the addon going to use/accept certificates that not stored in its trusted database.
- **FolderAndFileOptions**: Folder, file and extension options.
- **OCSP**: OCSP and OCSP cache options.
- **TrustedRootsOptions**: Database options of the Trusted CAs database.
- **TrustedIntermediatesOptions**: Database options of the Trusted Intermediate Certifications database
- **Database options of the Client Credentials database**: Database options of the Client Credentials database

## OCSP Options

- **ShortLifeSpanThreshold**: The addon not going to check revocation status for short lifespan certificates.
- **EnableOCSPQueries**: Enable or disable sending out OCSP requests for revocation checking.
- **FailHard**: Treat unknown revocation statuses (unknown OCSP status or unreachable servers) as revoked and abort the TLS negotiation.
- **FailOnMissingCertStatusWhenMustStaplePresent**: Treat the TLS connection failed if the leaf certificate has the must-staple flag, but the server doesn't send certificate status.
- **OCSPCache**: OCSP Cache Options as detailed below

## OCSP Cache Options

OCSP request caching related options.

- **MaxWaitTime**: Maximum wait time to receive an OCSP response. Depending on the OCSP Options' `FailHard` value if no response is received in the given time the TLS negotiation might fail.
- **RetryUnknownAfter**: Wait time to retry to get a new OCSP response when the previous response's status is unknown.
- **FolderName**: OCSP cache's folder name.
- **DatabaseOptions**: Options for the OCSP cache database.
- **HTTPRequestOptions**: Customization options for the OCSP requests.

## OCSP Cache's HTTPRequest Options

OCSP requests are plain old `HTTPRequest`s and every BestHTTP/2 global settings affecting them, but through this options OCSP requests can be further customized.

- **DataLengthThreshold**: A threshold in bytes to switch to a POST request instead of GET. Setting it to `0` all requests are sent as POST.
- **UseKeepAlive**: Whether to try to keep the connection alive to the OCSP server.
- **UseCache**: Whether to cache responses if possible.
- **ConnectTimeout**: Time limit to establish a connection to the server.
- **Timeout**: Time limit to send and receive an OCSP response from the server.

## Database Options

- **Name**: Name of the database. This name is used to create the database files.
- **UseHashFile** Whether to calculate a hash from the database and write it to a file. It has a useage only if the file is created 'offline' and bundled with the application.
- **DiskManager**: Options for the database's DiskManager instance.

## DiskManager Options

- **MaxCacheSizeInBytes**: This limits the maximum database rows kept in memory.
- **HashDigest**: Hash digest algorithm name to generate the database's hash.