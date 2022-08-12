# account cleanUp
az account clear

# creds
($email = read-host "email: ") -and (az login -u $email)

# code format
terraform fmt -recursive

# init
terraform init

# validate
terraform validate

# graph with graphviz (dot)
# terraform graph | dot -Tsvg --to test if command working
terraform graph | dot -Tsvg > graph.svg

# plan
terraform plan -out lab.tfplan

# deploy
terraform apply lab.tfplan

# destroy
terraform destroy -auto-approve
