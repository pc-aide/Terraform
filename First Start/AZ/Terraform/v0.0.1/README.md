# Terraform v0.0.1

---

## Acronym
1. fqdn - full qualified domain name

---

## Diagram
[<img src="https://i.imgur.com/dt2AaCC.png">](https://i.imgur.com/dt2AaCC.png)

---

## graphviw
[<img src="https://i.imgur.com/IdfUvn9.png">](https://i.imgur.com/IdfUvn9.png)

---

## outpus
1. fqdn
````tf
terraform output fqdn

vm-terraform.canadacentral.cloudapp.azure.com
````

2. public_subnet.id
````tf
terraform output subnet_id

"/subscriptions/1d8b0653-815e-4b5d-af06-fe3f45fb0dae/resourceGroups/terraform/providers/Microsoft.Network/virtualNetworks/vnet/subnets/pub_sbnt_10_56_0_0_24"
````
