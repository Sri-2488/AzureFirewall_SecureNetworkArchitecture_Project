#Created Public IP for firewall.
          az network public-ip create --resource-group Rg-Security --name fw-publicip --sku Standard
          $RGS= Rg-Security
          $App= Rg-App
          $Data= Rg-Data
#Created Firewall policies 
          az network firewall policy create --resource-group $RGS --name fw-policy 
#Added Threat Intelligence mode
          az network firewall policy update --resource-group $RGS --name fw-policy  --threat-intel-mode deny
#Added DNS Proxy Firewall policy.
          az network firewall policy update -g $RGS --name fw-policy --dns-servers "8.8.8.8" "1.1.1.1"

#Created the firewall
          az network firewall create -g $RGS --name firewall --location australiaeast --firewall-policy fw-policy
#assigned public ip to the firewall.
          az network firewall ip-config create -g $RGS -n fw-config --vnet-name AzFirewall --firewall-name firewall --public-ip-address fw-publicip

          

#Routing:
#Retrived the proivate ip of firewall for routing.
         az network firewall show -g $RGS -n firewall --query "ipConfigurations[0].privateIPAddress" -o tsv
#output: 10.0.1.4, save to $Fwprivateip

#Created Route table and route in Rg-App
         az network route-table create -g $App -n rt-app
         
         az network route-table route create '
          --resource-group $App '
          --name dr-app-fw '
          --route-table-name rt-app '
          --address-prefix 0.0.0.0/0 '
          --next-hop-type VirtualAppliance '
          --next-hop-ip-address $Fwprivateip

#Created route from webvm to dbvm via firewall.
         az network route-table route create '
          --resource-group $App '
          --name todb '
          --route-table-name rt-app '
          --address-prefix 10.2.1.0/24 '
          --next-hop-type VirtualAppliance '
          --next-hop-ip-address $Fwprivateip
#assigned route table to web-subnet.
        az network vnet subnet update -g $App --vnet-name App --name web-subnet --route-table rt-app

          
#Created Route table and route in Rg-Data
         az network route-table create -g $Data -n rt-data
         
         az network route-table route create '
          --resource-group $Data '
          --name dr-data-fw '
          --route-table-name rt-data '
          --address-prefix 0.0.0.0/0 '
          --next-hop-type VirtualAppliance '
          --next-hop-ip-address $Fwprivateip

#created route for traffic return to webvm from dbvm via firewall.
        az network route-table route create '
          --resource-group $Data '
          --name returntoweb '
          --route-table-name rt-data '
          --address-prefix 10.1.1.0/24'
          --next-hop-type VirtualAppliance '
          --next-hop-ip-address $Fwprivateip
#assigned route table to data-subnet.
        az network vnet subnet update -g $Data --vnet-name Data --name data-subnet --route-table rt-data



#FirewalRules
#Created firewall rules using bicep, the scripts are in Firewall_Rules folder in repo.
#After creation of rules, need to deploy them in firewall.
#--Application rule:
        az deployment group create '
         --resource-group $RGS '
         --template-file firewall_applicationrule.bicep '
         --parameters firewallPolicyName=fw-policy
#--Network rule:
        az deployment group create '
         --resource-group $RGS '
         --template-file firewall_networkrule.bicep '
         --parameters firewallPolicyName=fw-policy

#--Dnat rule:
       az deployment group create '
         --resource-group $RGS '
         --template-file firewall_dnatrule.bicep '
         --parameters firewallPolicyName=fw-policy firewallPublicIP=fw-publicip webVmPrivateIP=10.1.1.4
