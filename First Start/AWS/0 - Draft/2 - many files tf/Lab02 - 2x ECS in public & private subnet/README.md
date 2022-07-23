# Lab02 - 2x ECS in public & private subnet

---

## Diagram
[<img src="https://i.imgur.com/9u2HdP9.png">](https://i.imgur.com/9u2HdP9.png)

---

## Resources
1. VPCs
    * cidr : 10.56.0.0/16
2. Subnets
    * Publics: 10.56.0.0/24, 10.56.10.0/24
    * Privates: 10.56.100.0/24, 10.56.200.0/24
3. EC2s
    * ami: Amazon Linux 2
    * userdata: nginx
4. Outputs terraform
    * nginx public dns
