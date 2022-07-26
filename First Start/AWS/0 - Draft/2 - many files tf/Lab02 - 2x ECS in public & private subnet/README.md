# Lab02 - 2x ECS in public & private subnet

---

## Acronym
1. ec2 - elastic compute cloud
2. lb - load balancer
3. sg - security group
4. tg - target groups

---

## Diagram
[<img src="https://i.imgur.com/b89yXrS.png">](https://i.imgur.com/b89yXrS.png)

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

---

## Outputs
1. dns name (lb)

[<img src="https://i.imgur.com/vqpEqwF.png">](https://i.imgur.com/vqpEqwF.png)

2. web browser <dns_name> :

[<img src="https://i.imgur.com/KL7x5il.png">](https://i.imgur.com/KL7x5il.png)

---

### sg 
#### nginx
1. inbound :

[<img src="https://i.imgur.com/rLoWLo9.png">](https://i.imgur.com/rLoWLo9.png)

2. outbound :

[<img src="https://i.imgur.com/3cnjhFh.png">](https://i.imgur.com/3cnjhFh.png)

---

#### alb
1. inbound :

[<img src="https://i.imgur.com/Xr1Kqo7.png">](https://i.imgur.com/Xr1Kqo7.png)

2. oubound : 

[<img src="https://i.imgur.com/e75qVGH.png">](https://i.imgur.com/e75qVGH.png)

---

### tg
[<img src="https://i.imgur.com/ekr5UoS.png">](https://i.imgur.com/ekr5UoS.png)

1. instances :

[<img src="https://i.imgur.com/FtSjlfS.png">](https://i.imgur.com/FtSjlfS.png)


---

### ec2
[<img src="https://i.imgur.com/DRL8mfj.png">](https://i.imgur.com/DRL8mfj.png)
