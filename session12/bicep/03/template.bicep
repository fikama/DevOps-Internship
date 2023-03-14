param nsgName string
param location string

@description('array of vnet subnets')
param arrayOfRules array

resource nsgName_resource 'Microsoft.Network/networkSecurityGroups@2022-01-01' = {
  name: nsgName
  location: location
}

resource nsgName_arrayOfRules_name 'Microsoft.Network/networkSecurityGroups/securityRules@2022-01-01' = [for item in arrayOfRules: {
  name: '${nsgName}/${item.name}'
  properties: {
    access: item.access
    priority: item.priority
    destinationAddressPrefix: item.destinationAddressPrefix
    destinationPortRange: item.destinationPortRange
    direction: item.direction
    protocol: item.protocol
    sourceAddressPrefix: item.sourceAddressPrefix
    sourcePortRange: item.sourcePortRange
  }
  dependsOn: [
    nsgName_resource
  ]
}]