###############################################################################
# TERRAFORM CONFIG
###############################################################################

# ~ --tilde accepted 3.x but not 4.x
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }

  }
}

###############################################################################
# PROVIDERS
###############################################################################

provider "aws" {
  region = var.region
}
