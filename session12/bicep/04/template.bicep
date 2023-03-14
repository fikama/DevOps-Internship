param vnetName string
param nsgName string
param subnet string
param group string
param location string

module apply_nsg_to_subnet './nested_apply_nsg_to_subnet.bicep' = {
  name: 'apply-nsg-to-subnet'
  scope: resourceGroup(group)
  params: {
    resourceId_resourceGroup_name_Microsoft_Network_virtualNetworks_subnets_parameters_vnetName_parameters_subnet: reference(resourceId(resourceGroup().name, 'Microsoft.Network/virtualNetworks/subnets', vnetName, subnet), '2018-03-01')
    resourceId_Microsoft_Network_networkSecurityGroups_parameters_nsgName: resourceId('Microsoft.Network/networkSecurityGroups', nsgName)
    vnetName: vnetName
    subnet: subnet
    location: location
  }
}