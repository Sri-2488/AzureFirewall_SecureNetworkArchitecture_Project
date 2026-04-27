#Purpose: Configuring both Webvm and DBvm.

#Created webvm NIC :
      az network nic create '
       --resource-group Rg-App '
       --name webvmnic '
       --vnet-name App '
       --subnet web-subnet
   
#Created webvm using Azure CLI: 
       az vm create '
        --resource-group Rg-App '
        --name webvm '
        --image Canonical:0001-com-ubuntu-server-jammy:22_04-lts:latest '
        --admin-username azuser '
        --generate-ssh-keys '
        --nics webvmnic '
       --size Standard_D2s_v5

#Created dbvm NIC: 
       az network nic create '
         --resource-group Rg-Data '
         --name dbvmnic '
         --vnet-name Data '
         --subnet data-subnet

#Created dbvm:
       az vm create '
         --resource-group Rg-Data '
         --name dbvm '
         --image Canonical:0001-com-ubuntu-server-jammy:22_04-lts:latest '
         --admin-username host '
         --generate-ssh-keys '
         --nics dbvmnic '
         --size Standard_D2s_v5

#dbvm is in a private subnet and webvm can only access mysql:3306, so need to install mysql in dbvm from our powershell and route to the firewall
         az vm start --resource-group Rg-Data --name dbvm
  
#installed mysql server in dbvm
         az vm run-command invoke -g Rg-Data -n dbvm --command-id RunShellScript --scripts "sudo apt update && sudo apt install mysql-server -y"

#Enabled and strated the mysql server in dbvm.
         az vm run-command invoke -g Rg-Data -n dbvm --command-id RunShellScript --scripts "sudo systemctl enable mysql && sudo systemctl start mysql"

#At first, the traffic goes through loopback address 127.0.0.1:33060, have to route to the firewall, because in this project our main goal is the traffic should travel via firewall, so has to be 0.0.0.0:33060.
# we can check the route using below command.
        az vm run-command invoke -g Rg-Data -n dbvm --command-id RunShellScript --scripts "sudo ss -tulnp | grep 3306"

#cleaned the old config file first
        az vm run-command invoke  '
         --resource-group Rg-Data '
         --name dbvm  '
         --command-id RunShellScript  '
         --scripts "sudo rm -f /etc/mysql/conf.d/bind.cnf"
         
#Created correct override config file, zzz-ensures this loads Last and it overrides everything in config file.
         az vm run-command invoke '
           --resource-group Rg-Data '
           --name dbvm '
           --command-id RunShellScript '
           --scripts "sudo rm -f /etc/mysql/conf.d/bind.cnf"

#Restarted mysql on dbvm.
        az vm run-command invoke '
         --resource-group Rg-Data '
         --name dbvm '
         --command-id RunShellScript '
         --scripts "sudo systemctl restart mysql"

#Final output should be when run this command in dbvm: 
       az vm run-command invoke -g Rg-Data -n dbvm --command-id RunShellScript --scripts "sudo ss -tulnp | grep 3306"
output: 
                { 
                "value": [
                  { "code": "ProvisioningState/succeeded", 
                    "displayStatus": "Provisioning succeeded",
                    "level": "Info", 
                    "message": "Enable succeeded: \n[stdout]\ntcp LISTEN 0 70 127.0.0.1:33060 0.0.0.0:* users:((\"mysqld\",pid=3952,fd=21)) \ntcp LISTEN 0 151 0.0.0.0:3306 0.0.0.0:* users:((\"mysqld\",pid=3952,fd=24)) \n\n[stderr]\n"
                    }
                    ] 
                    }
