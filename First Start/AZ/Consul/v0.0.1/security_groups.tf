resource "azurerm_network_security_group" "sg_rdp" {
  name                = var.sg_rdp
  location            = var.location
  resource_group_name = var.rg_name

  # Rule
  security_rule {
    name                       = var.sec_rule_name
    access                     = "Allow"
    description                = "Allow RDP Inbound"
    direction                  = "Inbound"
    protocol                   = "Tcp"
    destination_address_prefix = "*"
    destination_port_range     = "3389"
    priority                   = 100
    source_address_prefix      = "*"
    source_port_range          = "*"
  }

  depends_on = [
    azurerm_resource_group.rg_name
  ]
}
