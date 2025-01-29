### HUB resrources ###

# Step 1: Hub resource group
module "hub_resource_group" {
  source = "./modules/resource_group"

  location      = var.location
  naming_prefix = "rg"
  naming_suffix = local.hub_name_suffix
}

# Step 2: Create log Analytics
module "log_analytics" {
  source = "./modules/log_analytics"

  location      = var.location
  naming_suffix = local.hub_name_suffix
  rg_name       = module.hub_resource_group.rg_name
}

# module "public_ips" {
#   source = "./modules/public_ips"

#   pip_location  = var.location
#   naming_suffix = local.naming_suffix
#   rg_name       = module.hub_resource_group.rg_NAME
# }

# module "hub_network" {
#   source = "./modules/hub_network"

#   location                = var.location
#   rg_name                 = module.hub_resource_group.rg_NAME
#   vnet_name               = "hub_vnet_${local.naming_suffix}"
#   naming_suffix           = local.naming_suffix
#   vnet_address_space      = var.hub_vnet_address_space
#   subnet_address_prefixes = var.azfw_subnet_address_prefixes
#   subnet_name             = var.azfw_subnet_name
#   route_name              = "route_to_internet"
# }

# module "azure_firewall" {
#   source = "./modules/firewall"

#   location      = var.location
#   rg_name       = module.hub_resource_group.rg_NAME
#   naming_suffix = local.naming_suffix
#   pip_id        = module.public_ips.pip_id
#   subnet_id     = module.hub_network.subnet_id
#   loga_id       = module.log_analytics.loga_id
# }

### AKS resources

# Step 1: Create AKS resource group
module "aks_resource_group" {
  source = "./modules/resource_group"

  location      = var.location
  naming_prefix = "rg_aks"
  naming_suffix = local.naming_suffix
}

# Step 1: Create AKS resource group
module "aks_rg" {
  source = "./modules/resource_group"

  location      = var.location
  naming_prefix = "rg"
  naming_suffix = local.name_suffix
}

# Step 2: Create ACR
module "acr" {
  source = "./modules/acr"

  location       = var.location
  resource_group = module.aks_rg.rg_name
  name_suffix    = local.namesuffix
}

# Step 3: Create AKS
module "aks" {
  source = "./modules/aks"

  location           = var.location
  resource_group     = module.aks_rg.rg_name
  name_suffix        = local.name_suffix
  kubernetes_version = data.azurerm_kubernetes_service_versions.current.latest_version
  loga_id            = module.log_analytics.loga_id
}

# Step 4: Create Linux Pool
module "aks_linux_pool" {
  source = "./modules/aks_linux_pool"

  kubernetes_cluster_id = module.aks.aks_id
  name_suffix           = local.namesuffix
  os_type               = "Linux"
  kubernetes_version    = data.azurerm_kubernetes_service_versions.current.latest_version
}

# # Enable if needed: Create Linux Pool
# module "aks_windows_pool" {
#   source = "./modules/aks_linux_pool"

#   kubernetes_cluster_id = module.aks.aks_id
#   name_suffix           = local.namesuffix
#   os_type               = "Windows"
#   kubernetes_version    = data.azurerm_kubernetes_service_versions.current.latest_version
# }

### Resources for Ingress Controller
# Step 5: Create a Static Public IP
module "public_ips" {
  source = "./modules/public_ips"

  pip_location  = var.location
  naming_prefix = "pip-ingress"
  naming_suffix = local.name_suffix
  rg_name       = module.aks.rg_nrg_name
}

# Step 6: Create a DNS Record 
module "dns_a_record_set" {
  source = "./modules/dns_record"

  resource_group = module.aks_rg.rg_name
  zone_name      = "boolanna.com."
  record_name    = var.PROJ_NAME_PUB
  public_ip      = [module.public_ips.pip_address]
}

# module "aks_network" {
#   source = "./modules/network"

#   location                    = var.location
#   rg_name                     = module.aks_resource_group.rg_NAME
#   hub_rg_name                 = module.hub_resource_group.rg_NAME
#   vnet_name                   = "aks_vnet_${local.naming_suffix}"
#   naming_suffix               = local.naming_suffix
#   vnet_address_space          = var.aks_vnet_address_space
#   subnet_address_prefixes     = var.aks_subnet_address_prefixes
#   subnet_name                 = "aks_sub_${local.naming_suffix}"
#   next_hop_in_ip_address      = module.azure_firewall.firewall_private_ip
#   next_hop_type               = "VirtualAppliance"
#   remote_virtual_network_id   = module.hub_network.hub_vnet_id
#   remote_virtual_network_name = module.hub_network.hub_vnet_name
# }



