location     = "uksouth"
vnetName     = "testvnet246"
addressSpace = "192.168.0.0/16"
group        = "test"
arrayOfSubnets = [
  {
    name         = "sub1",
    adressPrefix = "192.168.1.0/24"
  },
  {
    name         = "sub2",
    adressPrefix = "192.168.2.0/24"
  },
  {
    name         = "sub3",
    adressPrefix = "192.168.3.0/24"
  }
]
