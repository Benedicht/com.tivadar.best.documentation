---
comments: true
---
# UploadChannel`2

An upload channel that represents one prameter of a client callable function. It implements the IDisposable interface and calls Finish from the Dispose method. 

## **Fields**:
### **IUPloadItemController&lt;&gt; Controller**
: The associated upload controller 
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) ParamIdx**
: What parameter is bound to. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) IsFinished**
: Returns true if Finish() or Cancel() is already called. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) StreamingId**
: The unique generated id of this parameter channel. 
## **Methods**:

### **Upload**
: Uploads a parameter value to the server. 

### **Cancel**
: Calling this function cancels the call itself, not just a parameter upload channel. 

### **Finish**
: Finishes the channel by telling the server that no more uplode items will follow. 