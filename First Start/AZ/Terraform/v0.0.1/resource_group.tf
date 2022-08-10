resource "azurerm_resource_group" "rg_terraform" {
  name     = var.rg_name
  location = var.location
}