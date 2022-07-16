###############################################################################
# VARIABLES
###############################################################################

variable "region" {
  default = "us-east-1"
}

variable "subnet_count" {
  default = 2
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

# Ref: terraform.tfvars
variable "private_subnets" {
  type = list(any)
}

# Ref: terraform.tfvars
variable "public_subnets" {
  type = list(any)
}
