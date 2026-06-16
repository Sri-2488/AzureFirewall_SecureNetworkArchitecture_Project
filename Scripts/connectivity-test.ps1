#The validation of whole Project:
#1.Connect to webvm using firewall public ip and port 22.
#2.After successful connection to webvm, need to check webvm can be able to access only http://www.microsoft.com and the rest urls should be denied.
#3.webvm should connect to dbvm port 3306 via firewall.

# for the 1st validation, need to run the below command from terminal.
 > Test-NetConnection 13.75.x.x -Port 22
 #output: ComputerName: 13.75.x.x [firewall public ip] RemoteAddress: 13.75.x.x RemotePort:22 InterfaceAlias:Wi-Fi SourceAddress:192.x.x.x[our IP] TcpTestSucceeded:True
  > ssh azuser@13.75.x.x -p 22
  #output: can connect and login to webvm.

# for 2nd validation, 
 >
  azuser@webvm:~$ curl -I http://www.microsoft.com
  #output: HTTP/1.1 200 OK ....
  
 >
   azuser@webvm:~$ curl -I http://www.google.com
   #output: HTTP/1.1 470 status code 470.... denied

# for 3rd validation,
> 
azuser@webvm:~$nc -zv 10.2.1.4 3306
#output: Connection to 10.2.1.4 3306 port [tcp/mysql] succeeded!


#logging:
#while running above commands, can be able to see the logs in workspace "fw-log-workspace" which created before.
#below commands are used to see logs in KQL mode:

       Azure Diagnostics
       | order by TimeGenerated desc
       | take 50
  #output: Displays all the logs of traffic flow from or to the firewall.   

      Azure Diagnostics
      | where Category contains "AzureFirewall"
      | project TimeGenerated, msg_s, Category
      | order by TimeGenerated desc
  #output: Displays the logs categorized by timegenerated[UTC], msg_s, Category.

       Azure Diagnostics
       | where Category == "AzureFirewallNetworkRule"
       | parse msg_s with * "from" src ":" sport "to" dst ":" dport ".Action" action
       | project TimeGenerated, src, dst, dport, action
       | order by TimeGenerated desc
 #output: Displays the logs categorized by timegenerated[UTC], src, dst, dport, action.

     Azure Diagnostics
      | where Category contains "AzureFirewallApplicationRule"
      | project TimeGenerated, msg_s
      | order by TimeGenerated desc
#output: Displays the logs categorized by timegenerated[UTC], msg_s

  Azure Diagnostics
       | where Category == "AzureFirewallApplicationRule"
       | parse msg_s with * "from" src ":" sport "to" dst ":" dport ".Action" action
       | project TimeGenerated, src, dst, dport, action
       | order by TimeGenerated desc
 #output: Displays the logs categorized by timegenerated[UTC], src, dst, dport, action.
