#Created Workspace and diagnostic settings to the firewall.
#Workspace creation:
     az monitor log-analytics workspace create '
       -g Rg-Security '
       -n fw-log-workspace '
       -l australiaeast
#Retrive the firewall id to create diagnostic settings in firewall.
       az network firewall show -g Rg-Security -n firewall --query id -o tsv 
  #save output to the $firewallid
#Diagnostic settings creation:
      az monitor diagnostic-settings create '
        --resource-group Rg-Security '
        --name fw-diag '
        --resource $firewallid
        --workspace fw-log-workspace '
        --logs '[{"category": "AzureFirewallNetworkRule","enabled":true},{"category":"AzureFirewallApplicationRule","enabled":true}]'
