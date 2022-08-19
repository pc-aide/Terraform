# vm
resource "azurerm_windows_virtual_machine" "vm_terraform" {
  name                = var.vm_name
  resource_group_name = var.rg_name
  location            = var.location
  size                = var.vm_size
  #cred
  admin_username = var.admin_user
  admin_password = var.admin_pwd
  # nic
  network_interface_ids = [
    azurerm_network_interface.vm_nic.id,
  ]
  # time zone
  timezone = "Eastern Standard Time"

  # os disk
  os_disk {
    name                 = var.vm_disk
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # image
  source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "windows-10"
    sku       = "win10-21h2-entn-g2"
    version   = "latest"
  }
}

# vm-extension 
resource "azurerm_virtual_machine_extension" "vm_extension" {
  name                 = var.vm_name
  virtual_machine_id   = azurerm_windows_virtual_machine.vm_terraform.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

  settings           = <<SETTINGS
    {
        "fileUris": ["https://raw.githubusercontent.com/pc-aide/Terraform/main/First%20Start/AZ/Consul/v0.0.1/vmExtension.ps1"]
    }
SETTINGS
  protected_settings = <<PROTECTED_SETTINGS
    {
      "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File vmExtension.ps1"
    }
  PROTECTED_SETTINGS
}
