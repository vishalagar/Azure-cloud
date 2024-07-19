resource "azurerm_virtual_network_peering" "virtual_network_peering" {
  for_each                  = var.vnet_peering_connections
  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
  virtual_network_name      = each.value.virtual_network_name
  remote_virtual_network_id = each.value.remote_virtual_network_id
  allow_forwarded_traffic   = each.value.allow_forwarded_traffic
  allow_gateway_transit     = each.value.allow_gateway_transit
  use_remote_gateways       = each.value.use_remote_gateways
  lifecycle {
    ignore_changes = [ allow_gateway_transit, use_remote_gateways]
  }
}