provider "azurerm" {
    version = "~>2.0"
    features {}
}

terraform {
  backend "azurerm" {
  resource_group_name  = "gitactrg"
  storage_account_name = "gitactsaj922"
  container_name       = "tfstatedevops"
  key                  = "dev.terraform.tfstate"
}

}

resource "azurerm_resource_group" "temprg" {
  name     = "tempgitactrg"
  location = "eastus2"
}

resource "azurerm_storage_account" "tempsa" {
  name                     = "gitactsatemj922"
  resource_group_name      = azurerm_resource_group.temprg.name
  location                 = azurerm_resource_group.temprg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
