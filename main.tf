module "resource_group" {
    source = "./modules/resource_group"
    
    location = var.location
    naming_suffix = local.naming_prefix
}