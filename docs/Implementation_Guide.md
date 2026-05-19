# Azure Firewall Secure Network Architecture Project
## Project Overview
This project demonstrates a secure multi-network architecture on Azure, utilizing Azure Firewall, custom routing, Network Security Groups (NSGs), Firewall Policies, DNAT, Application Rules, Network Rules, and centralized monitoring via Log Analytics using Azure CLI.
The environment is structured to replicate enterprise-level network segmentation where:
- Public access is strictly regulated.
- Application and database workloads are isolated.
- All inter-network traffic is scrutinized by Azure Firewall.
- Database workloads are maintained in a private setting.
- Firewall activities are logged and monitored centrally.

The project validates secure communication between an application virtual machine and a database virtual machine through Azure Firewall, while implementing least-privilege access controls.
## Architecture Summary
### Core Components
#### Security Network
Contains the centralized Azure Firewall infrastructure.
Includes:
- Azure Firewall
- Firewall Policy and Rules
- Threat Intelligence Mode
- DNS Proxy
- Public IP for controlled inbound access
- Log Analytics Workspace
- Diagnostic Settings
#### Application Network
Hosts the application workload.
Includes:
- Application Virtual network
- web subnet
- web virtual machine
- Network Security Group (NSG)
- User Defined Routes (UDRs)
#### Data Network
Hosts the private database workload.
Includes:
- Data Virtual Network
- Private data subnet
- Database virtual mavchine
- Network Security Group (NSG)
- User Defined Routes (UDRs)

## Architecture Goals
The solution was implemented to achieve the following:
- Centralized traffic inspection
- Network segmentation
- Secure database isolation
- Controlled administrative access
- Firewall-based east-west traffic filtering
- Centralized monitoring and logging
- Enterprise-style routing architecture

## Network Design
### Component-         AddressSpace
Security VNet-         10.0.0.0/16

App Vnet-              10.1.0.0/16

Data Vnet-             10.2.0.0/16

AzureFirewallSubnet-   10.0.1.0/24

Web Subnet-            10.1.1.0/24

Data Subnet-           10.2.1.0/24

## Trafic Flow Design
### Inbound Administrative Access
SSH traffic from the internet reaches the Azure Firewall public IP.
Azure Firewall performs DNAT translation:
- Public Port 22
  → translated to
- Web VM private IP Port 22
This ensures:
- No direct public IP on workload VMs
- Centralized ingress inspection
- Secure administrative access

### Application to Database Traffic
Traffic flow:
Web VM → Route Table → Azure Firewall → Database VM
The firewall inspects:
- Source subnet
- Destination subnet
- Port 3306
- Protocol TCP
Only explicitly allowed database traffic is permitted.

## Security Controls Implemented
### Azure Firewall Policy
Centralized firewall policy management was configured.
The policy includes:
#### Network Rules
Allows:
- App subnet → Database subnet
- TCP Port 3306
#### Application Rules
Allows:
- Controlled outbound web access
- Microsoft domains
- Ubuntu repository access
#### DNAT Rules
Allows:
- SSH access to Web VM through firewall public IP

### Network Security Groups
#### Web NSG
Allows:
- SSH inbound
- Database outbound traffic
#### Database NSG
Allows:
- MySQL inbound only from application subnet
This enforces least-privilege communication.

### Routing Configuration
User Defined Routes were configured so all traffic flows through Azure Firewall.
#### App Subnet Routes
- Default route directed to firewall
- Database subnet route directed to firewall
#### Data Subnet Routes
- Return route to application subnet via firewall
- Default route directed to firewall
This prevents direct VNet-to-VNet communication bypassing the firewall.

### VNet Peering Configuration
Bidirectional VNet peering was configured between:
- Security ↔ App
- Security ↔ Data
Forwarded traffic was enabled on all peerings to allow firewall-based routing.

This enables:
- Cross-network communication
- Centralized inspection
- Controlled east-west traffic flow

## Monitoring & Logging
### Log Analytics Workspace
A centralized Log Analytics Workspace was deployed for firewall telemetry collection.

### Diagnostic Settings
Azure Firewall diagnostics were enabled for:
- Network Rule Logs ( Network Rule + DNAT Rule)
- Application Rule Logs
- DNS Proxy Logs
- Threat Intelligence Logs
  
### Validation Testing
The environment was validated using multiple tests.
#### Validation 1 — DNAT Access
SSH access through firewall public IP successfully connected to Web VM.
Validated:
- DNAT rule functionality
- Firewall ingress control
#### Validation 2 — Firewall Network Rule
Database connectivity test from Web VM to Database VM on port 3306 succeeded.
Validated:
- Firewall network rules
- Custom routing
- NSG configuration
- End-to-end segmentation
#### Validation 3 — Private Database Isolation
Database VM remained private with:
No public IP
Access only through approved firewall-inspected traffic
Validated:
- Private subnet isolation
- Secure workload segmentation
#### Validation 4 — Route Enforcement
Tracepath and effective route validation confirmed:
- Traffic traversed Azure Firewall
- No direct peering bypass
Validated:
- UDR enforcement
- Centralized inspection
#### Validation 5 — Firewall Logging
Azure Firewall logs successfully appeared in Log Analytics Workspace.
Validated:
- Diagnostic settings
- Centralized monitoring
- Firewall telemetry collection

## Security Best Practices Implemented
### Network Segmentation
Application and database workloads were isolated into separate virtual networks.
### Least Privilege Access
Only required ports and protocols were allowed.
### Centralized Security Inspection
All cross-network communication traversed via Azure Firewall.
### Private Backend Infrastructure
Database workloads remained inaccessible from the public internet.
### Centralized Monitoring
Firewall logs were aggregated into Log Analytics for visibility and auditing.

## Project Outcomes
This project demonstrates practical implementation of:
- Azure Firewall
- Firewall Policies
- Secure Routing
- Network Segmentation
- DNAT Rules
- Application Rules
- Network Rules
- NSGs
- VNet Peering
- Diagnostic Logging
- Log Analytics Integration
The final environment represents a realistic enterprise-style Azure network security architecture suitable for cloud security, networking, and infrastructure engineering portfolios.
