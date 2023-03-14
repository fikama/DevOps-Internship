param location string
param storageAccountName string
param pricingTier string
param identityName string
param uid string = utcNow()

resource storageAccountName_resource 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: storageAccountName
  location: location
  properties: {
  }
  kind: 'StorageV2'
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

resource demoSample 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'demoSample'
  location: resourceGroup().location
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${resourceId('Microsoft.ManagedIdentity/userAssignedIdentities', identityName)}': {
      }
    }
  }
  kind: 'AzureCLI'
  properties: {
    forceUpdateTag: uid
    azCliVersion: '2.9.1'
    timeout: 'PT30M'
    scriptContent: '\r\n              az storage blob service-properties update --account-name przechowywalnia --static-website true\r\n            '
    cleanupPreference: 'Always'
    retentionInterval: 'P1D'
  }
}