<#
  Time: ~5m
#>

#######################################################
#   VARIABLES   
#######################################################
$ErrorActionPreference = "stop"

# path
$pth_OneDriveSetup = "C:\Windows\SysWOW64\OneDriveSetup.exe"

# URL
$URL_qbittorrent = "https://cfhcable.dl.sourceforge.net/project/qbittorrent/qbittorrent-win32/qbittorrent-4.5.4/qbittorrent_4.5.4_lt20_qt6_x64_setup.exe"

#######################################################
# FIlES in D:\ 
#######################################################

# vs qbittorent
try {
	Start-BitsTransfer $URL_qbittorrent `
	-destination "d:\qbittorrent.exe"
		
}
catch {
	$_ | out-file "d:\ErrorDownloadQbittorrent.txt"
}


#######################################################
# INSTALL APPS 
#######################################################

# vs qbittorrent 
try {
  start "d:\qbittorrent.exe" -args "/S" -Wait
}
catch {
  $_ | out-file "d:\ErrorInstallQbittorent.txt"
}

#######################################################
#  ENV PATH
#######################################################


#######################################################
#  CUSTOM OS   
#######################################################

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
  $_	 | out-file "d:\ErrorRemoveOneDriveSetup.txt"
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
	$_ | out-file "d:\ErrorshowFileExtension.txt"
}
 
# Remove icons pinned to TaskBar
# try this in futur : Import-StartLayout -MountPath $env:systemdrive\ -LayoutPath "StartLayout.bin"
#ri "C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\*" -EA 0

#######################################################
# PendingReboot 
#######################################################

# https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/custom-script-windows
# Tips and tricks
# 1) Don't put reboots inside the script. This action will cause problems with other extensions that are being installed,
#    and the extension won't continue after the reboot.
# 2) If you have a script that will cause a reboot before installing applications and running scripts, schedule the 
#    reboot by using a Windows Scheduled Task or by using tools such as DSC, Chef, or Puppet extensions.

# Remove PendingReboot
# restart-computer
