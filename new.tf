provider "azurerm" {
features{}
}

resource "azurerm_resource_group" "example" {
  name     = "exam"
  location = "West Europe"
}
