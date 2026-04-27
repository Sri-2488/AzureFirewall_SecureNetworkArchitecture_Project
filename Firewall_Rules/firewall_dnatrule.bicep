param firewallPolicyName string
param firewallPublicIP string
param webVmPrivateIP string

resource fwPolicy 'Microsoft.Network/firewallPolicies@2023-11-01' existing = {
  name: firewallPolicyName
}

resource dnatRCG 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2023-11-01' = {
  name: 'DNATRules'
  parent: fwPolicy
  properties: {
    priority: 300
    ruleCollections: [
      {
        name: 'AllowSSH'
        priority: 100
        ruleCollectionType: 'FirewallPolicyNatRuleCollection'
        action: {
          type: 'DNAT'
        }
        rules: [
          {
            name: 'SSHAccess'
            ruleType: 'NatRule'
            sourceAddresses: [
              '*'
            ]
            destinationAddresses: [
              firewallPublicIP
            ]
            destinationPorts: [
              '22'
            ]
            translatedAddress: webVmPrivateIP
            translatedPort: '22'
            ipProtocols: [
              'TCP'
            ]
          }
        ]
      }
    ]
  }
}
