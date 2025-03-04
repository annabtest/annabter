resource "azurerm_dns_a_record" "record" {
  name                = var.record_name
  resource_group_name = var.resource_group
  zone_name           = var.zone_name
  ttl                 = 300
  records             = var.public_ip
}
