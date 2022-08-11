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
# dot -V --to test if command working
# O/P: dot - graphviz version 2.43.0 (0)
terraform graph | dot -Tsvg > graph.svg

# plan
terraform plan -out lab.tfplan

# deploy
terraform apply lab.tfplan

# destroy
terraform destroy -auto-approve
