resource "azurerm_kubernetes_cluster_node_pool" "linux_pool" {
  zones                 = [1]
  enable_auto_scaling   = false
  kubernetes_cluster_id = var.kubernetes_cluster_id
  max_count             = 1
  min_count             = 1
  mode                  = "User"
  name                  = "linux-pool-${var.name_suffix}"
  orchestrator_version  = var.kubernetes_version
  os_type               = var.os_type
  vm_size               = "Standard_DS2_v2"
}