param vnetName string
param location string

@description('array of vnet subnets')
param arrayOfSubnets array
param addressSpace string

resource vnetName_resource 'Microsoft.Network/virtualNetworks@2022-01-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressSpace
      ]
    }
  }
}

@batchSize(1)
resource vnetName_arrayOfSubnets_name 'Microsoft.Network/virtualNetworks/subnets@2022-01-01' = [for item in arrayOfSubnets: {
  name: '${vnetName}/${item.name}'
  properties: {
    addressPrefix: item.addressPrefix
  }
  dependsOn: [
    vnetName_resource
  ]
}]