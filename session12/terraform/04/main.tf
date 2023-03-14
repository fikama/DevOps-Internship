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

data "azurerm_network_security_group" "nsg" {
  resource_group_name = var.group
  name                = var.nsgName
}

data "azurerm_subnet" "subnet" {
  name                 = var.subnetName
  virtual_network_name = var.vnetName
  resource_group_name  = var.group
}

resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = data.azurerm_subnet.subnet.id
  network_security_group_id = data.azurerm_network_security_group.nsg.id
}

