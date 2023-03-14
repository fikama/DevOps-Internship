param location string
param numberOfWorkers string
param sku string
param skuCode string
param name string
param subscriptionId string
param serverFarmResourceGroup string

@description('docker hub image to be used')
param dockerHubImage string
param hostingPlanName string

resource hostingPlanName_resource 'Microsoft.Web/serverfarms@2018-11-01' = {
  name: hostingPlanName
  location: location
  kind: 'app,linux'
  properties: {
    reserved: true
    numberOfWorkers: numberOfWorkers
  }
  sku: {
    tier: sku
    name: skuCode
  }
}

resource name_resource 'Microsoft.Web/sites@2018-11-01' = {
  name: name
  location: location
  properties: {
    serverFarmId: '/subscriptions/${subscriptionId}/resourcegroups/${serverFarmResourceGroup}/providers/Microsoft.Web/serverfarms/${hostingPlanName}'
    siteConfig: {
      dockerHubImage: 'DOCKER|${dockerHubImage}'
    }
  }
  dependsOn: [
    hostingPlanName_resource
  ]
}