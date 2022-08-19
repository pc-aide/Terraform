variable "rg_name" {
  type    = string
  default = "rg-consul"
}

variable "location" {
  type    = string
  default = "canadacentral"
}

variable "cidr_space" {
  type    = list(string)
  default = ["10.44.0.0/16"]
}

variable "cidr_name" {
  type    = string
  default = "vnet-consul"
}

variable "subnet_prefixes" {
  type    = list(string)
  default = ["10.44.0.0/24"]
}

variable "subnet_names" {
  type    = list(string)
  default = ["sub_10_44_0_0_24"]
}

variable "sg_rdp" {
  type    = string
  default = "sg-rdp"
}

variable "sec_rule_name" {
  type    = string
  default = "AllowInboundRDP"
}

variable "pip_name" {
  type    = string
  default = "vm-pip"
}

variable "vm_name" {
  type    = string
  default = "vm-consul"
}

variable "nic_name" {
  type    = string
  default = "vm-nic"
}

variable "vm_size" {
  type    = string
  default = "Standard_D2s_v3"
}

variable "admin_username" {
  type    = string
  default = "paul"
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "disk_name" {
  type    = string
  default = "vm-disk"
}

variable "vm_extension" {
  type    = string
  default = "vm-extension"
}
