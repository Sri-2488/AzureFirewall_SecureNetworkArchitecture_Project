# Logging and Monitoring setup.
### Created the log-analytics workspace first in Rg-Security
<img width="675" height="517" alt="1" src="https://github.com/user-attachments/assets/4e130e9e-12c2-4eb7-a96f-4b0db5b6076f" />

### fw-log-workspace details
<img width="663" height="432" alt="2" src="https://github.com/user-attachments/assets/a3d171d0-5f83-42c5-b0f1-9d0e0541843b" />

### Created the diagnostic-settings in firewall and attached to the fw-log-workspace
<img width="671" height="560" alt="3" src="https://github.com/user-attachments/assets/b9f977da-d99e-4a1d-a59b-e5cb5e172a39" />

### Portal Screenshot:
<img width="830" height="438" alt="4" src="https://github.com/user-attachments/assets/c775e2ff-1b64-4b3c-be1d-f6a246acb751" />

<img width="938" height="466" alt="5" src="https://github.com/user-attachments/assets/ee7c2653-f5d5-4c48-be2b-98db64cea902" />

<img width="940" height="511" alt="6" src="https://github.com/user-attachments/assets/2c90b925-3465-47ff-b573-217233f799e8" />

### All the validation tests in one screenshot
<img width="596" height="551" alt="image" src="https://github.com/user-attachments/assets/5ecdb816-142e-4dd2-b040-4c44a161d7c0" />

### Retrived the logs og Azure Firewall Network rule using KQL Query
<img width="966" height="468" alt="8" src="https://github.com/user-attachments/assets/b3e8eee4-ea66-4e4f-9992-ba075a5ca6ae" />

### Description of one log from source machine to webvm to dbvm via firewall (port 3306)
<img width="690" height="360" alt="9" src="https://github.com/user-attachments/assets/3ce6d82e-eb9a-451b-ac46-821689eb44a5" />

<img width="710" height="392" alt="image" src="https://github.com/user-attachments/assets/ee85f84e-3d66-4163-90fd-498d32906fe4" />

### All the Tcp Requests logs like Test-NetConnection and ssh as above
<img width="922" height="454" alt="12-ntrule" src="https://github.com/user-attachments/assets/2d099f38-4f8d-41cd-8835-b6bddfbccb78" />

### Azure Firewall Network Rule logs
<img width="830" height="481" alt="13-netrule" src="https://github.com/user-attachments/assets/662715c1-584b-467e-b7e7-0aa28da08ee1" />

### Azure Firewall Application rule test, i.e webvm can only connect to the www.microsoft.com and rest it denies.
<img width="689" height="524" alt="image" src="https://github.com/user-attachments/assets/6587f89e-3be4-4d33-8309-4596ba8d3089" />

### Azure Firewall Application Rule logs
<img width="937" height="470" alt="16" src="https://github.com/user-attachments/assets/8b13cc12-fd3e-4771-a771-8e620689e451" />

<img width="927" height="481" alt="17" src="https://github.com/user-attachments/assets/c789462c-74a4-4dc0-81fc-3811c7cc3a4e" />

<img width="936" height="500" alt="18" src="https://github.com/user-attachments/assets/e762a23b-ea11-4025-b0ef-d84eb0e3ed22" />

# All logs of azure firewall
<img width="914" height="469" alt="19" src="https://github.com/user-attachments/assets/237eef76-e347-41cf-b3a0-f2da10bc078b" />



