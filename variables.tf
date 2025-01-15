variable "client_id" {
  type    = string
  default = "a3827f98-17f7-4d7d-9d12-fd70b34c65fe"
}

variable "client_secret" {
  type    = string
  default = "Bps8Q~WM.QgY~hZ9JZ~lBMMdT~lopP3htbJN1bOR"
}

variable "subscription_id" {
  type    = string
  default = "80b6af06-ee48-49d6-9a29-31835d24d625"
}

variable "tenant_id" {
  type    = string
  default = "dc00758b-d159-4ec1-965d-31eafd5a603e"
}

# Naming Convention Values
variable "region_code" {
  type = string
}

variable "envioronment" {
  type = string
}

variable "department" {
  type = string
}

# General Properties
variable "location" {
  type = string
}



# Network Configuration
variable "hub_vnet_address_space" {
  type = list(string)
}

variable "azfw_subnet_address_prefixes" {
  type = list(string)
}

variable "azfw_subnet_name" {
  type = string
}

