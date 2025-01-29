# variable "ARM_CLIENT_ID" {
#   type    = string
# }

# variable "ARM_CLIENT_SECRET" {
#   type    = string
# }

# variable "ARM_SUBSCRIPTION_ID" {
#   type    = string
# }

# variable "tenant_id" {
#   type    = string
# }

# Naming Convention Values
variable "region_code" {
  type = string
}

variable "environment" {
  type = string
}

variable "department" {
  type = string
}

# General Properties
variable "location" {
  type = string
}


# HUB Network Configuration
variable "hub_vnet_address_space" {
  type = list(string)
}

variable "azfw_subnet_address_prefixes" {
  type = list(string)
}

variable "azfw_subnet_name" {
  type = string
}

# AKS Network Configuration
variable "aks_vnet_address_space" {
  type = list(string)
}

variable "aks_subnet_address_prefixes" {
  type = list(string)
}


