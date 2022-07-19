# consul

---

## URL
1. [download-page](https://www.consul.io/downloads)

---

## Diagram
1. networking
   * state/<networking.Name> = terraform.tfstate
   * workspace/config
3. applications
   * state
   * workspace/config

[<img src="https://i.imgur.com/PTbIVPc.png">](https://i.imgur.com/PTbIVPc.png)



---

## Table
|n|name|e.g.|O/P|
|-|----|----|---|
|1|agent|# service background <br/><br/>consul agent -bootstrap -config-file="config/consul-config.hcl" -bind="127.0.0.1"|[<img src="https://i.imgur.com/C4MyfHo.png">](https://i.imgur.com/C4MyfHo.png)|
|2|get token (user)|consul acl token read -id \<AccessorID\>|[<img src="https://i.imgur.com/IcABzAy.png">](https://i.imgur.com/IcABzAy.png)|
|3|client|consul agent -bootstrap -config-file="config/consul-config.hcl" -client="0.0.0.0"|[<img src="https://i.imgur.com/UYTr7Gu.png">](https://i.imgur.com/UYTr7Gu.png)|
