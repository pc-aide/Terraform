$Plan = "Lab02 - 2x VPC"

# Creds
aws configure --profile "Lab02 - 2x VPC"

# Init
terraform init

# Validate
terraform validate

# Code format 
terraform fmt -recursive

# Plan
terraform plan -out "$Plan.tfplan"

# Deploy
terraform apply "$Plan.tfplan"

# Destroy
terraform destroy -auto-approve
