# Modules

---

## aws
|n|name|e.g.|O/P|
|-|----|----|---|
|1|VPC|


---

## azurerm
|n|name|e.g.|O/P|
|-|----|----|---|
|1|vnet|module "vnet" { <br/> &ensp; source = "Azure/vnet/azurerm" <br/> &ensp; version = "~>2.7.0" <br/> &ensp; resource_group_name = var.rg_name <br/> &ensp; # vnet <br/> &ensp; address_space = [var.net_cirdr] <br/> &ensp; vnet_name = var.vnet_cirdr_name <br/> &ensp; # subnets <br/> &ensp; subnet_prefixes = var.subnet_prefixes <br/> &ensp; subnet_names = var.subnet_names <br/> &ensp; # security groups <br/> &ensp; nsg_ids = {} <br/> <br/> tags = { <br/> &ensp;&ensp; environment = "lab" <br/> &ensp;&ensp; costcenter = "it" <br/> &ensp; } <br/> # rg must exist first - creating a vnet <br/> depends_on [azurerm-resource_group.rg_lab] <br/> }|[<img src="https://i.imgur.com/QG1JK3z.png">](https://i.imgur.com/QG1JK3z.png)|
