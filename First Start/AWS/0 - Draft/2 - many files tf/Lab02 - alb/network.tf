################################################
# DATA
################################################

data "aws_availability_zones" "azs" {}

################################################
# RESOURCES
################################################

# Networking
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name                 = "VPC1"
  cidr                 = var.cidr_10_56
  enable_dns_hostnames = var.enable_dns_hostnames

  azs             = slice(data.aws_availability_zones.azs.names, 0, var.subnet_count)
  public_subnets  = [for subnet in range(var.subnet_count) : cidrsubnet(var.cidr_10_56, 8, subnet)]
  private_subnets = var.private_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = local.common_tags
}
