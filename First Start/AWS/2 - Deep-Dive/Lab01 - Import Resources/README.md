# Lab01 - Import Resources

---

## Diagram
[<img src="https://i.imgur.com/ytEMd8B.png">](https://i.imgur.com/ytEMd8B.png)

---

## Outputs
1. Resources: 14 added :

[<img src="https://i.imgur.com/WIz5Abv.png">](https://i.imgur.com/WIz5Abv.png)

2. aws_console\VPCs :

[<img src="https://i.imgur.com/POKSFFe.png">](https://i.imgur.com/POKSFFe.png)

3. Subnets :

[<img src="https://i.imgur.com/7v0XDRj.png">](https://i.imgur.com/7v0XDRj.png)

---

### JimmyAdminIssue.ps1
1. Outputs :

[<img src="https://i.imgur.com/UvDL9P5.png">](https://i.imgur.com/UvDL9P5.png)

2. New resources Jimmy in aws_console_subnets :

[<img src="https://i.imgur.com/heDRAr6.png">](https://i.imgur.com/heDRAr6.png)

3. Update terraform.tfvars :

[<img src="https://i.imgur.com/BAFrDgP.png">](https://i.imgur.com/BAFrDgP.png)

4. terraform import terraform.tfvars  module.vpc.aws_<route|subnet> <resourceID> :

[<img src="https://i.imgur.com/TQilqAQ.png">](https://i.imgur.com/TQilqAQ.png)

5. Import successfull :

[<img src="https://i.imgur.com/nx1Pygn.png">](https://i.imgur.com/nx1Pygn.png)

6. plan again with MAJ terraform import\3 to change - MAJ tags :

[<img src="https://i.imgur.com/Q9RCVl9.png">](https://i.imgur.com/Q9RCVl9.png)

7. apply again :

[<img src="https://i.imgur.com/lv63hi3.png">](https://i.imgur.com/lv63hi3.png)

8. aws_console\MAJ_subnets :

[<img src="https://i.imgur.com/MJGSKKd.png">](https://i.imgur.com/MJGSKKd.png)
