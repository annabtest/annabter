resource "azurerm_resource_group" "resource_group" {
  name     = "${var.naming_prefix}-${var.naming_suffix}"
  location = var.location
}
