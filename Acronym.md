# Acronym

---

## Table
|n|name|desc|e.g.|
|-|----|----|----|
|1|HCL|HashiCorp Configuration Language||
|2|uat|User Acceptance Testing| 3x env folders: dev, uat, & prod: <br/> <br/> terraform plan -state ".\dev\dev.state" -var-file"common.tfvars" <br/> -var-file".\dev.dev.tfvars" <br/> <br/> terraform plan -state ".\uat\uat.state"|
|3|OSS|Open Source Software|terraform OSS||
|4|EOT|End Of Topic|resource "local_file" "literature" { <br/> &ensp; filename = "art_of_war.txt" <br/> &ensp; content = <<- EOT <br/> &ensp;&ensp; Sun Tzu said : the art of war is of viatal importance to the state <br/> EOT <br/> }|
|5|CI/CD|Continuous Integration & continuous development|eg.: CI/CD pipeline in aws||
