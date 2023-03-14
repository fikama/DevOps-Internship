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

resource "azurerm_mssql_server" "sqldb" {
  name                         = var.serverName
  resource_group_name          = "test"
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "secretlogin"
  administrator_login_password = "1qaz@WSX3edc"
}

resource "azurerm_mssql_database" "Database" {
  name                 = var.dbName
  server_id            = azurerm_mssql_server.sqldb.id
  sku_name             = var.pricingTier
  storage_account_type = var.dbBackupPolicy
}

resource "azurerm_mssql_firewall_rule" "firewallRules" {
  count            = length(var.firewallRules)
  name             = var.firewallRules[count.index].name
  server_id        = azurerm_mssql_server.sqldb.id
  start_ip_address = var.firewallRules[count.index].start
  end_ip_address   = var.firewallRules[count.index].end
}