# format (code)
terraform fmt

# init
terraform init

# Environment variable for sensitive data
$env:AWS_ACCESS_KEY_ID=""
$env:AWS_SECRET_ACCESS_KEY=""

# CheckUp if any error
terraform validate

# plan
terraform plan -out m6.tfplan

# Deploy
terraform apply "m6.tfplan"

# Destroy
terraform destroy
