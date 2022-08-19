resource "azurerm_windows_virtual_machine" "vm_consul" {
  name                = var.vm_name
  resource_group_name = var.rg_name
  location            = var.location
  size                = var.vm_size
  # creds
  admin_username = var.admin_username
  admin_password = var.admin_password
  # nic
  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]
  # vm-disk
  os_disk {
    caching              = "ReadWrite"
    name                 = var.disk_name
    storage_account_type = "Premium_LRS"
  }

  # image
  source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "Windows-10"
    sku       = "win10-21h2-entn-g2"
    version   = "latest"
  }

  # timeZone
  timezone = "Eastern Standard Time"
}

# bootstrap
resource "azurerm_virtual_machine_extension" "vm_extension" {
  name                 = var.vm_extension
  virtual_machine_id   = azurerm_windows_virtual_machine.vm_consul.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

  settings = <<SETTINGS
    {
      "fileUris" : ["https://raw.githubusercontent.com/pc-aide/Terraform/main/First%20Start/AZ/Consul/v0.0.1/vmExtension.ps1"]
    }
  SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
    {
      "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File vmExtension.ps1"
    }
  PROTECTED_SETTINGS
}
