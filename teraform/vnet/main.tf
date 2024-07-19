data "azurerm_resource_group" "rg" {
  name = var.resource
}

resource "azurerm_virtual_network" "example" {
  name                = var.vn-net-name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = var.address-space

  subnet {
    name           = var.subnet1
    address_prefix = var.subnet-address1
  }
  
  subnet {
    name           = var.subnet2
    address_prefix = var.subnet-address2
  }

}
