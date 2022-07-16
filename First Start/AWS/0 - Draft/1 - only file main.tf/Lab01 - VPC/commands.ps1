# Creds
aws configure --profile "Lab01-VPC"

# Env var Creds
$env:AWS_PROFILE="Lab01-VPC"

# Init
terraform init

# Validate
terraform validate

# Code format 
terraform fmt -recursive

# Plan
terraform plan -out "Lab01-VPC.tfplan"

# Deploy
terraform apply "Lab01-VPC.tfplan"

# Destroy
terraform destroy -auto-approve
