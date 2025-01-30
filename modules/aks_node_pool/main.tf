resource "azurerm_kubernetes_cluster_node_pool" "node_pool" {
  zones                 = [3]
  kubernetes_cluster_id = var.kubernetes_cluster_id
  max_count             = null
  min_count             = null
  mode                  = "User"
  name                  = "${var.os_type}${var.name_suffix}"
  orchestrator_version  = var.kubernetes_version
  os_type               = var.os_type
  vm_size               = "Standard_DS2_v2"
  upgrade_settings {
    max_surge = "10%"
  }

}
