# if we start a new VM, we need Plan again m3 (m3/<Lab01 - Import Resources/>)
# for later (ref: Ln72)

## Now it's time to deploy our local Consul server node
## Download the consul executable from https://www.consul.io/downloads

# create folders for consul (new command)
mkdir -p m4\consul\data

# Go into the consul subfolder in m4
cd m4\consul

# Launch consul server instance (local) - it's a service, so il will running background
# Open second terminal
consul agent -bootstrap -config-file="config/consul-config.hcl" -bind="127.0.0.1"

# Open a separate terminal window to run the rest of the commands
# Make sure you are back in the m4/consul directory
cd m4\consul

# Generate the bootstrap token
# acl - access control - ref: loopback 127.0.0.1:8500
# record this info in notepad.exe
consul acl bootstrap

# Set CONSUL_TOKEN to SecretID

# Linux and MacOS
#export CONSUL_HTTP_TOKEN=SECRETID_VALUE

# Windows - SecretID - loopback 127.0.0.1:8500 (local)
$env:CONSUL_HTTP_TOKEN = "7293c300-c510-51d2-a244-5bc90d3ff4a8"

## Now we're going to configure Consul using Terraform 
# Set up paths, policies, and tokens
terraform init
terraform plan -out consul.tfplan
# Record secretID of mary & sally (notepad.exe)
terraform apply consul.tfplan

# Get token values for Mary & Sally & record them for later (eg. notepad)
consul acl token read -id fa04876a-c032-4fe9-0ff5-d118974cf061
consul acl token read -id ac0e3b3a-2818-7124-3061-c3d5df66a21c

# web browser <url_consul_local>
# log in <SecretID> = CONSUL_HTTP_TOKEN
msEdge 127.0.0.1:8500

# Go back to the main m4 folder
cd ..

## Now let's set up the Consul backend and migrate the state

# Copy backend.tf to m3 folder (m3/<Lab01 - Import Resources/>)
# (optional): to download <Lab01 - Import Resources>/ folder : https://download-directory.github.io/
cp backend.tf ..\m3\backend.tf

# Move to the m3 folder
cd ..\m3

# Now let's set the Consul token to Mary Moe
# Replace SECRETID_VALUE with Mary Moe's secret ID
# Linux and MacOS
# export CONSUL_HTTP_TOKEN=SECRETID_VALUE

# Windows : SecretID - Mary Moe
$env:CONSUL_HTTP_TOKEN = "dab2b31e-85ae-66fa-34fe-3256f6128996"

# Now we can initialize the backend config
# path = ref = *\consul\main.tf
terraform init -backend-config="path=networking/state/globo-primary"
# after that, our m3\terraform.tfstate will be empty - migration
# all it's now in m4\terraform.tfstate
# if we check again msEdge http://127.0.0.1:8500/ui/dc1/kv/networking/state/
# we can see Name = globo-primary - it's terraform.tfstate

# Change the enable_nat_gateway to true in the resources.tf file

# Now run terraform plan and apply
#terraform plan -out nat.tfplan
#terraform apply nat.tfplan

# Open a second terminal
# Export the Consul token again
# Try to run a terraform plan
#terraform plan

# You can stop your Consul instance if you want now, or leave it running
# for the next module

# We are going to keep using the infrastructure in AWS for m5, so don't destroy it!
