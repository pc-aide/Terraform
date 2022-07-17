variable "region" {
  type    = string
  default = "us-east-1"
}

# VPC1 10.56.0.0/16
variable "cidr_10_56" {
  type        = string
  default     = "10.56.0.0/16"
  description = "cidr block for VPC"
}

# ref: locals.tf
variable "environement" {
  type        = string
  default     = "Dev"
  description = "environement for resource tagging"
}

# ref: locals.tf
variable "team" {
  type        = string
  default     = "Network"
  description = "team for resource tagging"
}

variable "public_subnets" {
  type = list(any)
}

variable "private_subnets" {
  type = list(any)
}

variable "subnet_count" {
  default = 1
}

# ref: intances.tf
variable "instance_count" {
  type        = number
  default     = 1
  description = "Number of instances to create in VPC"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_ami" {
  type = string
  default = "ami-0cff7528ff583bf9a"
  description = "Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type"
}

variable "enable_dns_hostnames" {
  type = bool
  default = true
  description = "Enable DNS hostname in VPC"
}
