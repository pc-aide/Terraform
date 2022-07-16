# server.hcl
# ui = true --show in terminal
ui = true
server = true
bootstrap_expect = 1
datacenter = "dc1"
data_dir = "./data"

# acl - access control in loopback 127.0.0.1 (local)
acl = {
  enabled = true
  default_policy = "deny"
  enable_token_persistence = true
}
