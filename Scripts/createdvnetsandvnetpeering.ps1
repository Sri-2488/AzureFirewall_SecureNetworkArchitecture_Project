#Created 3 resource groups, vnets and subnets.
#Created Rg-Security resource group first.
     az group create --name Rg-Security --location australiaeast
     
#Created vnet called AzFirewall and subnet.
     az network vnet create -g Rg-Security -n AzFirewall --address-prefix 10.0.0.0/16 --subnet-name AzureFirewallSubnet --subnet-prefix 10.0.1.0/24
     
#Created Rg-App resource group.
     az group create --name Rg-App --location australiaeast
     
#Created vnet called App and a subnet.
     az network vnet create -g Rg-App -n App --address-prefix 10.1.0.0/16 --subnet-name web-subnet --subnet-prefix 10.1.1.0/24
     
#Created Rg-Data resource group.
     az group create --name Rg-Data --location australiaeast
     
#Created vnet called Data and a subnet.
     az network vnet create -g Rg-Data -n Data --address-prefix 10.2.0.0/16 --subnet-name data-subnet --subnet-prefix 10.2.1.0/24
     
#need to get vnet id for vnet peering between resource groups.
     az network vnet show --resource-group Rg-Security --name AzFirewall --query id --output tsv
     #have to save the id in $fwvnetid variable.
     az network vnet show --resource-group Rg-App --name App --query id -o tsv
     #have to save the id in $appvnetid variable.
     az network vnet show --resource-group Rg-Data --name Data --query id -o tsv
     #have to save the id in $datavnetid variable.
     
#Vnet Peering:
#Created the vnet peerings for App <-> AzFirewall, Data <-> AzFirewall.
     az network vnet peering create -n fw-app --vnet-name AzFirewall -g Rg-Security --remote-vnet $appvnetid --allow-vnet-access --set allowForwardedTraffic=true
     az network vnet peering create -n app-fw --vnet-name App -g Rg-App --remote-vnet $fwvnetid --allow-vnet-access --set allowForwardedTraffic=true
     az network vnet peering create -n fw-data --vnet-name AzFirewall -g Rg-Security --remote-vnet $datavnetid --allow-vnet-access --set allowForwardedTraffic=true
     az network vnet peering create -n data-fw --vnet-name Data -g Rg-Data --remote-vnet $fwvnetid --allow-vnet-access --set allowForwardedTraffic=true

