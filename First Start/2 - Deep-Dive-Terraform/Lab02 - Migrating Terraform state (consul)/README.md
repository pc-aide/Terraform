# Lab02 - Migrating Terraform state

---

## URL
1. [consul-download-page](https://www.consul.io/downloads)
2. [Lab01 - Import Resources](https://github.com/pc-aide/Terraform/tree/main/AWS/Lab/First%20Start/2%20-%20Deep-Dive-Terraform/Lab01%20-%20Import%20Resources)

---

## Requirement
1. if m3 (Lab01 - Lab01 - Import Resources) folder not exist, so re-create again

---

## New command
1. consul - win bin in c:\consul\consul.exe

---

## Acronym
1. ACL - Access Control (consul)
2. k/v  - Key-value (consul)

---

## Digram
[<img src="https://i.imgur.com/uGGfaYT.png">](https://i.imgur.com/uGGfaYT.png)

---

## Output
### Deploy m3 
1. if m3 (Lab01 - Import resources) not exist, just deploy again :

[<img src="https://i.imgur.com/TeqD8FH.png">](https://i.imgur.com/TeqD8FH.png)

### m4
1. build files & folder of the m4 folder :

[<img src="https://i.imgur.com/cvksbk0.png">](https://i.imgur.com/cvksbk0.png)

2. lauch consul server instance (loopback local - service) :

[<img src="https://i.imgur.com/9vIqsBA.png">](https://i.imgur.com/9vIqsBA.png)

3. open second terminal\following commands.ps1\cd m4\consul :

[<img src="https://i.imgur.com/Yss5zpp.png">](https://i.imgur.com/Yss5zpp.png)

4. consul acl boostrap (http token -> login to the srv) :

[<img src="https://i.imgur.com/EYu0Hpe.png">](https://i.imgur.com/EYu0Hpe.png)

5. m4\terraform init, plan & apply :

[<img src="https://i.imgur.com/g3dbsW2.png">](https://i.imgur.com/g3dbsW2.png)

6. output :

[<img src="https://i.imgur.com/qa0k0QG.png">](https://i.imgur.com/qa0k0QG.png)

7. get token values for Mary & sally :

[<img src="https://i.imgur.com/3CbbddN.png">](https://i.imgur.com/3CbbddN.png)

8. msEdge 127.0.0.1:8500 :

[<img src="https://i.imgur.com/jWWSX63.png">](https://i.imgur.com/jWWSX63.png)

9. log in\sucess :

[<img src="https://i.imgur.com/DVtBClM.png">](https://i.imgur.com/DVtBClM.png)


10. commands.ps1\Ln50\cp backend.tf ..\m3\backend.tf :

[<img src="https://i.imgur.com/zqc1ZXI.png">](https://i.imgur.com/zqc1ZXI.png)

---

### Migration: m3 -> m4 with policies
1. cd ..\m3 & http_token\secretID - mary moe : 

[<img src="https://i.imgur.com/U0Bt5hY.png">](https://i.imgur.com/U0Bt5hY.png)

2. terraform init -backend-config="path=networking/state/globo-primary" : 

[<img src="https://i.imgur.com/nbEggDp.png">](https://i.imgur.com/nbEggDp.png)

3. checkup\msEdge http://127.0.0.1:8500/ui/dc1/kv/networking/state/ :

[<img src="https://i.imgur.com/AtbSGlb.png">](https://i.imgur.com/AtbSGlb.png)

4. m3\terraform.tfstate empty, because : migration to m4\terraform.tfstate :

[<img src="https://i.imgur.com/MJlXqoz.png">](https://i.imgur.com/MJlXqoz.png)

5. msEdge <loopback:port> with secretID of Mary Moe\policies\networking (k/v) :

[<img src="https://i.imgur.com/ZJLdYn5.png">](https://i.imgur.com/ZJLdYn5.png)

6. k/v\networking of Mary Moe :

[<img src="https://i.imgur.com/lXUR0wC.png">](https://i.imgur.com/lXUR0wC.png)

7. networking\{configuration,state} : 

[<img src="https://i.imgur.com/ZmYDCCo.png">](https://i.imgur.com/ZmYDCCo.png)
