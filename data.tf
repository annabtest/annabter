data "azurerm_kubernetes_service_versions" "current" {
  location        = var.location
  include_preview = false
}

data "azurerm_dns_zone" "example" {
  name                = var.DOMAIN_NAME
  resource_group_name = "rg_domain"
}