variable "access_key" {
  type = string
  sensitive = true
}

variable "secret_key" {
  type = string
  sensitive = true
}

variable "region" {
  type = string
  default = "us-east-1"
}

variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

variable "vpc_subnet1_cidr_block" {
  type        = string
  description = "CIDR Block for Subnet 1 in VPC"
  default     = "10.0.0.0/24"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Map a public IP address for Subnet instances"
  default     = true
}

variable "instance_type" {
  type = string
  default = "t2.medium"
}

variable "enable_dns_hostnames" {
  type = bool
  description = "Enable DNS hostname in VPC"
  default = true
}

variable "billing_code" {
  type = string
  description = "Billing code for resource tagging"
}

variable "company" {
  type = string
  description = "Company name for resource tagging"
  default = "Globomantics"
}

variable "project" {
  type = string
  description = "Project name for resource tagging"
}
