# Creds
aws configure

# Init
terraform init

# Code Format
terraform fmt

# Validate
terraform validate

# Plan
terraform plan -out "lab.tfplan"

# Deploy
terraform apply lab.tfplan

# Destroy
terraform destroy -auto-approve
