# account cleanUp
az account clear

# creds
read -p "Your email: " email && az login -u $email

# code format
terraform fmt -recursive

# init
terraform init

# validate
terraform validate

# plan
terraform plan -out lab.tfplan

# deploy
terraform apply lab.tfplan

# destroy
terraform destroy -auto-approve