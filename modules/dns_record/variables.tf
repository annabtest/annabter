variable "zone_name" {
  type = string
}

variable "record_name" {
  type = string
}

variable "public_ip" {
  type = list(string)
}

variable "resource_group" {
  type = string
}
