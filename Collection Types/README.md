# Collection Types

---

## list
|n|name|e.g.|O/P|
|-|----|----|---|
|1|any|# ref: terraform.tfvars <br/> variable "public_subnets" { <br/> &ensp; type = list(any)<br/>} <br/><br/> # terraform.tfvars : <br/> public_subnets = ["10.0.0.0/24", "10.0.1.0/24"]||
|2|string| variable "vpc_subnets_cidr_block" { <br/> &ensp; type = list(string) <br/> &ensp; default = ["10.0.0.0/24", "10.0.1.0/24"] <br/> }||
