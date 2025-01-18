module "hub_resource_group" {
  source = "./modules/resource_group"

  rg_location   = var.location
  naming_prefix = "rg_hub"
  naming_suffix = local.naming_suffix
}

module "public_ips" {
  source = "./modules/public_ips"

  pip_location  = var.location
  naming_suffix = local.naming_suffix
  rg_name       = module.hub_resource_group.rg_NAME
}

module "hub_network" {
  source = "./modules/hub_network"

  location                = var.location
  rg_name                 = module.hub_resource_group.rg_NAME
  vnet_name               = "hub_vnet_${local.naming_suffix}"
  naming_suffix           = local.naming_suffix
  vnet_address_space      = var.hub_vnet_address_space
  subnet_address_prefixes = var.azfw_subnet_address_prefixes
  subnet_name             = var.azfw_subnet_name
  route_name              = "route_to_internet"
}

module "azure_firewall" {
  source = "./modules/firewall"

  location      = var.location
  rg_name       = module.hub_resource_group.rg_NAME
  naming_suffix = local.naming_suffix
  pip_id        = module.public_ips.pip_id
  subnet_id     = module.hub_network.subnet_id
}

module "aks_resource_group" {
  source = "./modules/resource_group"

  rg_location   = var.location
  naming_prefix = "rg_aks"
  naming_suffix = local.naming_suffix
}

module "aks_network" {
  source = "./modules/network"

  location                = var.location
  rg_name                 = module.aks_resource_group.rg_NAME
  vnet_name               = "aks_vnet_${local.naming_suffix}"
  naming_suffix           = local.naming_suffix
  vnet_address_space      = var.aks_vnet_address_space
  subnet_address_prefixes = var.aks_subnet_address_prefixes
  subnet_name             = "aks_sub_${local.naming_suffix}"
  next_hop_in_ip_address = module.azure_firewall.firewall_private_ip
  next_hop_type = "VirtualAppliance"
  remote_virtual_network_id = module.hub_network.hub_vnet_id
  remote_virtual_network_name = module.hub_network.hub_vnet_name
}
