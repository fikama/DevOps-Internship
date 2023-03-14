param serverName string
param location string
param administrators object = {
}
param databaseName string
param skuName string
param tier string

@description('array of firewall rules')
param firewallRules array
param requestedBackupStorageRedundancy string = 'Local'

resource serverName_resource 'Microsoft.Sql/servers@2020-11-01-preview' = {
  name: serverName
  location: location
  properties: {
    version: '12.0'
    administrators: administrators
  }
}

resource serverName_firewallRules_name 'Microsoft.Sql/servers/firewallRules@2014-04-01-preview' = [for item in firewallRules: {
  name: '${serverName}/${item.name}'
  location: location
  properties: {
    endIpAddress: item.start
    startIpAddress: item.end
  }
  dependsOn: [
    serverName_resource
  ]
}]

resource serverName_databaseName 'Microsoft.Sql/servers/databases@2021-08-01-preview' = {
  parent: serverName_resource
  location: location
  name: '${databaseName}'
  properties: {
    requestedBackupStorageRedundancy: requestedBackupStorageRedundancy
  }
  sku: {
    name: skuName
    tier: tier
  }
}