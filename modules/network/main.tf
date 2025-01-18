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
  name                = "rt_${var.naming_suffix}"
  location            = var.location
  resource_group_name = var.rg_name

  route {
    name                   = "route_${var.naming_suffix}"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = var.next_hop_type
    next_hop_in_ip_address = var.next_hop_in_ip_address
  }
}

resource "azurerm_subnet_route_table_association" "subnet_route" {
  subnet_id      = azurerm_subnet.subnet.id
  route_table_id = azurerm_route_table.route_table.id
}

resource "azurerm_virtual_network_peering" "vnet_to_hub" {
  name                      = "peer-${azurerm_virtual_network.virtual_network.name}-to-hub"
  resource_group_name       = var.aks_rg_name
  virtual_network_name      = azurerm_virtual_network.virtual_network.name
  remote_virtual_network_id = var.remote_virtual_network_id
  allow_forwarded_traffic   = true
  # use_remote_gateways       = true
}

resource "azurerm_virtual_network_peering" "hub_to_vnet" {
  name                      = "peer-${var.remote_virtual_network_name}-to-${azurerm_virtual_network.virtual_network.name}"
  resource_group_name       = var.hub_rg_name
  virtual_network_name      = var.remote_virtual_network_name
  remote_virtual_network_id = azurerm_virtual_network.virtual_network.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = true
}
