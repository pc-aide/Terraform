# Lab04 - nginx + MySQL + workspace & backend consul

---

## Acronym
1. eip - elastic IP
2. qa - quality assurance
3. sg - security group

---

## Requirement
1. if not exist : Lab03 - Consul setup + templates.tf, just re-create again for this lab
2. upgrade limit of the EIP to 15 - it will be take ~30min (aws support center)
3. visual c++2019 redistributable
4. mySQL workbench 8.029

---

## SRC
1. [m6/applications/resources.tf - Based on github : arbabnazar](https://github.com/arbabnazar/terraform-ansible-aws-vpc-ha-wordpress)

---

## Diagram

### AWS Resources

### backen consul

---

## Output
1. Lab03 (previous) : 

[<img src="https://i.imgur.com/eM2KAgU.png">](https://i.imgur.com/eM2KAgU.png)

---

### m6
1. write cfg data for add workspace cfg :

[<img src="https://i.imgur.com/sPUvjIe.png">](https://i.imgur.com/sPUvjIe.png)

2. same backend for all workspace :

[<img src="https://i.imgur.com/VLJlNw7.png">](https://i.imgur.com/VLJlNw7.png)

### workspace dev

3. workspace new development :

[<img src="https://i.imgur.com/gqFDF6K.png">](https://i.imgur.com/gqFDF6K.png)

4. plan dev.tfplan :

[<img src="https://i.imgur.com/lADmsX2.png">](https://i.imgur.com/lADmsX2.png)

5. apply dev.tfplan :

[<img src="https://i.imgur.com/4pv9xvB.png">](https://i.imgur.com/4pv9xvB.png)

6. aws_console\vpc_dev :

[<img src="https://i.imgur.com/EswxIGT.png">](https://i.imgur.com/EswxIGT.png)

7. awsConsole\subnets_dev :

[<img src="https://i.imgur.com/Dd0jz8g.png">](https://i.imgur.com/Dd0jz8g.png)

---

### workspace qa
1. commands.ps1 :

[<img src="https://i.imgur.com/TsgO25t.png">](https://i.imgur.com/TsgO25t.png)

* NB: if limit new EIP with a sandbox  - limit number eip: 5 :

[<img src="https://i.imgur.com/F4ofURc.png">](https://i.imgur.com/F4ofURc.png)

2. apply qa.tfplan :

[<img src="https://i.imgur.com/aosAe0t.png">](https://i.imgur.com/aosAe0t.png)

3. awsConsole\subnets_qa :

[<img src="https://i.imgur.com/SytwDTn.png">](https://i.imgur.com/SytwDTn.png)

4. awsConsole\vpc_qa :

[<img src="https://i.imgur.com/FDkrqZa.png">](https://i.imgur.com/FDkrqZa.png)

6. awsConsole\eip :

[<img src="https://i.imgur.com/MZS9uj8.png">](https://i.imgur.com/MZS9uj8.png)

7. write cfg data for add workspaces cfg :

[<img src="https://i.imgur.com/AkjXL8P.png">](https://i.imgur.com/AkjXL8P.png)

---

### workspace dev application - consul
* if we init again, so we lost previous workspace :

[<imgs src="https://i.imgur.com/wRtRvD6.png">](https://i.imgur.com/wRtRvD6.png)
  
1. update rds\mySQL vs orig 5.x -> 8.x (consul) :

[<img src="https://i.imgur.com/qM8dZa2.png">](https://i.imgur.com/qM8dZa2.png)

2. terraform apply dev.tfplan (time : ~5m ) :

[<img src="https://i.imgur.com/lvYMOzO.png">](https://i.imgur.com/lvYMOzO.png)

3. awsConsole\RDS\Mysql :

[<img src="https://i.imgur.com/9PR2bZx.png">](https://i.imgur.com/9PR2bZx.png)

4. awxConsole\RDS\<mySql>\connectivity & security :

[<img src="https://i.imgur.com/Mle4zN6.png">](https://i.imgur.com/Mle4zN6.png)

5. awsConsole\RDS\mySQL\cfg :

[<img src="https://i.imgur.com/lcuknCr.png">](https://i.imgur.com/lcuknCr.png)

6. awsConsole\RDS\mySQL\tags :

[<img src="https://i.imgur.com/jM11GjK.png">](https://i.imgur.com/jM11GjK.png)

---

### MySQL workbench
1. connect my aws-rds-mysql :
  
[<img src="https://i.imgur.com/ZqUHDCZ.png">](https://i.imgur.com/ZqUHDCZ.png)  

* nb if connection not work - just fix it our permission network :
  
[<img src="https://i.imgur.com/rBPmfpX.png">](https://i.imgur.com/rBPmfpX.png)

2. only web acces to mySQL (sg) :
  
[<img src="https://i.imgur.com/l6HXYv5.png">](https://i.imgur.com/l6HXYv5.png)

---
  
### ec2
  
[<img src="https://i.imgur.com/0XHuDnn.png">](https://i.imgur.com/0XHuDnn.png)
  
1. msEdge IP_ec2_nginx :
  
[<img src="https://i.imgur.com/cp42yBY.png">](https://i.imgur.com/cp42yBY.png)
  
3. lb\classic :
  
[<img src="https://i.imgur.com/oENjyA5.png">](https://i.imgur.com/oENjyA5.png)
  
4. dns_name_lb_classic :
  
[<img src="https://i.imgur.com/nSWrwmK.png">](https://i.imgur.com/nSWrwmK.png)  
