# account cleanUp
az account clear

# creds
read -p "Your email: " email
az login -u $email

# code format
terraform fmt

# init
terraform init

# validate
terraform validate

# plan
terraform plan -out lab.tfplan

# deploy
terraform deploy lab.tfplan
