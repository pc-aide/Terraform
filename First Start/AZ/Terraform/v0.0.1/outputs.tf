output "fqdn" {
  value = azurerm_public_ip.pip_vm.fqdn
}

output "subnet_id" {
  value = azurerm_subnet.public_subnet.id
}
