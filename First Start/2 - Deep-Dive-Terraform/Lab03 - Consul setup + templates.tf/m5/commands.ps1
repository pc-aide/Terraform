# Go into consul subfolder
mkdir 5\consul # if not exist, create it into m5 folder
cd .\consul

# We are going to add config data to our Consul installation

# Let's set the Consul token to Mary Moe
# Replace SECRETID_VALUE with Mary Moe's secret ID
# Linux and MacOS
# export CONSUL_HTTP_TOKEN=SECRETID_VALUE

# Windows : Mary Moe's secret ID
$env:CONSUL_HTTP_TOKEN="5ab62123-1b0a-d1e7-2552-efba4cbae5a0"

# Write the configuration data for globo-primary config
# kv --key-value
consul kv put networking/configuration/globo-primary/net_info @globo-primary.json
consul kv put networking/configuration/globo-primary/common_tags @common-tags.json

# m5\consul\CheckUp in {globo-primary.json,common-tags,json}

# Now go up and into the networking folder 
cd ..\networking

# We're going to initialize the Terraform config to use the Consul backend
terraform init -backend-config="path=networking/state/globo-primary"

# Verify our state is loaded (CheckUp)
terraform state list

# Now we'll run a plan using the values stored in Consul.
# There should be NO changes required
terraform plan -out config.tfplan

## Now we'll update our config data to use templates and default tags
# Go into the consul folder
cd ..\consul

# Write new data
consul kv put networking/configuration/globo-primary/net_info @globo-primary-2.json

# CheckUp msEdge <dc1\*\globo-primary/net_info\>

# Go into the networking2 folder
cd ..\networking2

# We're going to initialize the Terraform config to use the Consul backend
terraform init -backend-config="path=networking/state/globo-primary"

# Verify our state is loaded (CheckUp)
terraform state list

# Now we'll run a plan using the values stored in Consul.
# All the tags should be updated
terraform plan -out config.tfplan

# Deploy
terraform apply config.tfplan

# msEdge awsConsole (checkUp) : 
# VPCs\tags
# subnets
# rtb 
# igw
# nat gw

# Destroy
terraform destroy -auto-approve
