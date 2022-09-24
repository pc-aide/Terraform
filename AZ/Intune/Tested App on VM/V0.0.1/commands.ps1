# CleanUp
az account clear

# Creds
read -p "Your email: " email && az login -u $email

# Init
terraform init

# Deploy
terraform apply -auto-approve

# Destroy
terraform destroy -auto-approve
