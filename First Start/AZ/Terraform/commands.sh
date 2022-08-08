# account cleanUp
az account clear

# creds
read -p "Your email: " email
az login -u $email


# init
terraform init

# plan
terraform plan -out lab.tfplan

# deploy
terraform deploy lab.tfplan
