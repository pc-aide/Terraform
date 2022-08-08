##########################################
# TERRAFORM
##########################################

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.17.0"
    }
  }
}

##########################################
# PROVIDERS
##########################################

provider "azurerm" {
  features {}
}
