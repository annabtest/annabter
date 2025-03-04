resource "azurerm_container_registry" "acr" {
  name                = "acr${var.name_suffix}8"
  resource_group_name = var.resource_group
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}
