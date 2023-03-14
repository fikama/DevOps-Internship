@description('Name of the azure container registry (must be globally unique)')
@minLength(5)
@maxLength(50)
param registryName string

@description('Location for all resources.')
param location string = resourceGroup().location

@description('Tier of your Azure Container Registry.')
@allowed([
  'Basic'
  'Standard'
  'Premium'
])
param registrySku string

resource registryName_resource 'Microsoft.ContainerRegistry/registries@2021-09-01' = {
  name: registryName
  location: location
  sku: {
    name: registrySku
  }
  properties: {
    adminUserEnabled: true
  }
}