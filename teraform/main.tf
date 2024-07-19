
module "vnet1" {
    source = "./vnet"
    resource = "rg-testing-dev-ci-01"
    vn-net-name = "vnet-test"
    address-space = ["10.0.0.0/16"]
    subnet1 = "default"
    subnet-address1 = "10.0.1.0/24"
    subnet2 = "subnet2"
    subnet-address2 = "10.0.2.0/24"
}

module "vnet2" {
    source = "./vnet"
    resource = "rg-testing-dev-ci-01"
    vn-net-name = "vnet-prod"
    address-space = ["10.1.0.0/16"]
    subnet1 = "default"
    subnet-address1 = "10.1.1.0/24"
    subnet2 = "AzureBastionSubnet"
    subnet-address2 = "10.1.2.0/24"

}

module "vnet3" {
    source = "./vnet"
    resource = "rg-testing-dev-ci-01"
    vn-net-name = "vnet-nonprod"
    address-space = ["10.2.0.0/16"]
    subnet1 = "default"
    subnet-address1 = "10.2.1.0/24"
    subnet2 = "subnet2"
    subnet-address2 = "10.2.2.0/24"
}



module "vm1a" {
    source = "./vm"
    subnet-name = "default"
    vn-name = "vnet-test"
    rg-name = "rg-testing-dev-ci-01"
    vm-name = "vm1a"
    nic-name = "nic-vm1a"
}

module "vm1b" {
    source = "./vm"
    subnet-name = "subnet2"
    vn-name = "vnet-test"
    rg-name = "rg-testing-dev-ci-01"
    vm-name = "vm1b"
    nic-name = "nic-vm1b"
}

module "vm2a" {
    source = "./vm"
    subnet-name = "default"
    vn-name = "vnet-prod"
    rg-name = "rg-testing-dev-ci-01"
    vm-name = "vm2a"
    nic-name = "nic-vm2a"
}

module "vm2b" {
    source = "./vm"
    subnet-name = "AzureBastionSubnet"
    vn-name = "vnet-prod"
    rg-name = "rg-testing-dev-ci-01"
    vm-name = "vm2b"
    nic-name = "AzureBastionSubnet"
}

module "vm3a" {
    source = "./vm"
    subnet-name = "default"
    vn-name = "vnet-nonprod"
    rg-name = "rg-testing-dev-ci-01"
    vm-name = "vm3a"
    nic-name = "nic-vm3"
}

module "peering1" {
    source = "./peering"
    vnet_peering_connections = {
      "peering1" = {
        name = "prod-to-nonprod"
        resource_group_name = "rg-testing-dev-ci-01"
        virtual_network_name = "vnet-prod"
        remote_virtual_network_id = "/subscriptions/b4401848-2108-40d4-880d-2c20c49bfffa/resourceGroups/rg-testing-dev-ci-01/providers/Microsoft.Network/virtualNetworks/vnet-nonprod"
      },
      "peering2" = {
        name = "prod-to-test"
        resource_group_name = "rg-testing-dev-ci-01"
        virtual_network_name = "vnet-prod"
        remote_virtual_network_id = "/subscriptions/b4401848-2108-40d4-880d-2c20c49bfffa/resourceGroups/rg-testing-dev-ci-01/providers/Microsoft.Network/virtualNetworks/vnet-test"
      },
      "peering3" = {
        name = "non-prod-to-prod"
        resource_group_name = "rg-testing-dev-ci-01"
        virtual_network_name = "vnet-nonprod"
        remote_virtual_network_id = "/subscriptions/b4401848-2108-40d4-880d-2c20c49bfffa/resourceGroups/rg-testing-dev-ci-01/providers/Microsoft.Network/virtualNetworks/vnet-prod"
        allow_forwarded_traffic = true
      },
      "peering4" = {
        name = "test-to-prod"
        resource_group_name = "rg-testing-dev-ci-01"
        virtual_network_name = "vnet-test"
        remote_virtual_network_id = "/subscriptions/b4401848-2108-40d4-880d-2c20c49bfffa/resourceGroups/rg-testing-dev-ci-01/providers/Microsoft.Network/virtualNetworks/vnet-prod"
        allow_forwarded_traffic = true
      },
    }
}

module "bastion_a1" {
    source = "./bastion"
    resource_group_name = "rg-testing-dev-ci-01"
    location = "centralindia"
    subnet_name = "AzureBastionSubnet"
    vnet_name = "vnet-prod"
    pip_name = "bastion_pip"
    bst_name = "prod_bastion"
    sku = "Basic"
    scale_units = 2
    tags = {
      terraform = 1 
    }
}