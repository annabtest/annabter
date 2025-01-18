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

# Enable diagnostic settings for the Azure Firewall
resource "azurerm_monitor_diagnostic_setting" "diagset" {
  name                       = "diagset_${var.naming_suffix}"
  target_resource_id         = azurerm_firewall.firewall.id
  log_analytics_workspace_id = var.loga_id

#   enabled_log {
#     category = ["AzureFirewallApplicationRule","AzureFirewallNetworkRule","AzureFirewallDNATRule","AzureFirewallThreatIntelRule","AzureFirewallApplicationRuleAlert","AzureFirewallNetworkRuleAlert"]
#   }

  enabled_log {
    category = "AzureFirewallApplicationRule"
  }

  enabled_log {
    category = "AzureFirewallNetworkRule"
  }

  # Enable metrics
  metric {
    category = "AllMetrics"
    enabled  = true
  }
}
