# You can find the installer info for Terraform here:
# https://www.terraform.io/downloads.html

# doc
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

# First we'll start by making sure Terraform is installed and check out the
# help command baked in to the cli.
terraform version

terraform -help

# Terraform follows the terraform <command> <subcommand> syntax
# Options use a single dash whether it's a single character option
# or full word.

# In this module, we are simply trying to get the configuration deployed.
# First we'll copy our file from the base_web_app to a working directory
mkdir "Lab01 - Intro"


# Now we can work with the main.tf file in globo_web_app
cd "Lab01 - Intro"

# Open the test.tf file in your code editor and replace the values 
# for the AWS keys in the config file


# !! DO NOT COMMIT THESE TO SOURCE CONTROL !!

# Now we will follow the standard Terraform workflow
terraform init
# checkUp if not any errors in file main.tf
terraform plan -out m3.tfplan

# Deploy plan
terraform apply "m3.tfplan"

# Destroy
terraform destroy
