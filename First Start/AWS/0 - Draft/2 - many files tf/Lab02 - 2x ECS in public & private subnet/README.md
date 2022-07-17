# Lab02 - 2x ECS in public & private subnet

---

## Diagram
[<img src="https://i.imgur.com/83SeDz5.png">](https://i.imgur.com/83SeDz5.png)

---

## Resources
1. VPCs
    * cidr : 10.56.0.0/16
2. Subnets
    * Publics: 10.56.1.0/24
    * Privates: 
3. EC2s
    * ami: Amazon Linux 2
    * userdata: nginx
4. Outputs terraform
    * nginx public dns
