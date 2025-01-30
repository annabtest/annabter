output "aks_id" {
  value = azurerm_kubernetes_cluster.aks.id
}

output "rg_nrg_name" {
  value = azurerm_kubernetes_cluster.aks.node_resource_group
}

output "sid_id" {
  value = azurerm_kubernetes_cluster.aks.identity
}