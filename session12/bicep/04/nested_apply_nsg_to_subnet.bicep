param resourceId_resourceGroup_name_Microsoft_Network_virtualNetworks_subnets_parameters_vnetName_parameters_subnet object
param resourceId_Microsoft_Network_networkSecurityGroups_parameters_nsgName string
param vnetName string
param subnet string
param location string

resource vnetName_subnet 'Microsoft.Network/virtualNetworks/subnets@2018-03-01' = {
  name: '${vnetName}/${subnet}'
  location: location
  properties: {
    addressPrefix: resourceId_resourceGroup_name_Microsoft_Network_virtualNetworks_subnets_parameters_vnetName_parameters_subnet.addressPrefix
    networkSecurityGroup: {
      id: resourceId_Microsoft_Network_networkSecurityGroups_parameters_nsgName
    }
  }
}