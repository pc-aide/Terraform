variable "location" {
  type    = string
  default = "canadacentral"
}

variable "rg_name" {
  type    = string
  default = "terraform"
}

# network
variable "vnet_name" {
  type    = string
  default = "vnet"
}

variable "vnet_cidr" {
  type    = string
  default = "10.56.0.0/16"
}

# subnets
variable "public_subnet_prefix" {
  type    = string
  default = "10.56.0.0/24"
}

variable "public_subnet_name" {
  type    = string
  default = "pub_sbnt_10_56_0_0_24"
}

variable "sg_name" {
  type    = string
  default = "vm-sg-nic-rdp"
}

variable "vm_nic" {
  type    = string
  default = "vm-nic"
}

variable "vm_name" {
  type    = string
  default = "vm-terraform"
}

variable "vm_size" {
  type    = string
  default = "Standard_DS3_v2"
}

variable "admin_user" {
  type    = string
  default = "paul"
}

variable "admin_pwd" {
  type      = string
  sensitive = true
}

variable "pip_name" {
  type    = string
  default = "vm-pip"
}

variable "vm_extension" {
  type    = string
  default = "vm-extension"
}

variable "vm_disk" {
  type    = string
  default = "vm-disk"
}