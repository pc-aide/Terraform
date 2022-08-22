resource "azurerm_network_security_group" "sg_rdp" {
  name                = var.sg_name
  location            = var.location
  resource_group_name = var.rg_name

  # rule
  security_rule {
    name                       = "Allow Inbound RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    source_address_prefix      = var.src_add_prefix
    destination_port_range     = "3389"
    destination_address_prefix = "*"
    description                = "Allow inbound RDP"
  }

  depends_on = [azurerm_resource_group.rg_terraform]
}
