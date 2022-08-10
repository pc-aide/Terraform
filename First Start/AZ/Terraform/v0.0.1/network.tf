# vnet
resource "azurerm_virtual_network" "vnet" {
  # we can use there a local value for that
  location            = var.location
  resource_group_name = var.rg_name

  # cidr
  name          = var.vnet_name
  address_space = [var.vnet_cidr]
}

# public subnet
resource "azurerm_subnet" "public_subnet" {
  name                = var.public_subnet_name
  resource_group_name = var.rg_name

  # vnet
  virtual_network_name = azurerm_virtual_network.vnet.name

  # add prefix
  address_prefixes = [var.public_subnet_prefix]
}

# public ip
resource "azurerm_public_ip" "pip_vm" {
  name                = var.pip_name
  resource_group_name = var.rg_name
  location            = var.location

  allocation_method = "Dynamic"

  domain_name_label = var.vm_name
}

# vm-nic
resource "azurerm_network_interface" "vm_nic" {
  name                = var.vm_nic
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "external"
    subnet_id                     = azurerm_subnet.public_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip_vm.id
  }
}

# nic-sg-association
resource "azurerm_network_interface_security_group_association" "nic_sg" {
  network_interface_id      = azurerm_network_interface.vm_nic.id
  network_security_group_id = azurerm_network_security_group.sg_rdp.id
}