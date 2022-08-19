########################################################
# TERRAFORM
########################################################

terraform {
  required_version = "~>1.2.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.19.0"
    }
  }
}

########################################################
# PROVIDERS
########################################################

provider "azurerm" {
  features {}
  skip_provider_registration = true
}
