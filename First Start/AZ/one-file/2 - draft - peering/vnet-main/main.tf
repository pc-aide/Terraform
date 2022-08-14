############################################
# TERRAFORM
############################################

terraform {
  required_version = "~>1.2.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.17.0"
    }
  }
}

############################################
# PROVIDERS
############################################

provider "azurerm" {
  # default behaviours (all features enabled)
  features {}
  # By default, Terraform will attempt to register any Resource Providers that it supports, even if they're not used in your configurations to be able to display more helpful error messages. If you're running in an environment with restricted permissions, or wish to manage Resource Provider Registration outside of Terraform you may wish to disable this flag
  skip_provider_registration = true
}

############################################
# VARIABLES
############################################

variable "rg_name" {
  type    = string
  default = "rg-main"
}

variable "location" {
  type    = string
  default = "canadacentral"
}

variable "vnet_cidr_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "vnet_cidr_name" {
  type    = string
  default = "vnet-main"
}

variable "subnet_prefixes" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "subnet_names" {
  type    = list(string)
  default = ["web", "db"]
}

############################################
# RESOURCES
############################################

resource "azurerm_resource_group" "rg_main" {
  name     = var.rg_name
  location = var.location
}

module "vnet-main" {
  source              = "Azure/vnet/azurerm"
  version             = "~>2.7.0"
  resource_group_name = var.rg_name
  # vnet
  address_space = var.vnet_cidr_space
  vnet_name     = var.vnet_cidr_name
  # subnets
  subnet_prefixes = var.subnet_prefixes
  subnet_names    = var.subnet_names
  # security groups
  nsg_ids = {}

  tags = {
    environment = "lab"
  }
  # rg must exist first - creating a vnet
  depends_on = [azurerm_resource_group.rg_main]
}

############################################
# OUTPUTS
############################################

output "subnet_id_with_brackets" {
  value = module.vnet-main.vnet_subnets
}
