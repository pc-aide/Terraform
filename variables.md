# variables

---

## aws
|n|name|eg.|O/P|
|-|----|---|---|

---

## azurerm
|n|name|eg.|O/P|
|-|----|---|---|
|1|vnet_cidr_range|variable "vnet_cidr_range" {<br/> &ensp; type = string <br/> &ensp; default = "10.0.0.0/16"<br/>} <br/><br/> variable "vnet_cidr_range" { <br/> &ensp; type = list(string) <br/> &ensp; default = ["10.1.0.0/16"] <br/> }||
|2|sbnt_prefixes|variable "subnet_prefixes" { <br/> &ensp; type = list(string) <br/> &ensp; default = ["10.0.0.0/24", "10.0.1.0.0/24"] <br/>} <br/><br/> variable "subnet_prefixes" { <br/> &ensp; type = list(string) <br/> &ensp; default = ["10.0.0.0/24"] <br/> }||
