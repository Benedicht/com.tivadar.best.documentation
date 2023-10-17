---
comments: true
---

# Cookies

The plugin automatically retrieves cookies from responses, stores them (1) and appends them to the outgoing requests.
{ .annotate }

1. based on cookie properties, platoform support for storage and settings of the CookieJar

## Set custom cookies

There are cases where we want to create and add cookies on the client side and send them with future requests. 
To achieve this, we can create and add cookie to the Cookie Jar the following way:

```cs
using Best.HTTP.Cookies;

var uri = new Uri($"https://example.com/path");
var cookie = new Cookie("cookie1", "value1");
CookieJar.Set(uri, cookie);
```

`#!cs new Cookie("cookie1", "value1")` creates a new cookie. The cookie's key is `"cookie1"` while its value is `"value1"`. It has different constructors to set additional parameters, like expiration, whether to persist it between application runs, etc.
`#!cs CookieJar.Set(uri, cookie);` adds the cookie to the Jar, or if the same key already exists, overwrites the old one.

After calling `CookieJar.Set`, new requests sent to `example.com` with the base path `/path` will use and send the newly set cookie too.

When the uri's path value is other than the root one (`"/"`), cookies are sent only for that path and any sub-folder. So, for the `"https://example.com/path"` url, it will NOT be sent for requests made to "https://example.com/" or `"https://example.com/other_path"`, but sent for `"https://example.com/path"` and `"https://example.com/path/sub_path"`!

## Retrieve cookies

`CookieJar` also allows retrieving received or manually set cookies with its `#!cs List<Cookie> Get(Uri uri)` function:

```cs
var uri = new Uri($"https://example.com/path");
var cookies = CookieJar.Get(uri);
```

`CookieJar.Get` will return only with those cookies that satisfy the domain and path rules.

## Cookie Jar Maintenance

`CookieJar` allows different maintenance scenarios:

- - deleting all cookies with `#!cs void CookieJar.Clear()`
- clearing only older entries with `#!cs void CookieJar.Clear(TimeSpan olderThan)`
- removing entries for a specific domain name with `#!cs void CookieJar.Clear(string domain)`
- or a cookies for a concrete domain and name with `#!cs void CookieJar.Remove(Uri uri, string name)`