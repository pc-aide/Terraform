# <name> blocks
  
---
  
## List
|n|name|desc.|eg|O/P|
|-|----|-----|--|---|
|1|resource blocks|
  |2|(meta-argument)<br/>lifecyle block <br/><br/><ins> other opt:</ins><br/>prevent_destroy (bool)<br/>ignore_changes (list of attributes)||resource "azurerm_resource_group" "example" { <br/> &ensp; # ... <br/> <br/> &ensp; lifecycle { <br/> &ensp; &ensp; create_before_destroy = true <br/> &ensp; } <br/> }||
