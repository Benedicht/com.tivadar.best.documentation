---
comments: true
---

# Authentication

Providing authentication information with requests are crucial to access otherwise private information on the server.
This is why, starting with this version, changed the way how setting up authentication information for a request works. 
Instead of just be able to set a username-password pair for a request, the `HTTPRequest` class now has a property that accepts an `IAuthenticator` implementation.

The plugin ships with two, ready to use authenticators: `CrendetialAuthenticator` and `BearerTokenAuthenticator`.

## CrendetialAuthenticator

The `CrendetialAuthenticator` is there to support Basic and Digest HTTP authentications. The authenticator accepts a `Crendetials` instance containing the username and password:

```cs hl_lines="3-4"
var request = HTTPRequest.CreateGet("https://host/path/to/private/resource", callback);

var credentials = new Credentials(AuthenticationTypes.Basic, "<user>", "<passwd>");
request.Authenticator = new CrendetialAuthenticator(credentials);

request.Send();
```

`Credentials`' first parameter is the type of the authentication. 
It's possible to omit this parameter in witch case the plugin will try to handle the authentication challange-response to decide whether it has to use Basic or Digest, but the request will complete much faster we can determine and set it in advance.

## BearerTokenAuthenticator

This is autheticator is to send `Authorization: Bearer <token>` headers with the request. It accepts a string token as its only constructor parameter:

```cs
var request = HTTPRequest.CreateGet("https://host/path/to/private/resource", callback);

request.Authenticator = new BearerTokenAuthenticator("<bearer token>");

request.Send();
```

It can't handle challanges and authenticatation failed responses will be delegated straight to the callback mechanism.

## IAuthenticator interface

New implementations can be added by implementing the `IAuthenticator` interface.