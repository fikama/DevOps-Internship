terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_virtual_network" "example" {
  name                = var.vnetName
  location            = var.location
  resource_group_name = var.group
  address_space       = [var.addressSpace]
}

resource "azurerm_subnet" "example" {
  count                = length(var.arrayOfSubnets)
  name                 = var.arrayOfSubnets[count.index].name
  resource_group_name  = var.group
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = [var.arrayOfSubnets[count.index].adressPrefix]
}
