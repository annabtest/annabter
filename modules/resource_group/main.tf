resource "azurerm_resource_group" "resource_group" {
  name     = "${var.naming_prefix}_${var.naming_suffix}"
  location = var.rg_location
}
