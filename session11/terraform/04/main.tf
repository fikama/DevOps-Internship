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

resource "azurerm_storage_account" "example" {
  name                     = var.storageAccountName
  resource_group_name      = "test"
  location                 = var.location
  account_tier             = var.pricingTier
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "example" {
  name                  = "${var.storageAccountName}container"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "container"
}