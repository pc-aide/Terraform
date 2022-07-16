# Init
terraform init

# Console
terraform console
# 1) Number of the subnets
range(var.vpc_subnet_count)
# 2) public_subnets in network.tf
[for subnet in range(var.vpc_subnet_count) : cidrsubnet(var.vpc_cidr_block, 8, subnet)]

# Format (code)
# recursive --subFolder
terraform fmt -recursive

# Environment variable for sensitive data
$env:AWS_ACCESS_KEY_ID = ""
$env:AWS_SECRET_ACCESS_KEY = ""

# CheckUp if any error
terraform validate

# plan
terraform plan -out m8.tfplan

# Deploy
terraform apply "m8.tfplan"

# Destroy
terraform destroy
