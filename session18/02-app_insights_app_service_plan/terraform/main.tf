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

data "azurerm_service_plan" "example" {
  name                = var.appServicePlanName
  resource_group_name = var.appServicePlangroup
}

resource "azurerm_portal_dashboard" "my-board" {
  name                = var.appServicePlanName
  resource_group_name = var.appServicePlangroup
  location            = data.azurerm_service_plan.example.location
  tags = {
    source = "terraform"
  }
  dashboard_properties = templatefile("dash.tpl",
    {
      resourceID         = data.azurerm_service_plan.example.id
      appServicePlanName = var.appServicePlanName
  })
}

