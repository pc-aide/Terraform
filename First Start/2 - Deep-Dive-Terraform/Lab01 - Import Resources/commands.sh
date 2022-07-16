# cfg an AWS profile with proper creds
aws configure --profile deep-dive

# Linux or MacOS
# export AWS_PROFILE=deep-dive

# Windows
$env:AWS_PROFILE="deep-dive"

# Deploy the current environment
terraform init
# format code
terraform fmt -recursive
# CheckUp
terraform validate
# Plan
terraform plan -out m3.tfplan
# Deploy
terraform apply "m3.tfplan"

# Now Jimmy ruins things :
# add new subnets in us-east-1c by Jimmy via script.ps1 : 
# 1x public : 10.0.2.0/24
# 1x private: 10.0.12.0/24

# Command syntax (import) :
# ADDR - configuration resource identifier
# ex: module.vpc.aws_subnet.public[2]
#
# ID - provider specific resource identifier
# ex: subnet-ad536afg9 (aws_console\subnets\<subnetID>)
# terraform import [options] <addr ID>
# subnet-ID
# output will be available in terraform.tfstate

# Linux & MacOS: Run the junior_admin.sh script
# ./junior_admin.sh

# Install the Nuget
Install-PackageProvider -Name "NuGet" -RequiredVersion "2.8.5.201" -Force
# Install the AWS module (Time: ~2m)
# WARNING: The version '4.1.122' of module 'AWSPowerShell.NetCore' is currently in use. Retry the operation after closing the applications.
# -AllowClobber --Overrides warning messages about installation conflicts about existing commands on a computer
# C:\Program Files\WindowsPowerShell\Modules\AWSPowerShell.NetCore\<version>\
# When done install: to testing : Get-AWSCredential ?
Install-Module -Name AWSPowerShell.NetCore -RequiredVersion 4.1.122 -Scope CurrentUser -Force -AllowClobber

# Script of Jimmy
.\JimmyAdminIssue.ps1

# Update your terraform.tfvars file to comment out the current 
# private_subnets, public_subnets, and subnet_count values and
# uncomment the updated values

# Run the plan again after import terraform_imports.sh
terraform plan -out m3.tfplan

# There should be 3 changes where tags are added or modified
terraform apply "m3.tfplan"

# Destroy
terraform destroy -auto-approve
