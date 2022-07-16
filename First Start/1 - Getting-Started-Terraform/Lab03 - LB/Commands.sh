# init
terraform init

# Environment variable for sensitive data (Windows)
$env:TF_VAR_access_key=""
$env:TF_VAR_secret_key=""

# CheckUp if any error in main.tf
# If findOut any errors, juste init again & validate after
terraform validate

# plan
terraform plan -out m5.tfplan

# Deploy
terraform apply "m5.tfplan"

# if change outputs instance -> alb_dns
terraform apply -auto-approve

# Destroy
terraform destroy
