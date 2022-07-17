###############################################################################
# DATA
###############################################################################

data "aws_availability_zones" "azs" {

}

###############################################################################
# RESOURCES
###############################################################################

# Networking
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "VPC1"
  cidr = var.cidr_10_56
  enable_dns_hostnames = var.enable_dns_hostnames

  azs             = slice(data.aws_availability_zones.azs.names, 0, var.subnet_count)
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = local.common_tags
}

# Security Groups
resource "aws_security_group" "nginx-sg" {
  name   = "nginx-sg"
  vpc_id = module.vpc.vpc_id

  # Inbound rules
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP any where"
  }

  # Oubount rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all oubound"
  }
  tags = local.common_tags
}
