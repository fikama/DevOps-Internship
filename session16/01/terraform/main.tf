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

resource "azurerm_container_registry" "acr" {
  name                = var.registryName
  resource_group_name = var.group
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}