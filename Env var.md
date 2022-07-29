# Env var

---

## Acronym
1. env var - environment variable

---

## List
|n|name|e.g.|O/P|
|-|----|----|---|
|1|AWS_PROFILE|$env:AWS_PROFILE="deep-dive"|[<img src="https://i.imgur.com/L52ARMU.png">](https://i.imgur.com/L52ARMU.png)|
|2|Automation|TF_IN_AUTOMATION=True||
|3|Input|# No prompt input <br/> TF_INPUT = False||
|4|var|TF_VAR_name = "value"||
|5||TF_CLI_ARGS = "-input=false"||
|6|consul|TF_VAR_consul_address = "host.docker.internal"||

---

## Log
|n|name|e.g.|O/P|
|-|----|----|---|
|1|TF_LOG|# use blank to remove the verbose <br/> # INFO,<br/> #TRACE --highest verbosity logs,<br/> #WARN, etc <br/><br/>$env:TF_LOG = "INFO"|trace : <br/> [<img src="https://i.imgur.com/yYf9qVq.png">](https://i.imgur.com/yYf9qVq.png) <br/> info : <br/> [<img src="https://i.imgur.com/ACs0NkB.png">](https://i.imgur.com/ACs0NkB.png)|
|2|path|TF_LOG_PATH = "tf_log_MMDDYY_hhmmss"||
