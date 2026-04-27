param firewallPolicyName string
param location string = resourceGroup().location
resource fwPolicy 'Microsoft.Network/firewallPolicies@2023-11-01' existing = {
  name: firewallPolicyName
}
resource ruleCollectionGroup 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2023-11-01' = {
  name: 'AppRules'
  parent: fwPolicy
  properties: {
    priority: 300
    ruleCollections: [
      
      // 1. Allow Microsoft Internet Access
      {
        name: 'AllowMicrosoft'
        priority: 100
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            name: 'AllowMS'
            ruleType: 'ApplicationRule'
            sourceAddresses: [
              '10.1.1.0/24'
            ]
            targetFqdns: [
              'www.microsoft.com'
            ]
            protocols: [
              {
                protocolType: 'Http'
                port: 80
              }
              {
                protocolType: 'Https'
                port: 443
              }
            ]
          }
        ]
      }
    ]
}
}
