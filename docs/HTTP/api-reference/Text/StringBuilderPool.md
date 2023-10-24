---
comments: true
---
# StringBuilderPool

Implements pooling logic for **StringBuilder** instances. 

## **Fields**:
### **IsEnabled**
: Setting this property to false the pooling mechanism can be disabled. 
### **RemoveOlderThan**
: Buffer entries that released back to the pool and older than this value are moved when next maintenance is triggered. 
### **RunMaintenanceEvery**
: How often pool maintenance must run. 