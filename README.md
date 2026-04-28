# Azure Firewall Secure Network Architecture 
## Project Overview
 This Project demonstrates the design and implementation of a secure multi-tier network architecture in Microsoft Azure using Azure Firewall, its policies and rules for centralized traffic inspection, routing and monitoring. The architecture enforces strict communication between application and database layers while ensuring all traffic flows through a centralized security control point.
 
 ## Architecture
 ### Key Components:
 - Azure Firewall, Policies and rules (Central security layer)
 - Application VNet(Web VM)
 - Data VNet (Database VM - private subnet)
 - User Definied Routes(UDR) for forced tunneling
 - Network Security Groups(NSG) for layered security
 - Log Analytics Workspace for monitoring

## Architecture Diagram
<img width="781" height="980" alt="archdiag" src="https://github.com/user-attachments/assets/c97ff0d8-a611-4088-9332-27f5b36915fb" />

## Security Design
   ### 1. Centralized Firewall
   Inbound, Outbound, east-west traffic is routed through Azure Firewall using UDRs.
   ### 2. Network Rules
   - Allow: App -> DB (TCP 3306)
   - Deny: All other taffic (implicit)
   ### 3. Application Rules
   - Allow outbound access to trusted domains:
      - Microsoft services
      - Ubuntu repositories
   - Deny all other traffic defaulty.
  ### 4. DNAT Rules
  - Allow Inbound traffic from Internet to webvm using port 22 (SSH) via firewall public IP
  ### 5. NSG Layering
  - DB Subnet: Allow inbound MySQL only from App subnet
  - Web Subnet: Allow Outbound to DB subnet and trusted domain access using port 80, 443.

 ## Traffic Flow
 ### Internal Communication:
 Web VM -> Firewall -> DB VM (TCP 3306)
 DB VM -> Firewall -> Web VM (Return Traffic)
 ### Internet Access:
 Web VM -> Firewall -> Internet (HTTP/HTTPS)

 ## Technologies Used
 - Azure Virtual Network (VNet)
 - Azure Firewall (Standard SKU)
 - Firewall Policies and Rules
 - Network Security Groups (NSG)
 - User Defined Routes (UDR)
 - Log Analytics Workspace
 - Azure CLI
 - Bicep (Infrastructure as Code)
 - Kusto Query Language (KQL)

## Validation & Testing
### Test Web VM Connection.
<img width="509" height="448" alt="image" src="https://github.com/user-attachments/assets/9346b919-8efd-42d7-b398-5d5c1da2fc3f" />


<img width="680" height="511" alt="image" src="https://github.com/user-attachments/assets/e3da8ddd-9d06-44d1-8dbd-5c2acfb6e99c" />

### Test Internet Access
- Allow: Microsoft.com
- Deny: Google.com
<img width="689" height="524" alt="image" src="https://github.com/user-attachments/assets/75705a04-bd6c-4095-83a6-2969f2e778c6" />

### Test DB Connectivity
<img width="649" height="49" alt="6" src="https://github.com/user-attachments/assets/d27df6b6-28e1-47c5-9444-414a58e3b191" />

### Firewall Policy Rule Collection Group List
<img width="693" height="305" alt="3" src="https://github.com/user-attachments/assets/dfdca223-d6a0-4558-8f6b-0c6426440be2" />

### Resource Group Rg-App route-table
<img width="693" height="305" alt="3" src="https://github.com/user-attachments/assets/4191c0d6-41dc-4163-88ca-2dc7095c4665" />

## Logging & Monitoring
Azure Firewall diagnostics are enabled and sent to Log Analytics.
<img width="830" height="438" alt="4" src="https://github.com/user-attachments/assets/722ab2bc-a3ba-4066-8f5b-df179e31081f" />
<img width="966" height="468" alt="8" src="https://github.com/user-attachments/assets/d7844a0c-c761-4e8b-bff8-abe902e7c23a" />
<img width="690" height="360" alt="9" src="https://github.com/user-attachments/assets/3f86e081-6119-41c6-bbee-e60311efd708" />
<img width="710" height="392" alt="10" src="https://github.com/user-attachments/assets/c4533023-5386-4e66-b097-f4b14a1fb068" />
<img width="922" height="454" alt="12-ntrule" src="https://github.com/user-attachments/assets/36c613d2-5a27-4f3e-9d36-301d3d9e3403" />
<img width="830" height="481" alt="13-netrule" src="https://github.com/user-attachments/assets/c9005352-4174-4dce-8a29-2ed5bbeb69bd" />
<img width="731" height="409" alt="15-netrule" src="https://github.com/user-attachments/assets/d8c5618d-b267-4df8-9bec-1d42cfb865c9" />
<img width="937" height="470" alt="16" src="https://github.com/user-attachments/assets/14c74595-c18d-488e-887b-01a482b30790" />
<img width="927" height="481" alt="17" src="https://github.com/user-attachments/assets/ae674f97-9e76-4892-9801-b8a0010fd5a1" />
<img width="936" height="500" alt="18" src="https://github.com/user-attachments/assets/a310bf2b-fd62-421a-b694-5a991d10d7a5" />
<img width="914" height="469" alt="19" src="https://github.com/user-attachments/assets/245e94e0-81f1-45da-8255-b63926ba6a78" />








