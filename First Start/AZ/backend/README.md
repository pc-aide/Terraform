# backend

---

## eg:
* remoteState.tf :
````tf
terraform {
  backend "azurerm" {
    storage_account_name = "storageName"
    container_name       = "containerName"
    key                  = "prod.terraform.tfstate"
    access_key           = "SZGckB7G7HzusK7Q91canWJIHznRDt+MJYBWJXkysPR8gpkiMgNxTd/FzROhuVj85Q14gyHNTN+d0BpK8m0Qw=="
  }
}
````
