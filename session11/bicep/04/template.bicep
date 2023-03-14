param location string
param storageAccountName string
param pricingTier string

resource storageAccountName_resource 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: storageAccountName
  location: location
  properties: {
  }
  sku: {
    name: pricingTier
  }
}

resource storageAccountName_default 'Microsoft.Storage/storageAccounts/blobServices@2021-09-01' = {
  parent: storageAccountName_resource
  name: 'default'
  properties: {
  }
}

resource Microsoft_Storage_storageAccounts_fileservices_storageAccountName_default 'Microsoft.Storage/storageAccounts/fileservices@2021-09-01' = {
  parent: storageAccountName_resource
  name: 'default'
  properties: {
  }
  dependsOn: [

    storageAccountName_default
  ]
}