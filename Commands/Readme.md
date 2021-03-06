# Commands

---

## Basic
|n|name|e.g.|O/P|
|-|----|----|---|
|1|init (local)|# Preparation to migration terraform.tfstate to consul<br/><br/>terraform init<br/>terraform plan -out consul.tfplan <br/> terraform apply conslul.tfplan |[<img src="https://i.imgur.com/70EMD7K.png">](https://i.imgur.com/70EMD7K.png)|
|2|consul (remote)|# terraform.tfstate is in remote host (config) <br/><br/>terraform init -bakcend-config=path=networking/state/globo-primary<br/>terraform plan out config.tfplan <br/> terraform apply config.tfplan|[<img src="https://i.imgur.com/pe3pPKi.png">](https://i.imgur.com/pe3pPKi.png)|
|3|format|# optional : -recursive <br/>terraform fmt|[<img src="https://i.imgur.com/5EUYLzp.png">](https://i.imgur.com/5EUYLzp.png)<br/> after format:<br/>[<img src="https://i.imgur.com/Lfukdly.png">](https://i.imgur.com/Lfukdly.png)|
|4|graph|terrform graph <br/><br/> # to testing: <br/> terraform graph \| dot -Tsvg > graph.svg|[<img src="https://i.imgur.com/P869VT5.png">](https://i.imgur.com/P869VT5.png)|
|5|providers|terraform providers|[<img src="https://i.imgur.com/4aQMI50.png">](https://i.imgur.com/4aQMI50.png)|
|6|taint|# next plan,apply the resource will be destroy,recreated <br/> # used that when userdata change <br/> # e.g.: new background for html <br/><br/> terraform taint aws_instance.nginx[0] | tainted : <br/> [<img src="https://i.imgur.com/FitfksS.png">](https://i.imgur.com/FitfksS.png) <br/> new modif in code html : <br/> [<img src="https://i.imgur.com/5g4QE4a.png">](https://i.imgur.com/5g4QE4a.png)|
  
---
  
### state
|n|name|e.g.|O/P|
|-|----|----|---|
|1|list resources id|terraform state list|[<img src="https://i.imgur.com/1JjapbW.png">](https://i.imgur.com/1JjapbW.png)|
|2|show|# to know your resource - juste liste before <br/><br/> terraform state show 'aws_instance.nginx1'| [<img src="https://i.imgur.com/eZedie7.png">](https://i.imgur.com/eZedie7.png) |
|3|move item <br/> move to another address |terraform state mv <source> <destination>||
|4|remove item|terraform state rm <resource>||
|5|pull|# output current state to stdOut <br/><br/> terraform state pull|[<img src="https://i.imgur.com/Cu6KoOM.png">](https://i.imgur.com/Cu6KoOM.png)|
|6|push|# update remote state from local<br/><br/> terraform state push||

---

## workspace
|n|name|e.g.|O/P|
|-|----|----|---|
|1|list|# default can't be deleted <br/> # all in terraform.tfstate.d\ <br/> terraform workspace list|[<img src="https://i.imgur.com/z8z55Ub.png">](https://i.imgur.com/z8z55Ub.png) <br/> terraform.tfstate.d : <br/> [<img src="https://i.imgur.com/m8uCQIm.png">](https://i.imgur.com/m8uCQIm.png)<br/><br/> terraform.tfstate: <br/> [<img src="https://i.imgur.com/j9PcLbR.png">](https://i.imgur.com/j9PcLbR.png)| 
|2|new|terraform workspace new UAT|[<img src="https://i.imgur.com/mzg2uj9.png">](https://i.imgur.com/mzg2uj9.png)|
|3|delete|terraform workspace delete uat||

---
