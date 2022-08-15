###########################################
# VARIABLES
###########################################

# security subscription id
variable "sub_id" {
  type = string
}

# security client id
variable "client_id" {
  type = string
}

# security client secret
variable "client_secret" {
  type = string
}

# security tenant_id
variable "tenant_id" {
  type = string
}

# security vnet_name
variable "vnet_name" {
  type = string
}

# security vnet_id
variable "vnet_id" {
  type = string
}

# security rg_name
variable "rg_name" {
  type = string
}

# security principal id
variable "principal_id" {
  type = string
}

###########################################
# DATA
###########################################

data "azurerm_subscription" "sub" {}

###########################################
# PROVIDERS
###########################################

provider "azurerm" {
  alias                       = "security"
  subscription_id             = var.sub_id
  client_id                   = var.client_id
  client_secret               = var.client_secret
  tenant_id                   = var.tenant_id
  skip_provider_registration  = true
  skip_credentials_validation = true
  features {}
}

provider "azurerm" {
  alias                       = "peering"
  subscription_id             = data.azurerm_subscription.sub.subscription_id
  client_id                   = var.client_id
  client_secret               = var.client_secret
  tenant_id                   = data.azurerm_subscription.sub.tenant_id
  skip_provider_registration  = true
  skip_credentials_validation = true
  features {}
}

###########################################
# RESOURCES
###########################################

resource "azurerm_role_definition" "rol-def" {
  name  = "allow-vnet-peer-main"
  scope = data.azurerm_subscription.sub.id

  permissions {
    actions     = ["Microsoft.Network/virtualNetworks/virtualNetworkPeerings/write", "Microsoft.Network/virtualNetworks/peer/action", "Microsoft.Network/virtualNetworks/virtualNetworkPeerings/read", "Microsoft.Network/virtualNetworks/virtualNetworkPeerings/delete"]
  }

  assignable_scopes = [
    data.azurerm_subscription.sub.id
  ]
}

resource "azurerm_role_assignment" "rol-assign" {
  scope              = module.vnet-main.vnet_id
  role_definition_id = azurerm_role_definition.rol-def
  principal_id       = var.principal_id
}

resource "azurerm_virtual_network_peering" "vnet-peer" {
  name                      = "main_2_sec"
  resource_group_name       = var.rg_name
  virtual_network_name      = module.vnet-main.vnet_name
  remote_virtual_network_id = var.sec_vnet_id
  provider                  = azurerm.peering

  depends_on = [azurerm_role_assignment.vnet]
}

resource "azurerm_virtual_network_peering" "sec" {
  name                      = "sec_2_main"
  resource_group_name       = var.sec_resource_group
  virtual_network_name      = var.sec_vnet_name
  remote_virtual_network_id = module.vnet-main.vnet_id
  provider                  = azurerm.security

  depends_on = [azurerm_role_assignment.vnet]
}
