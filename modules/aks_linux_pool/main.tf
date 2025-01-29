resource "azurerm_kubernetes_cluster_node_pool" "linux_pool" {
  zones                 = [1]
  kubernetes_cluster_id = var.kubernetes_cluster_id
  max_count             = null
  min_count             = null
  mode                  = "User"
  name                  = "linux${var.name_suffix}"
  orchestrator_version  = var.kubernetes_version
  os_type               = var.os_type
  vm_size               = "Standard_DS2_v2"
}