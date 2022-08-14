###########################################
# TERRAFORM
###########################################

terraform {
  required_version = "~>1.2.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.17.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "~>2.27.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "~>2.2.0"
    }
  }
}

###########################################
# PROVIDERS
###########################################

provider "azurerm" {
  features {}
  # By default, Terraform will attempt to register any Resource Providers that it supports, even if they're not used in your configurations to be able to display more helpful error messages. If you're running in an environment with restricted permissions
  skip_provider_registration = true
}

###########################################
# VARIABLES
###########################################

# sec --security
variable "rg_name_sec" {
  type    = string
  default = "rg-security"
}

variable "location" {
  type    = string
  default = "canadacentral"
}

variable "vnet_cidr_range" {
  type    = list(string)
  default = ["10.1.0.0/16"]
}

variable "vnet_cidr_name" {
  type    = string
  default = "vnet-security"
}

variable "subnet_prefixes" {
  type    = list(string)
  default = ["10.1.0.0/24", "10.1.1.0/24"]
}

variable "subnet_names" {
  type    = list(string)
  default = ["siem", "inspect"]
}

variable "environment" {
  type    = string
  default = "security"
}

variable "role_def_name" {
  type    = string
  default = "allow-vnet-peering"
}

###########################################
# DATA
###########################################

# sub --subscription
data "azurerm_subscription" "sub" {}

###########################################
# RESOURCES
###########################################

# sec --security
resource "azurerm_resource_group" "reg_sec" {
  name     = var.rg_name_sec
  location = var.location
}

# network
# sec --security
module "vnet-sec" {
  source              = "Azure/vnet/azurerm"
  version             = "~>2.7.0"
  resource_group_name = var.rg_name_sec
  # vnet
  vnet_name     = var.vnet_cidr_name
  address_space = var.vnet_cidr_range
  # subnets
  subnet_prefixes = var.subnet_prefixes
  subnet_names    = var.subnet_names
  # security group
  nsg_ids = {}

  tags = {
    environment = var.environment
  }

  depends_on = [
    azurerm_resource_group.reg_sec
  ]
}

# random password
resource "random_password" "ran_pwd" {
  length  = 16
  special = true
}

# aad - Azure AD app
resource "azuread_application" "aad_app" {
  display_name = "aad-app"
}

# sp --service principal 
resource "azuread_service_principal" "sp" {
  application_id = azuread_application.aad_app.application_id
}

# aad_sp_pwd - vnet-peering ?
resource "azuread_service_principal_password" "aad_sp_pwd" {
  service_principal_id = azuread_service_principal.sp.id
  end_date_relative = "17520h"
}

# rol def
resource "azurerm_role_definition" "rol_def" {
  name  = var.role_def_name
  scope = data.azurerm_subscription.sub.id

  permissions {
    # allows\ : 
    #   peering: write,read
    #   peer: action
    actions = ["Microsoft.Network/virtualNetworks/virtualNetworkPeerings/write", "Microsoft.Network/virtualNetworks/virtualNetworkPeerings/read", "Microsoft.Network/virtualNetworks/virtualNetworkPeerings/delete", "Microsoft.Network/virtualNetworks/peer/action"]
  }

  # assign scope
  assignable_scopes = [
    data.azurerm_subscription.sub.id
  ]
}

# role assignment: client
resource "azurerm_role_assignment" "rol_assign" {
  scope              = module.vnet-sec.vnet_id
  role_definition_id = azurerm_role_definition.rol_def.role_definition_resource_id
  # AAD SP --service principal
  principal_id = azuread_service_principal.sp.id
}

###########################################
# FILE OUTPUT 
###########################################

# vm_terraform (ubuntu)
# EOF -End Of File --some data
resource "local_file" "fil_ubu" {
  filename = "${path.module}/file-var-ubu.txt"
  content  = <<EOF
  # vnet
  export TF_VAR_vnet_id=${module.vnet-sec.vnet_id}
  export TF_VAR_vnet_name=${module.vnet-sec.vnet_name}
    
  # peering
  export TF_VAR_sp_application=${azuread_service_principal.sp.application_id}
  export TF_VAR_sp=${azuread_service_principal.sp.id}

  # cred
  export TF_var_ran_pwd='${random_password.ran_pwd.result}'
  
  # subscription
  export TF_var_sub_tenant_id=${data.azurerm_subscription.sub.tenant_id}
  export TF_var_sub_id=${data.azurerm_subscription.sub.subscription_id}

  # rg_name
  export TF_var_rg_name=${var.rg_name_sec}

  EOF
}

###########################################
# OUTPUTS
###########################################

output "aad_subscription_id" {
  value = data.azurerm_subscription.sub.tenant_id
}

output "vnet_id" {
  value = module.vnet-sec.vnet_id
}

output "vnet_name" {
  value = module.vnet-sec.vnet_name
}

output "sp_id" {
  value = azuread_service_principal.sp.id
}

output "sp_ran_pwd" {
  value = nonsensitive(random_password.ran_pwd.result)
}

output "rg_name" {
  value = var.rg_name_sec
}
