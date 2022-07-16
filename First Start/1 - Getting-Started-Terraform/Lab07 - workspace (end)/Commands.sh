# Init
terraform init

# Console
terraform console
# 1) which workspace i am ?
# terraform workspace new {default,dev,uat,prod}
terraform.workspace

# Format (code)
terraform fmt -recursive

# Environment variable for sensitive data
$env:AWS_ACCESS_KEY_ID = "AKIAWEXD3XR54SNMK2XL"
$env:AWS_SECRET_ACCESS_KEY = "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"

# CheckUp 
terraform validate

# New workspace 
# default is the value default if not specific
# ref : terraform.tfvars
# creat new file: terraform.tfstate.d\<New workspace>
terraform workspace new Developement
# list
terraform workspace list
# Select to switch to another workspace
terraform workspace select default

# Plan in dev folder
terraform plan -out m9dev.tfplan

# Deploy
terraform apply "m9dev.tfplan"

# UAT - User Acceptance Testing
# workspace : UAT
terraform workspace new UAT

# checkup (pre-fly) 
terraform plan -out m9uat.tfplan
# deploy
terraform apply m9uat.tfplan

# Production - workspace
terraform workspace new Production
# checkup (pre-fly)
terraform plan -out m9prod.tfplan
# deploy
terraform apply m9prod.tfplan

# Destroy via specific workspace <Name>
terraform destroy -auto-approve
