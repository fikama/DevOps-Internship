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

resource "azurerm_network_security_group" "example" {
  name                = var.nsgName
  location            = var.location
  resource_group_name = var.group
}

resource "azurerm_network_security_rule" "example" {
  count                       = length(var.arrayOfRules)
  name                        = var.arrayOfRules[count.index].name
  priority                    = var.arrayOfRules[count.index].priority
  direction                   = var.arrayOfRules[count.index].direction
  access                      = var.arrayOfRules[count.index].access
  protocol                    = var.arrayOfRules[count.index].protocol
  source_port_range           = var.arrayOfRules[count.index].source_port_range
  destination_port_range      = var.arrayOfRules[count.index].destination_port_range
  source_address_prefix       = var.arrayOfRules[count.index].source_address_prefix
  destination_address_prefix  = var.arrayOfRules[count.index].destination_address_prefix
  resource_group_name         = var.group
  network_security_group_name = var.nsgName
  depends_on = [
    azurerm_network_security_group.example
  ]
}
