# CleanUp
az account clear

# Creds
($email = read-host "email: ") -and (az login -u $email)

# Load module,providers,plugings,etc
terraform init

# code format
terraform fmt

# validate
terraform validate

# graph with graphviz (dot)
terraform graph | dot -Tsvg > graph.svg

# plan
terraform plan -var rg_name=lab -out lab.tfplan

# deploy
terraform apply lab.tfplan

# destroy
terraform destroy -auto-approve
