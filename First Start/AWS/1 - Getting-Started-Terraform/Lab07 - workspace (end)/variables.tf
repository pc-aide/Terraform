variable "naming_prefix" {
  type        = string
  description = "Naming prefix for all resources"
  default     = "globoWeb"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

# ref: terraform.tfvars
variable "vpc_cidr_block" {
  type = map(string)
}

# ref: terraform.tfvars
variable "vpc_subnet_count" {
  type        = map(number)
  description = "Number of subnets to create"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Map a public IP address for Subnet instances"
  default     = true
}

# ref : terraform.tfvars
variable "instance_count" {
  type        = map(number)
  description = "Number of instances to create in VPC"
}

# ref : terraform.tfvars
variable "instance_type" {
  type = map(string)
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
