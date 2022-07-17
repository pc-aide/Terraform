# Data Sources

---

## Acronym
1. ami - amazon machine image

---

## Search
### ami-amazon-linux
|n|name|e.g.|O/P|
|-|----|----|---|
|1|aws_ami|data "aws_ami" "amazon" { <br/> &ensp; most_recent = true <br/> &ensp; owners = ["amazon"] <br/><br/> filter { <br/> &ensp;&ensp; name = "virtualization-type" <br/> &ensp;&ensp; values = ["hvm'] <br/> &ensp; } <br/><br/> filter { <br/> &ensp;&ensp; name = "description" <br/> &ensp;&ensp; values = ["Amazon Linux 2 AMI*"] <br/> &ensp; } <br/><br/> filter { <br/> &ensp;&ensp; name = "architecture" <br/> &ensp;&ensp; value = ["x86_64"] <br/> &ensp; } <br/> } | [<img src="https://i.imgur.com/MLXE3JL.png">](https://i.imgur.com/MLXE3JL.png) |

---

### ami-ubuntu-linux

---

### ami-server-windows
