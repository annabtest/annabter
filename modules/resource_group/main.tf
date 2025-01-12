resource "azurerm_resource_group" "resource_group" {
  name     = "rg_${var.naming_suffix}"
  location = var.location
}