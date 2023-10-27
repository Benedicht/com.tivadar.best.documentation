---
comments: true
---
# HTTP2Settings

[Settings Registry](https://httpwg.org/specs/rfc7540.html#iana-settings)

## **Fields**:
### **HTTP2Settings.HEADER_TABLE_SIZE**
: Allows the sender to inform the remote endpoint of the maximum size of the header compression table used to decode header blocks, in octets. The encoder can select any size equal to or less than this value by using signaling specific to the header compression format inside a header block (see [COMPRESSION]). The initial value is 4,096 octets. 
### **HTTP2Settings.ENABLE_PUSH**
: This setting can be used to disable server push (Section 8.2). An endpoint MUST NOT send a PUSH_PROMISE frame if it receives this parameter set to a value of 0. An endpoint that has both set this parameter to 0 and had it acknowledged MUST treat the receipt of a PUSH_PROMISE frame as a connection error (Section 5.4.1) of type PROTOCOL_ERROR.  The initial value is 1, which indicates that server push is permitted. Any value other than 0 or 1 MUST be treated as a connection error (Section 5.4.1) of type PROTOCOL_ERROR. 
### **HTTP2Settings.MAX_CONCURRENT_STREAMS**
: Indicates the maximum number of concurrent streams that the sender will allow. This limit is directional: it applies to the number of streams that the sender permits the receiver to create. Initially, there is no limit to this value. It is recommended that this value be no smaller than 100, so as to not unnecessarily limit parallelism.  A value of 0 for SETTINGS_MAX_CONCURRENT_STREAMS SHOULD NOT be treated as special by endpoints. A zero value does prevent the creation of new streams; however, this can also happen for any limit that is exhausted with active streams. Servers SHOULD only set a zero value for short durations; if a server does not wish to accept requests, closing the connection is more appropriate. 
### **HTTP2Settings.INITIAL_WINDOW_SIZE**
: Indicates the sender's initial window size (in octets) for stream-level flow control. The initial value is 2^16-1 (65,535) octets.  This setting affects the window size of all streams (see Section 6.9.2).  Values above the maximum flow-control window size of 2^31-1 MUST be treated as a connection error (Section 5.4.1) of type FLOW_CONTROL_ERROR. 
### **HTTP2Settings.MAX_FRAME_SIZE**
: Indicates the size of the largest frame payload that the sender is willing to receive, in octets.  The initial value is 2^14 (16,384) octets. The value advertised by an endpoint MUST be between this initial value and the maximum allowed frame size (2^24-1 or 16,777,215 octets), inclusive. Values outside this range MUST be treated as a connection error (Section 5.4.1) of type PROTOCOL_ERROR. 
### **HTTP2Settings.MAX_HEADER_LIST_SIZE**
: This advisory setting informs a peer of the maximum size of header list that the sender is prepared to accept, in octets. The value is based on the uncompressed size of header fields, including the length of the name and value in octets plus an overhead of 32 octets for each header field.  For any given request, a lower limit than what is advertised MAY be enforced. The initial value of this setting is unlimited. 
### **HTTP2Settings.ENABLE_CONNECT_PROTOCOL**
: https://tools.ietf.org/html/rfc8441 Upon receipt of SETTINGS_ENABLE_CONNECT_PROTOCOL with a value of 1, a client MAY use the Extended CONNECT as defined in this document when creating new streams. Receipt of this parameter by a server does not have any impact.  A sender MUST NOT send a SETTINGS_ENABLE_CONNECT_PROTOCOL parameter with the value of 0 after previously sending a value of 1. 