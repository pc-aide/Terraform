# init
terraform init

# If want to pass all var (not pratique for acces key & secret key for log & output)
terraform plan -var=billing_code="ACCT8675309" -var=project="web-app" -var=aws_access_key="YOUR_ACCESS_KEY" -var=aws_secret_key="YOUR_SECRET_KEY" -out m4.tfplan

# Environment variable for sensitive data (Linux)
export TF_VAR_aws_access_key=YOUR_ACCESS_KEY
export TF_VAR_aws_secret_key=YOUR_SECRET_KEY

# Environment variable for sensitive data (Windows)
$env:TF_VAR_access_key=""
$env:TF_VAR_secret_key=""

# CheckUp if any error in main.tf
# If findOut any errors, juste init again & validate after
terraform validate

# plan
terraform plan -out m4.tfplan

# Deploy
terraform apply "m4.tfplan"

# Destroy
terraform destroy
