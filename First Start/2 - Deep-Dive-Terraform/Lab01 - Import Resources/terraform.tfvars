# To commented Ln4 & Ln6 after script Jimmy PowerShell
# Attribute redefined: The argument "public_subnets" was already set at terraform.tfvars:3,1-15. Each argument may be set only once.HCL :

private_subnets = ["10.0.10.0/24", "10.0.11.0/24"]

public_subnets = ["10.0.0.0/24", "10.0.1.0/24"]

subnet_count = 2

# Use these for the import update (after the script's Jimmy )

# private_subnets = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]

# public_subnets = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]

# subnet_count = 3
