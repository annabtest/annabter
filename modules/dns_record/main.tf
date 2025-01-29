resource "dns_a_record_set" "record" {
  zone      = var.zone_name
  name      = var.record_name
  addresses = var.public_ip
}
