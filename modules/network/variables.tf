variable "location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "vnet_name" {
  type = string
}
variable "naming_suffix" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "subnet_address_prefixes" {
  type = list(string)
}

variable "subnet_name" {
  type = string
}

variable "next_hop_type" {
  type = string
}

variable "next_hop_in_ip_address" {
  type = string
}

variable "remote_virtual_network_id" {
  type = string
}
