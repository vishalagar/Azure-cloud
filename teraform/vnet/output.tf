output "id" {
  value = data.azurerm_resource_group.rg.id
}

output "vnet_id" {
  description = "The ID of the vNet."
  value       = azurerm_virtual_network.example.id
}