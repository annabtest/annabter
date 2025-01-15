module "resource_group" {
    source = "./modules/resource_group"
    
    rg_location = var.location
    naming_suffix = local.naming_suffix
}

module "public_ips" {
    source = "./modules/public_ips"

    pip_location = var.location
    naming_suffix = local.naming_suffix
    rg_name = module.resource_group.rg_NAME
}

module "hub_network" {
  source = "./modules/network"
  
  location = var.location
  rg_name = "hub_${module.resource_group.rg_NAME}"
  vnet_name = "hub_vnet_${local.naming_suffix}"
  naming_suffix = local.naming_suffix
  vnet_address_space = var.hub_vnet_address_space
  subnet_address_prefixes = var.azfw_subnet_address_prefixes
  subnet_name = var.azfw_subnet_name
}
