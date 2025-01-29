resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-${var.name_suffix}"
  location            = var.location
  resource_group_name = var.resource_group
  dns_prefix          = "aks-${var.name_suffix}"
  kubernetes_version  = var.kubernetes_version
  node_resource_group = "aks-nrg-${var.name_suffix}"

  default_node_pool {
    name       = "systempool"
    node_count = 1
    vm_size    = "Standard_D2pls_v6"
    orchestrator_version = var.kubernetes_version
    zones = [1]
    max_count = 1
    min_count = 1
  }

  identity {
    type = "SystemAssigned"
  }

  oms_agent {
    log_analytics_workspace_id = var.loga_id
  }

  network_profile {
    network_plugin = "azure"
  }
}