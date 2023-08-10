provider "azurerm" {
  features {}

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
