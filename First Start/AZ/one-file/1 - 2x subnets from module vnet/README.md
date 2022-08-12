# 1 - 2x subnets from module vnet

---

## github
1. [ned1313-Implementing-Terraform-on-microsoft-azure](https://github.com/ned1313/Implementing-Terraform-on-Microsoft-Azure)

---

## diagram
[<img src="https://i.imgur.com/lU3eSIy.png">](https://i.imgur.com/lU3eSIy.png)

---

## output
````tf
terraform output
````
````outputs
subnet_id = [
  "/subscriptions/5a2cc279-c017-4d8a-8af0-e800c865db0c/resourceGroups/lab/providers/Microsoft.Network/virtualNetworks/vnet/subnets/web",
  "/subscriptions/5a2cc279-c017-4d8a-8af0-e800c865db0c/resourceGroups/lab/providers/Microsoft.Network/virtualNetworks/vnet/subnets/db",
]
````
