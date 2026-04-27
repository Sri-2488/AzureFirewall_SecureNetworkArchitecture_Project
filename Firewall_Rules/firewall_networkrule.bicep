param firewallPolicyName string
param location string = resourceGroup().location
resource fwPolicy 'Microsoft.Network/firewallPolicies@2023-11-01' existing = {
  name: firewallPolicyName
}
resource ruleCollectionGroup 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2023-11-01' = {
  name: 'NetRules'
  parent: fwPolicy
  properties: {
    priority: 200
    ruleCollections: [
      
      //  2. Allow traffic from web-subnet to data-subnet via firewall
      {
        name: 'AllowDB'
        priority: 100
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            name: 'DBAccess'
            ruleType: 'NetworkRule'
            sourceAddresses: [
              '10.1.1.0/24'
            ]
            destinationAddresses: [
              '10.2.1.4'
            ]
            destinationPorts:[
              '3306'
            ]
            ipProtocols: [
             'Tcp'
            ]
          }
        ]
      }
    ]
}
}
