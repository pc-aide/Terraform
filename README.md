# Terraform

---

## Acronym
1. IaC - Infrastructure as Code
2. CM - Configuration Management

---

## Intro
1. Terraform is infrastructure provisioning (**IaC**) tool, **not a CM** tools

---

## CM
1. Ansible
2. Chef
3. Puppet
4. SaltStack

---

## IaC vs CM
1. eg. with terraform can create (provisioning) RDS\MySQL 
   * but can't create the tables, my schema inside my MySQL vs with Ansible, now it's possible for that (CM)
2. CM tools like Ansible, Puppet, SaltStack, & Chef deploy software **into** **existing servers**
3. **CM** tools favor **mutable** infrastructure, whereas **terraform** & other provisioning tools favor **immutable**
   * **Mutable** infrastrcture means your perform software **updates** on **existing** servers
   * **Immutable** infrastructure, by **contrast**, doesn't care about existing servers - it treats infrastructure as a disposable commodity
