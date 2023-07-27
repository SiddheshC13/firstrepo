provider "azurerm" {
  features {}
  subscription_id = "754a1399-426f-48cf-aa53-609abfb947db"
  client_id       = "a199cec1-24a2-46d1-8ef4-9ca2630b8674"
  client_secret   = "OBh8Q~5.xRLtkh4yHDDKUYcgqGfTEWnYlq63CaX3"
  tenant_id       = "21824c05-eff6-477c-ba01-6443c7bba628"
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources1"
  location = "West Europe"
}

variable "mywk" {
    type = map
  default = {
    default = "LRS"
    dev="GRS"
    prod="ZRS"
   
  }
}

resource "azurerm_storage_account" "example" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = lookup(var.mywk,terraform.workspace)

  tags = {
    environment = "staging"
  }
}