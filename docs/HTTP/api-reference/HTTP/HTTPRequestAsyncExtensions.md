---
comments: true
---
# HTTPRequestAsyncExtensions

A collection of extension methods for working with HTTP requests asynchronously using **Task`1**. 


## **Methods**:

### **GetAssetBundleAsync**
: Asynchronously sends an HTTP request and retrieves the response as an **AssetBundle**. 

### **GetHTTPResponseAsync**
: Asynchronously sends an HTTP request and retrieves the raw [HTTPResponse](HTTPResponse.md). 
	!!! note ""
		This method is particularly useful when you want to access the raw response without any specific processing  like converting the data into a string, texture, or other formats. It provides flexibility in handling  the response for custom or advanced use cases. 


### **GetAsStringAsync**
: Asynchronously sends an [HTTPRequest](HTTPRequest.md) and retrieves the response content as a `string`. 

### **GetAsTexture2DAsync**
: Asynchronously sends an [HTTPRequest](HTTPRequest.md) and retrieves the response content as a **Texture2D**. 

### **GetRawDataAsync**
: Asynchronously sends an [HTTPRequest](HTTPRequest.md) and retrieves the response content as a `byte[]`. 