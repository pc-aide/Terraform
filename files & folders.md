# files & folders

---

## Files
|n|name|e.g.|O/P|
|-|----|----|---|
|1|terraform.tfstate|# all configuration <br/>|[<img src="https://i.imgur.com/j4Ec534.png">](https://i.imgur.com/j4Ec534.png)|
|2|lock file (*.lock.hcl)|.terraform.lock.hcl|[<img src="https://i.imgur.com/XeDKghr.png">](https://i.imgur.com/XeDKghr.png)|
|3|# use case: .tfvars files, which are likely to contain sensitive data, such as passwords, private keys, and other secrets<br/><br/># variable definitions file <br/><br/> terraform.tfvars|# files : <br/> terraform.tfvars <br/><br/> words = { <br/> &ensp; nouns = ["army", "panther"] <br/> &ensp; numbers = [42, 27, -5, 0 <br/> }|


---

## Folders
|n|name|e.g.|O/P|
|-|----|----|---|
|1|plugins/.terraofrm/plugings||
|2|.terraform folder|# for installing pluging & modules|[<img src="https://i.imgur.com/pVR3pbP.png">](https://i.imgur.com/pVR3pbP.png)|
|3|workspaces<br/><br/>eg: qa & development|terraform.tfstate.d||
