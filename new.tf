provider "azurerm" {
features{}
}

resource "azurerm_resource_group" "example" {
  name     = "exam"
  location = "West Europe"
}

resource "azurerm_resource_group" "example1" {
  name     = "exam33"
  location = "West Europe"
}


