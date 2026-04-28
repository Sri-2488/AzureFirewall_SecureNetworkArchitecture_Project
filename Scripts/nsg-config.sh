#Created NSG rule in App resource-group to allow port 22 because by deafult all the ports are blocked to the internet.
az network nsg create -g Rg-App --name web-nsg --location australiaeast
az network nsg rule create '
 -g Rg-App '
 --nsg-name web-nsg '
 --name AllowSSH '
 --priority 100 '
 --direction Inbound '
 --access Allow '
 --protocol TCP '
 --destination-port-ranges 22 '
 --source-address-prefixes "*" 

 #Allowed traffic to data-subnet in Rg-Data
 az network nsg rule create '
 -g Rg-App '
 --nsg-name web-nsg '
 --name AllowToDataSubnet'
 --priority 110 '
 --direction Outbound '
 --access Allow '
 --protocol TCP '
 --destination-port-ranges 3306 '
 --source-address-prefixes 10.2.1.0/24

#Created NSG rule in Data resource-group to allow interanl treaffic from web-subnet via firewall.
az network nsg create -g Rg-Data --name db-nsg --location australiaeast
az network nsg rule create '
 -g Rg-Data '
 --nsg-name db-nsg '
 --name AllowWebtoDB '
 --priority 100 '
 --direction Inbound '
 --access Allow '
 --protocol TCP '
 --destination-port-ranges 3306 '
 --source-address-prefixes 10.1.1.0/24
