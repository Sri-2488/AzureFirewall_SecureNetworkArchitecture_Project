# All the Validation Tests screenshots are below.
### Had successfully created connection between webvm and dbvm, and webvm can be able to connect to only www.microsoft.com using Azure Firewall Rules.
### Firewall Policy Rule collectio  group List
<img width="693" height="305" alt="3" src="https://github.com/user-attachments/assets/accb3baf-8d65-4019-84c4-bf36534ed7ae" />

### Route table of webvm
<img width="659" height="248" alt="4" src="https://github.com/user-attachments/assets/d8f48f5d-3493-43dc-8cdb-26a3d7fd799e" />

### Successfully connected to the webvm via firewall using firewall public ip with the command Test-NetConnection ( this command is used to know the tcp test success) and ssh azuser@13.x.x.x -p 22
<img width="509" height="446" alt="image" src="https://github.com/user-attachments/assets/d32246f2-9f08-4488-bd07-7aa9a3577ca0" />

### webvm can be able to connect to wwww.microsoft.com from webvm 
<img width="508" height="316" alt="2" src="https://github.com/user-attachments/assets/5c2e3fb5-0d95-474f-a031-160ac8c96b77" />

### webvm cannot be able to connect to www.google.com, because webvm only connects to the www.microsoft.com according to the Azure firewall application layer rule.
<img width="689" height="299" alt="image" src="https://github.com/user-attachments/assets/f3988450-219e-4112-9028-b65275516e3f" />

### webvm can be to connect to dbvm through port 3306.
<img width="649" height="49" alt="6" src="https://github.com/user-attachments/assets/30a02924-f88d-4930-b8c5-7bc2dbb7dad3" />
