# Creds
aws configure --profile "Lab"

# Init
terraform.exe init

# Validate
terraform.exe validate

# Code format
terraform.exe fmt -recursive

# Plan
terraform.exe plan -out "lab.tfplan"

# Deploy
terraform.exe apply "lab.tfplan"

# Destroy
terraform.exe destroy -auto-approve
