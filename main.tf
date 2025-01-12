module "resource_group" {
    source = "./modules/resource_group"
    
    rg_location = var.location
    naming_suffix = local.naming_prefix
}