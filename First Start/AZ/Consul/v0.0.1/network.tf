module "vnet" {
  source  = "Azure/vnet/azurerm"
  version = "~>2.7.0"

  resource_group_name = var.rg_name
  # vnet
  address_space = var.cidr_space
  vnet_name     = var.cidr_name
  # subnets
  subnet_prefixes = var.subnet_prefixes
  subnet_names    = var.subnet_names

  depends_on = [
    azurerm_resource_group.rg_name
  ]
}

# vm-pip
resource "azurerm_public_ip" "pip" {
  name                = var.pip_name
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Dynamic"
  # dns name
  domain_name_label = var.vm_name

  depends_on = [
    azurerm_resource_group.rg_name
  ]
}

# vm-nic
resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  resource_group_name = var.rg_name
  location            = var.location

  ip_configuration {
    name                          = "external"
    subnet_id                     = module.vnet.vnet_subnets[0]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

# nic-sg-association
resource "azurerm_network_interface_security_group_association" "nic_sg_asso" {
  network_security_group_id = azurerm_network_security_group.sg_rdp.id
  network_interface_id      = azurerm_network_interface.nic.id
}
