---
comments: true
---
# Transaction

Represents a transaction for message operations within a STOMP session. Transactions allow multiple operations to be grouped together and committed or aborted as a single unit. 

## **Fields**:
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) Id**
: Gets the unique identifier of the transaction. 
### **[Client](Client.md) Session**
: Gets the STOMP client session associated with this transaction. 
## **Methods**:

### Begin(Client, Transaction})
: Begins the transaction and optionally executes a callback upon acknowledgment. 

### [Task](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.Tasks.Task-1)&lt;[Transaction]()&gt; BeginAsync()
: Begins the transaction. 

### Commit(Client, Transaction})
: Commits the transaction, applying all operations performed within the transaction scope, and optionally executes a callback upon acknowledgment. 

### [Task](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.Tasks.Task-1)&lt;[Transaction]()&gt; CommitAsync()
: Commits the transaction, applying all operations performed within the transaction scope, and optionally executes a callback upon acknowledgment. 

### Abort(Client, Transaction})
: Aborts the transaction, discarding all operations performed within the transaction scope, and optionally executes a callback upon acknowledgment. 

### [Task](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.Tasks.Task-1)&lt;[Transaction]()&gt; AbortAsync()
: Aborts the transaction, discarding all operations performed within the transaction scope, and optionally executes a callback upon acknowledgment. 