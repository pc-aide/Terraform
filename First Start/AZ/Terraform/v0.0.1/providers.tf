##########################################
# TERRAFORM
##########################################

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.17.0"
    }
  }
}

##########################################
# PROVIDERS
##########################################

provider "azurerm" {
  features {}
  # By default, Terraform will attempt to register any Resource Providers that it supports, even if they're not used in your configurations to be able to display more helpful error messages. If you're running in an environment with restricted permissions, or wish to manage Resource Provider Registration outside of Terraform you may wish to disable this flag; however, please note that the error messages returned from Azure may be confusing as a result (example: API version 2019-01-01 was not found for Microsoft.Foo).
  skip_provider_registration = "true"
}