billing_code = "ACCT8675309"
project      = "globo-web-app"

# terraform workspace
vpc_cidr_block = {
  Developement = "10.0.0.0/16"
  # UAT - User Acceptance Testing
  UAT          = "10.1.0.0/16"
  Production   = "10.2.0.0/16"
}

# ref: variables.tf
vpc_subnet_count = {
  Developement = 2
  UAT          = 2
  Production   = 3
}

# ref : variables.tf
instance_count = {
  Developement = 2
  UAT          = 4
  Production   = 6
}

# ref : variables.tf
instance_type = {
  Developement = "t2.micro"
  UAT          = "t2.small"
  Production   = "t2.medium"
}
