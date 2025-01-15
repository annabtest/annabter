resource "azurerm_firewall" "firewall" {
  name                = "azfw_${var.naming_suffix}"
  location            = var.location
  resource_group_name = var.rg_name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.subnet_id
    public_ip_address_id = var.pip_id
  }
}
