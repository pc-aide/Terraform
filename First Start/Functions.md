# Functions

---

## Table
|n|Name|e.g.|O/P|
|-|----|----|---|
|1|fileset|fileset(path, pattern|[<img src="https://i.imgur.com/igmUxKu.png">](https://i.imgur.com/igmUxKu.png)|
|2|file|user_data = file("./userdata.sh")|[<img src="https://i.imgur.com/8CvS00Y.png">](https://i.imgur.com/8CvS00Y.png)|
|3|cidrSubnet function|# testing in the console <br/> # 8 -> 32-24 = 8 <br/> # i want /24, so 32-24 = 8, the 8 will be : <br/><br/> cidrsubnet(var.public_subnets[0],8,2) | [<img src="https://i.imgur.com/W2zM5hR.png">](https://i.imgur.com/W2zM5hR.png) |
|4|lookup|# syntax : <br/> lookup(map, key, default) <br/> # console : <br/> # Test-1 <br/> # a & b -> map (list) <br/> # a -> key (in) <br/> # what? -> default <br/> # O/P : ay <br/> `lookup({a="ay", b="bee"}, "a", "what?")` <br/><br/> # Test-2 <br/> # a & b -> key (list) <br/> # O/P: what? <br/> `lookup({a="ay", b="bee"}, "c", "what?")`|[<img src="https://i.imgur.com/3MHAuqR.png">](https://i.imgur.com/3MHAuqR.png)|
|5|templatefile|# syntax: <br/> templatefile(path, vars)<br/># some time, we have *.tpl as tips, it's not mandatory<br/><br/> output "mad_libs" { <br/> &ensp; value = templatefile("${path.module}/templates/alice.txt", { <br/> &ensp;&ensp; nouns = random_shuffle.ran_nou.result <br/> &ensp;}) <br/> }|[<img src="https://i.imgur.com/aOO0m6L.png">](https://i.imgur.com/aOO0m6L.png)|
|6|index|index(["a", "b", "c"], "c")||
|7|join|join("-", ["svr", "prd", "web"])||
