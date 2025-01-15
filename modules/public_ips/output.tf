output "pip_address" {
  value = azurerm_public_ip.public_ip.ip_address
}

output "pip_id" {
  value = azurerm_public_ip.public_ip.id
}
