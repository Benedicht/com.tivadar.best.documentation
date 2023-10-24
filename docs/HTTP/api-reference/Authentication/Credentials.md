---
comments: true
---
# Credentials

Hold all information that required to authenticate to a remote server. 

## **Fields**:
### **Type**
: The type of the Authentication. If you don't know what to use, the preferred way is to choose Unknow. 
### **UserName**
: The username to authenticate on the remote server. 
### **Password**
: The password to use in the authentication process. The password will be stored only in this class. 
## **Methods**:

### **#ctor**
: Set up the authentication credentials with the username and password. The Type will be set to Unknown. 

### **#ctor**
: Set up the authentication credentials with the given authentication type, username and password. 