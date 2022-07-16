# Init
terraform init

# Console
terraform console
# Test our console with:
min(42,5,16)
lower("TACOCAT")
# 32 - <8> = 24 for output
cidrsubnet(var.vpc_cidr_block, 8, 0)
# Private IP host
cidrhost(cidrsubnet(var.vpc_cidr_block, 8, 0),5)
# company exist (variables.tf)
lookup(local.common_tags, "company", "Unknown")
# if not findOut, so put "Unknown"
lookup(local.common_tags, "missing", "Unknown")
# Output in local.tf\common_tags
local.common_tags
# logic: 5 mod 2 = ?
# 2 x ? = 5 -- ? 2 & remainder 1
# answer: 1
5 % 2
# 0 mod 2
# 2 x ? = 0 --? = 0
# answer: 0
0 % 2
# 1 mod 2: ?
# answer: 0
1 % 2 
# 2 mod 2: ?
# calcul: 2 x ? = 2
# MyCalcul: 2 x 1 = 2 & remainder: 0
# answer: 0
2 % 2
# modulo: 1 for Output
# calcul: 2 x ? = 3 & remainder: ? <- answer
# MyCalcul: 2 x 1 = 2 & remainder: 1 <- answer
3 % 2

# Format (code)
terraform fmt

# Environment variable for sensitive data
$env:AWS_ACCESS_KEY_ID = ""
$env:AWS_SECRET_ACCESS_KEY = ""

# CheckUp if any error
terraform validate

# plan
terraform plan -out m7.tfplan

# Deploy
terraform apply "m7.tfplan"

# Destroy
terraform destroy
