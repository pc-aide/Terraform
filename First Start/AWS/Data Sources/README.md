# Data Sources

---

## Acronym
1. ami - amazon machine image

---

## Search
### ami-amazon-linux
|n|name|e.g.|O/P|
|-|----|----|---|
|1|aws_ami|# we must have a one value as return, if not, so error with multiple value as return <br/><br/>data "aws_ami" "amazon" { <br/> &ensp; most_recent = true <br/> &ensp; owners = ["amazon"] <br/><br/> filter { <br/> &ensp;&ensp; name = "virtualization-type" <br/> &ensp;&ensp; values = ["hvm'] <br/> &ensp; } <br/><br/> filter { <br/> &ensp;&ensp; name = "description" <br/> &ensp;&ensp; values = ["Amazon Linux 2 AMI*"] <br/> &ensp; } <br/><br/> filter { <br/> &ensp;&ensp; name = "architecture" <br/> &ensp;&ensp; value = ["x86_64"] <br/> &ensp; } <br/> } | [<img src="https://i.imgur.com/MLXE3JL.png">](https://i.imgur.com/MLXE3JL.png) |
|2|aws_ami|data "aws_ami" "ubuntu" { <br/> &ensp; owners = [ "099720109477" ] # Canonical <br/> &ensp; most_recent = true <br/><br/> &ensp; filter { <br/> &ensp;&ensp; name = "name" <br/> &ensp;&ensp; values = [ "ubuntu/images/hvm-ssd/ubuntu*" ] <br/> &ensp; } <br/> } | output: <br/><br/> ami_description = "Canonical, Ubuntu, 20.04 LTS, arm64 focal image build on 2022-07-13" <br/><br/> ami_id = "ami-0b0950360cb811cfc" <br/><br/> ami_name = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-arm64-server-20220713" |


---

### ami-ubuntu-linux

---

### ami-server-windows
