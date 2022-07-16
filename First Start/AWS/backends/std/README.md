# std

---

## Acronym
1. std - standard

---

## Table
|n|name|e.g.|O/P|
|-|----|----|---|
|1|consul|# encryption at rest (creds) for terraform state ? <br/> # creds use env var <br/> # e.g: TF_VAR_accesKey or aws configure ... in env var |
|2|azurerm| terraform { <br/> &ensp; backend "azurerm" { <br/> &ensp; &ensp; storage_account_name = "sa98349034" <br/> &ensp; &ensp; container_name = "tfstate" <br/> &ensp; &ensp; key = "terraform.tfstate" <br/> &ensp; &ensp; access_key = "qwertyuiop12345678..." <br/> &ensp; } <br/> } |
|3|S3|
