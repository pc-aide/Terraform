# [2] -> New values of JimmyAdminIssue.ps1 -> eg. -> privateRouteTable rtb-0f8c8ef8c6efd57d6 ($JimmyScriptOutput)
# Import-1
terraform import --var-file="terraform.tfvars" module.vpc.aws_route_table.private[2] rtb-0f8c8ef8c6efd57d6
# Import-2
terraform import --var-file="terraform.tfvars" module.vpc.aws_route_table_association.private[2] subnet-02f9ebad0828b9b1c/rtb-0f8c8ef8c6efd57d6
# Import-3
terraform import --var-file="terraform.tfvars" module.vpc.aws_subnet.private[2] subnet-02f9ebad0828b9b1c
# Import-4
terraform import --var-file="terraform.tfvars" module.vpc.aws_route_table_association.public[2] subnet-01c4e13b4c8891432/rtb-05accc2266ae9c84e
# Import-5
terraform import --var-file="terraform.tfvars" module.vpc.aws_subnet.public[2] subnet-01c4e13b4c8891432
