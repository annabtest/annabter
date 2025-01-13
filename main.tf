module "resource_group" {
    source = "./modules/resource_group"
    
    rg_location = var.location
    naming_suffix = local.naming_suffix
}

module "public_ips" {
    source "./modules/public_ips"

    pip_location = var.location
    naming_suffix = local.naming_suffix
    rg_name = module.resource_group.rg_NAME
}
