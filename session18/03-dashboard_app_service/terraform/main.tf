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

data "azurerm_linux_web_app" "example" {
  name                = var.appServiceName
  resource_group_name = var.appServiceGroup
}

resource "azurerm_portal_dashboard" "my-board" {
  name                = var.appServiceName
  resource_group_name = var.appServiceGroup
  location            = data.azurerm_linux_web_app.example.location
  tags = {
    source = "terraform"
  }
  dashboard_properties = templatefile("dash.tpl",
    {
      resourceID     = data.azurerm_linux_web_app.example.id
      appServiceName = var.appServiceName
  })
}

