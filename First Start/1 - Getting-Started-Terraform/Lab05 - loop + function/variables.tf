variable "naming_prefix" {
  type        = string
  description = "Naming prefix for all resources"
  default     = "globoWeb"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

# Loop
variable "vpc_subnet_count" {
  type        = number
  description = "Number of subnets to create"
  default     = 2
}

variable "vpc_subnets_cidr_block" {
  type        = list(string)
  description = "CIDR Block for Subnets for VPC"
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Map a public IP address for Subnet instances"
  default     = true
}

# Loop
variable "instance_count" {
  type        = number
  description = "Number of instances to create in VPC"
  default     = 2
}

variable "instance_type" {
  type    = string
  default = "t2.medium"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostname in VPC"
  default     = true
}

variable "billing_code" {
  type        = string
  description = "Billing code for resource tagging"
}

variable "company" {
  type        = string
  description = "Company name for resource tagging"
  default     = "Globomantics"
}

variable "project" {
  type        = string
  description = "Project name for resource tagging"
}
