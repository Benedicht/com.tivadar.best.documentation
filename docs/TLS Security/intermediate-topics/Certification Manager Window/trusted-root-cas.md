---
comments: true
---

# Trusted Root CAs

These are the basis of the trust chain, servers doesn't send root certificates the client must include the roots certificates of the accessed endpoints.

![Root CAs](media/RootCAs.png){ loading=lazy }

1.  **Reset URL:** Reset the URL input back to its addon supplied url.
2.  **URL Input:** The URL that the addon going to download the certifications. 
The addon expects CSV formatted data, but the URL can point to a local file using the file:// protocol. 
The default URLs are pointing to Mozilla repositories.
3.  **Download:** Clicking on this button start the downloading, content parsing and loading process. Downloading the certificates already uses all verification implemented in the addon.
4.  **Clear Before Download:** Check to remove all non-locked and non-user added (if `Keep Custom` is checked) certificates before download.
5.  **Clear:** Remove all non-locked and non-user added (if `Keep Custom` is checked) certificates.
6.  **Keep Custom:** If set Clear buttons doesn't remove user added certificates.
7.  **Add Custom:** Add certificates from .cer, .pem and .p7b files.
8.  **Delete Selected:** Delete selected certificates. Locked certificates can't be deleted!
9.  **Search Input:** It can be used to search certificates by their `Subject` name. Minimum 3 characters needed.
10. **Help (?) Button:** Opens a browser window to this manual.
11. **# Column:** Index of the certificate.
12. **User Column:** It has a ✔, if it's a user-added certificate.
13. **Lock Column:** It has a ✔, if it's locked and can't be deleted. Currently only certificates needed to update from the default URL are locked.
14. **Subject Column:** Subject field of the certificate.
15. **Issuer Column:** Issuer field of the certificate.
16. **Certifications:** Number of certifications displayed.
17. **Certificate Size Stats:** Min, max, sum and average size of certificate data in bytes. This can help adjusting cache sizes.
18. **Status:** Status of the last operation.

!!! Note "Double clicking on a row or hitting Enter while at least one row is selected dumps out certification information to the console."
