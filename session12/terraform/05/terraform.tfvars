vmName = "testvm246"
vmImage = {
  publisher = "Canonical"
  offer     = "UbuntuServer"
  sku       = "16.04-LTS"
  version   = "latest"
}
vmPricingTier     = "Standard_B1s"
vmDiskPricingTier = "Standard_LRS"
vnetName          = "testvnet246"
subnetName        = "sub2"
group             = "test"
location          = "uksouth"