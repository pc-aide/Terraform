###############################################################################
# TERRAFORM
###############################################################################

terraform {
  # required_version = "~>1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.63.0"
    }
  }
}

provider "aws" {
  profile = "Lab"
  region  = var.region
}
