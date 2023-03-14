param vmName string
param vmImage object
param vmPricingTier string
param vmDiskPricingTier string
param vnetName string
param subnetName string
param location string

resource vmName_networkInterface 'Microsoft.Network/networkInterfaces@2020-05-01' = {
  name: '${vmName}_networkInterface'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', vnetName, subnetName)
          }
        }
      }
    ]
  }
}

resource vmName_resource 'Microsoft.Compute/virtualMachines@2021-03-01' = {
  name: vmName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: vmPricingTier
    }
    osProfile: {
      computerName: vmName
      adminUsername: 'liladmin'
      adminPassword: 'Admin123456!'
    }
    storageProfile: {
      imageReference: vmImage
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: vmDiskPricingTier
        }
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: vmName_networkInterface.id
        }
      ]
    }
  }
}