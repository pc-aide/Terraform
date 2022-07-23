# console

---

## network
|n|name|e.g.|O/P|
|-|----|----|---|
|1|VPC |var_cidr_10_56|[<img src="https://i.imgur.com/XkLnC9P.png">](https://i.imgur.com/XkLnC9P.png)|
|2|public subnets|# first : <br/> var.public_subnets[0] | [<img src="https://i.imgur.com/f8nGlW9.png">](https://i.imgur.com/f8nGlW9.png) |
|3|wildcard|var.public_subnets[*] | [<img src="https://i.imgur.com/BCqh9V2.png">](https://i.imgur.com/BCqh9V2.png) |
|3|cidrSubnet function|# 8 -> 32-24 = 8 <br/> # i want /24, so 32-24 = 8, the 8 will be : <br/><br/> cidrsubnet(var.public_subnets[0],8,2) | [<img src="https://i.imgur.com/W2zM5hR.png">](https://i.imgur.com/W2zM5hR.png) |
