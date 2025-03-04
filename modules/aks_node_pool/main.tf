resource "azurerm_kubernetes_cluster_node_pool" "node_pool" {
  zones                 = [3]
  kubernetes_cluster_id = var.kubernetes_cluster_id
  max_count             = 1
  min_count             = 1
  mode                  = "User"
  name                  = "${var.os_type}${var.name_suffix}"
  orchestrator_version  = var.kubernetes_version
  os_type               = var.Os_type
  vm_size               = "Standard_DS2_v2"
  auto_scaling_enabled   = true
  upgrade_settings {
    max_surge = "10%"
  }

}
