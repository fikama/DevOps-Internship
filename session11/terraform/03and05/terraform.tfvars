location           = "uksouth"
appServiceName     = "appservice246"
pricingTier        = "B1"
numOfNodes         = 1
dockerImage        = "filip246/hello_world_nginx"
storageAccountName = "storageaccountname246"
schedule = {
  frequency_interval = 1
  frequency_unit     = "Day"
  retentionPolicy    = 5
}
group = "test"