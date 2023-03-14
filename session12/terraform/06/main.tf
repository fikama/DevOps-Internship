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

data "azurerm_subnet" "frontend" {
  name                 = var.frontSubnetName
  virtual_network_name = var.vnetName
  resource_group_name  = var.group
}

data "azurerm_subnet" "backend" {
  name                 = var.backSubnetName
  virtual_network_name = var.vnetName
  resource_group_name  = var.group
}

resource "azurerm_public_ip" "example" {
  name                = "pubIp"
  resource_group_name = var.group
  location            = var.location
  allocation_method   = "Dynamic"
}

resource "azurerm_application_gateway" "network" {
  name                = var.agName
  resource_group_name = var.group
  location            = var.location

  dynamic waf_configuration {
    for_each                    = length(wafRules)
    content {
      enabled                  = true
      name                     = var.wafRules[count.index].name
      file_upload_limit_mb     = var.wafRules[count.index].file_upload_limit_mb
      firewall_mode            = var.wafRules[count.index].firewall_mode
      max_request_body_size_kb = var.wafRules[count.index].max_request_body_size_kb
      request_body_check       = var.wafRuless[count.index].request_body_check
      rule_set_type            = var.wafRuless[count.index].rule_set_type
      rule_set_version         = var.wafRuless[count.index].rule_set_type
    }
  }

  sku {
    name     = "Standard_Small"
    tier     = "Standard"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = data.azurerm_subnet.frontend.id
  }

  frontend_port {
    name = "frontEndPort"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "frontIPconfig"
    public_ip_address_id = azurerm_public_ip.example.id
  }

  backend_address_pool {
    name = "backenAddrPool"
  }

  backend_http_settings {
    name                  = "httpConfig"
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = "httpListener"
    frontend_ip_configuration_name = "frontIPconfig"
    frontend_port_name             = "frontEndPort"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "requestRule"
    rule_type                  = "Basic"
    http_listener_name         = "httpListener"
    backend_address_pool_name  = "backenAddrPool"
    backend_http_settings_name = "httpConfig"
  }
}

resource "azurerm_lb" "example" {
  name                = "example-lb"
  sku                 = "Standard"
  location            = var.location
  resource_group_name = var.group

  frontend_ip_configuration {
    name                 = azurerm_public_ip.example.name
    public_ip_address_id = azurerm_public_ip.example.id
  }
}

resource "azurerm_private_link_service" "example" {
  name                = "example-privatelink"
  location            = var.location
  resource_group_name = var.group

  nat_ip_configuration {
    name      = azurerm_public_ip.example.name
    primary   = true
    subnet_id = var.backSubnetName
  }

  load_balancer_frontend_ip_configuration_ids = [
    azurerm_lb.example.frontend_ip_configuration.0.id
  ]
}

resource "azurerm_private_endpoint" "example" {
  count               = length(var.endpoints)
  name                = var.endpoints[count.index].name
  location            = var.location
  resource_group_name = var.group
  subnet_id           = var.frontSubnetName

  private_service_connection {
    name                           = "example-privateserviceconnection"
    private_connection_resource_id = azurerm_private_link_service.example.id
    is_manual_connection           = false
  }
}