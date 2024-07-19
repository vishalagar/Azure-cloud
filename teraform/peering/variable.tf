variable "vnet_peering_connections" {
  type = map(object({
    name                      = string
    resource_group_name       = string
    virtual_network_name      = string
    remote_virtual_network_id = string
    allow_forwarded_traffic   = optional(bool)
    allow_gateway_transit     = optional(bool)
    use_remote_gateways       = optional(bool)
  }))
}