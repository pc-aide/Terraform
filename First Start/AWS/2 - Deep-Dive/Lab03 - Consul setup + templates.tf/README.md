# Lab03 - Consul setup + templates.tf

---

## Acronym
1. ACL - Access Control (consul)
2. bk - backup
3. nat - network address translation
4. gw - gateway
5. k/v - key-value

---

## Requirement
1. need m4 (Lab02 - Migrating Terraform state (consul), if not existe, just re-create again

---

## consulate
````ps1
# bk_m5_kv_consul.json :
# ls --list
paul> consulate --datacenter dc1 --token 7de9bbab-5b7f-ab1d-86be-3a5bceca8403 kv ls

applications/configuration/
applications/state/
networking/configuration/
networking/configuration/globo-primary/common_tags
networking/configuration/globo-primary/net_info
networking/state/
networking/state/globo-primary
PS C:\Users\paul>
````

---

## Diagram
[<img src="https://i.imgur.com/cnl3BuD.png">](https://i.imgur.com/cnl3BuD.png)

---

## Output
1. Plan m4 :

[<img src="https://i.imgur.com/q2VQzv5.png">](https://i.imgur.com/q2VQzv5.png)

2. m5\commands.ps1 - paste all folders & files from github for m5 folder : 

[<img src="https://i.imgur.com/HDqyEIn.png">](https://i.imgur.com/HDqyEIn.png)

3. session of mary moe (networking) in consul :

[<img src="https://i.imgur.com/3TiS6SH.png">](https://i.imgur.com/3TiS6SH.png)

---

### m5

1. Write the cfg data for globo-prmary-config (command.ps1\Ln17,18) :

[<img src="https://i.imgur.com/6V7ufsJ.png">](https://i.imgur.com/6V7ufsJ.png)

2. init -backend-cfg :

[<img src="https://i.imgur.com/f9KXixu.png">](https://i.imgur.com/f9KXixu.png)

3. write new data in net_info (before) :

[<img src="https://i.imgur.com/zWdBMSE.png">](https://i.imgur.com/zWdBMSE.png)

4. after (commands.ps1\Ln40) (after) : 

[<img src="https://i.imgur.com/v4KMnLw.png">](https://i.imgur.com/v4KMnLw.png)

5. backend with new template.tf (commands.ps1\Ln45..58) - 9 to add, 12 to change - level tags :

[<img src="https://i.imgur.com/ChsKKqO.png">](https://i.imgur.com/ChsKKqO.png)

6. apply config.tfplan -it may will be long (Time: ~2m) if nat gw true (in : resources.tf\Ln78 - nat gw)

[<img src="https://i.imgur.com/QlmyFzM.png">](https://i.imgur.com/QlmyFzM.png)


---

### aws console (checkup - end)
1. common_tags (consul\dc1) :

[<img src="https://i.imgur.com/8f3ZEd2.png">](https://i.imgur.com/8f3ZEd2.png)

2. VPCs\tags :

[<img src="https://i.imgur.com/XgJcn0r.png">](https://i.imgur.com/XgJcn0r.png)

3. subnets\tags :

[<img src="https://i.imgur.com/4cBgEfK.png">](https://i.imgur.com/4cBgEfK.png)

4. nat gw :

[<img src="https://i.imgur.com/T4GDXRk.png">](https://i.imgur.com/T4GDXRk.png)

5. test\sally sue\read (ACL) on networking - test delete :

[<img src="https://i.imgur.com/x3N0POW.png">](https://i.imgur.com/x3N0POW.png)

6. error 403 - can't delete :

[<img src="https://i.imgur.com/OI4N7O5.png">](https://i.imgur.com/OI4N7O5.png)


7. scope of sally sue (k/v) :
  * networking - read
  * application - read/write
  
[<img src="https://i.imgur.com/oRgFRuG.png">](https://i.imgur.com/oRgFRuG.png)
