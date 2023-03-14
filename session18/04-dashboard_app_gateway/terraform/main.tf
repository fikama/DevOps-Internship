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

data "azurerm_application_gateway" "example" {
  name                = var.appgatewayname
  resource_group_name = var.appgatewaygroup
}

resource "azurerm_portal_dashboard" "my-board" {
  name                = var.appgatewayname
  resource_group_name = var.appgatewaygroup
  location            = data.azurerm_application_gateway.example.location
  tags = {
    source = "terraform"
  }
  dashboard_properties = templatefile("dash.tpl",
    {
      resourceID     = data.azurerm_application_gateway.example.id
      appgatewayname = var.appgatewayname
  })
}

