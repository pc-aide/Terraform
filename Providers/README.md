# Providers

---

## Acronym
1. GCP - Google Cloud Platform

---

## Table
|n|name|e.g.|O/P|
|-|----|----|---|
|1|aws |"aws" { <br/> &ensp; "us-west-2" <br/> }||
|2|random|
|3|consul|
|4|local|# Generates a local file with the given content <br/><br/> terraform { <br/> &ensp; required_version = "\~>1.2.0" <br/> &ensp; required_providers { <br/> &ensp;&ensp; local = { <br/> &ensp;&ensp;&ensp; source  = "hashicorp/local" <br/> &ensp;&ensp;&ensp; version = "~>2.0" <br/> &ensp;&ensp; } <br/> &ensp; } <br/> } <br/>resource "local_file" "literature" { <br/> &ensp; filename = "art_of_war.txt" <br/> &ensp; content = <<-EOT <br/> &ensp;&ensp; Sun Tzu said : The art of war is of vital importance to the State. <br/> EOT <br/> }|[<img src="https://i.imgur.com/uATI2w4.png">](https://i.imgur.com/uATI2w4.png)|
|5|google|# GCP<br/>||
|6|azurerm|terraform { <br/> &ensp; required_providers { <br/> &ensp;&ensp; azurerm = { <br/> &ensp;&ensp;&ensp; source = "hashicorp/azurerm" <br/> &ensp;&ensp;&ensp; version = "~>3.17.0" <br/> &ensp;&ensp;} <br/> &ensp;} <br/> }|
