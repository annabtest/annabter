resource "azurerm_public_ip" "example" {
  name                = "pip_${var.naming_suffix}"
  resource_group_name = var.rg_name
  location            = var.pip_location
  allocation_method   = "Static"
}