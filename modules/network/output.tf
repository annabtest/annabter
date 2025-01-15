output "vnet_name" {
  value = azurerm_virtual_network.virtual_network.name
}

output "vnet_id" {
  value = azurerm_virtual_network.virtual_network.id
}

output "subnet_name" {
  value = azurerm_subnet.subnet.name
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}
