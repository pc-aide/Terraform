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

# graph with graphviz (dot)
terraform graph | dot -Tsvg > graph.svg

# plan
terraform plan -out lab.tfplan

# deploy
# (opt) : TF_VAR admin_pwd=
terraform apply lab.tfplan
terraform apply -auto-approve

# update vm-extension
terraform apply -auto-approve -replace="azurerm_windows_virtual_machine.vm_consul"

# destroy
terraform destroy -auto-approve
