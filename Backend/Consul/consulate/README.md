# consulate

---

## URL
1. [download-page-github](https://github.com/gmr/consulate)

---

## Intro
* consulate, a script python for backup-&-export configuration into the consul

---

## Testing
1. Python 2.7.18 | pip 19.2.3 from c:\python27\lib\site-packages\pip (python 2.7)
   * python 3.10.5 - not working (date_testing: 19-07-2022)

---

## Install
````ps1
pip install consulate
````

---

## Test
````ps1
# checkUp
# ls --listing
# kv --key/value
consulate --datacenter dc1 --token f8a6aa3f-bd45-b775-f3bc-c269ce909f59 kv ls

applications/configuration/
applications/state/
networking/configuration/
networking/state/
networking/state/globo-primary

# backup
consulate --datacenter dc1 --token f8a6aa3f-bd45-b775-f3bc-c269ce909f59 kv backup |
out-file bk_backend_consul.json

# (optional) get-content
cat bk_backend_consul.json

# Restore
# scope restore: only k/v, not the (e.g) acl\Tokens
# acl - access control list (e.g. users, bootstrap)
cat bk_backend_consul.json |
consulate --datacenter dc1 --token f8a6aa3f-bd45-b775-f3bc-c269ce909f59 kv restore

# checkUp after restore with listing
consulate --datacenter dc1 --token f8a6aa3f-bd45-b775-f3bc-c269ce909f59 kv ls

applications/configuration/
applications/state/
networking/configuration/
networking/state/
networking/state/globo-primary
````
