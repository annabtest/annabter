resource "azurerm_virtual_network" "virtual_network" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = var.subnet_address_prefixes
}

resource "azurerm_route_table" "route_table" {
  name                = "rt_fw_${var.naming_suffix}"
  location            = var.location
  resource_group_name = var.rg_name

  route {
    name           = var.route_name
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "Internet"
  }
}


resource "azurerm_subnet_route_table_association" "subnet_route" {
  subnet_id      = azurerm_subnet.subnet.id
  route_table_id = azurerm_route_table.route_table.id
}
