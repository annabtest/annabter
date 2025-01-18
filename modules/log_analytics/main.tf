resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = "loga-${var.naming_suffix}"
  location            = var.location
  resource_group_name = var.rg_name
}