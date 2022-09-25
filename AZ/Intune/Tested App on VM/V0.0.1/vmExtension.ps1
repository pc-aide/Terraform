<#
  Time: ~5m
#>

#################
#   VARIABLES   #
#################
$ErrorActionPreference = "stop"

# path
$pth_OneDriveSetup = "C:\Windows\SysWOW64\OneDriveSetup.exe"

# URL
$URL_terraform_exe = "https://master.dl.sourceforge.net/project/terraform/win%20bin/1.2.4/terraform.exe?viasf=1"
$URL_vsCode = "https://master.dl.sourceforge.net/project/terraform/vsCode/1.69/VSCodeSetup-x64-1.69.2.exe?viasf=1"
$URL_gitx64 = "https://master.dl.sourceforge.net/project/terraform/Git/Git-2.37.0-64-bit.exe?viasf=1"
$URL_AWSCLIV2 = "https://master.dl.sourceforge.net/project/terraform/AWS_CLI/AWSCLIV2.msi?viasf=1"
$URL_CONSUL = "https://master.dl.sourceforge.net/project/terraform/Consul%20-%20win%20bin/1.12.2/consul.exe?viasf=1"
$URL_azcli = "https://master.dl.sourceforge.net/project/terraform/az_cli/v2.39/azure-cli-2.39.0.msi?viasf=1"
$URL_grahviz = "https://master.dl.sourceforge.net/project/terraform/Apps/graphviz/v5.0.0/windows_10_cmake_Release_graphviz-install-5.0.0-win64.exe?viasf=1"
$URL_python = "https://master.dl.sourceforge.net/project/terraform/Apps/python/v2.7.18/python-2.7.18.amd64.msi?viasf=1"

################
# FIlES in D:\ #
################



################
# INSTALL APPS #
################



################
#  CUSTOM OS   #
################

# acl.default (Access to the path is denied) ACL: read,execute
$acl = get-acl $pth_OneDriveSetup
# new rule
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("nt authority\system","FullControl","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl $pth_OneDriveSetup

# Block autoInstall OneDrive to a NewUser
try{
  ri $pth_OneDriveSetup -force  
}catch{
  $_	 | out-file "d:\ErrorRemoveOneDriveSetup.log"
}

# Turn off the Network Location wizard
ni HKLM:\System\CurrentControlSet\Control\Network\ -Name NewNetworkWindowOff

# Disable Privacy Settings Experience Using 
ni HKLM:\SOFTWARE\Policies\Microsoft\Windows\ -Name OOBE
New-ItemProperty HKLM:\SOFTWARE\Policies\Microsoft\Windows\OOBE `
  -Name DisablePrivacyExperience -Type DWord -Value 1
  
# Disable First run welcome page Edge
ni HKLM:\SOFTWARE\Policies\Microsoft\ -Name Edge
New-ItemProperty HKLM:\SOFTWARE\Policies\Microsoft\Edge\ `
  -Name HideFirstRunExperience -Type DWord -Value 1

# Show File Extension	
try {
	reg load HKLM\DefaultUser C:\Users\Default\NTUSER.DAT
	$path = "HKLM:\Defaultuser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
	New-ItemProperty -Path $path -Name HideFileExt -Value "0" -PropertyType DWord
	reg unload HKLM\DefaultUser
}
catch{
	$_ | out-file "d:\ErrorshowFileExtension.log"
}
 
# Remove icons pinned to TaskBar
# try this in futur : Import-StartLayout -MountPath $env:systemdrive\ -LayoutPath "StartLayout.bin"
#ri "C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\*" -EA 0

#################
# PendingReboot #
#################

# https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/custom-script-windows
# Tips and tricks
# 1) Don't put reboots inside the script. This action will cause problems with other extensions that are being installed,
#    and the extension won't continue after the reboot.
# 2) If you have a script that will cause a reboot before installing applications and running scripts, schedule the 
#    reboot by using a Windows Scheduled Task or by using tools such as DSC, Chef, or Puppet extensions.
