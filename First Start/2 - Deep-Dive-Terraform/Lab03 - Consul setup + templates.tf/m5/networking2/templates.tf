data "template_file" "public_cidrsubnet" {
  count = local.subnet_count
  # 8 (IN) -> 32-24 : cidr_block (public) = 10.0.2.0/24 (Output)
  template = "$${cidrsubnet(vpc_cidr,8,current_count)}"

  vars = {
    vpc_cidr      = local.cidr_block
    current_count = count.index
  }
}

data "template_file" "private_cidrsubnet" {
  count = local.subnet_count

  template = "$${cidrsubnet(vpc_cidr,8,current_count)}"

  vars = {
    vpc_cidr      = local.cidr_block
    current_count = count.index + 10
  }
}
