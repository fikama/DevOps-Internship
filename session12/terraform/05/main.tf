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

data "azurerm_subnet" "subnet" {
  name                 = var.subnetName
  virtual_network_name = var.vnetName
  resource_group_name  = var.group
}

resource "azurerm_network_interface" "example" {
  name                = "${var.vmName}_networkInterface"
  location            = var.location
  resource_group_name = var.group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                            = var.vmName
  resource_group_name             = var.group
  location                        = var.location
  size                            = var.vmPricingTier
  disable_password_authentication = false
  admin_username                  = "liladmin"
  admin_password                  = "admin123456!"
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.vmDiskPricingTier
  }

  source_image_reference {
    publisher = var.vmImage.publisher
    offer     = var.vmImage.offer
    sku       = var.vmImage.sku
    version   = var.vmImage.version
  }
}



