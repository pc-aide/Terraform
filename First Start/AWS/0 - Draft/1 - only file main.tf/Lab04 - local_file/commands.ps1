# Creds
aws configure

# Init
terraform init

# Format Code
terraform fmt

# Validate
terraform validate

# Plan
terraform plan -out "lab.tfplan"

# Deploy
terraform apply "lab.tfplan"

# Destroy
# yes it'll destroy your file: art_of_war.txt
terraform destroy -auto-approve
