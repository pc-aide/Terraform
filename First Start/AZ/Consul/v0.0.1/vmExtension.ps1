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
$URL_vsCode = "https://master.dl.sourceforge.net/project/terraform/vsCode/1.69/VSCodeSetup-x64-1.69.2.exe?viasf=1"
$URL_CONSUL = "https://master.dl.sourceforge.net/project/terraform/Consul%20-%20win%20bin/1.12.2/consul.exe?viasf=1"
$URL_gitx64 = "https://master.dl.sourceforge.net/project/terraform/Git/Git-2.37.0-64-bit.exe?viasf=1"

#######################################################
# FIlES in D:\ 
#######################################################

# vs code
try {
	Start-BitsTransfer $URL_vsCode `
	-destination "d:\vsCode.exe"
		
}
catch {
	$_ | out-file "d:\ErrorDownloadVsCode.txt"
}

# Git-x64
try{
	Start-BitsTransfer $URL_gitx64 `
	-destination "d:\git.exe"
}
catch{
	$_ | out-file "d:\ErrorDownloadGit.txt"
}

#######################################################
# INSTALL APPS 
#######################################################

# vs code 
try {
	start "d:\vsCode.exe" -args "/VERYSILENT /NORESTART /MERGETASKS=!runcode,addtopath /log=d:\IntallVsCode.txt" -wait
}
catch {
	$_ | out-file "d:\ErrorInstallVsCode.txt"
}

# consul.exe
try {
	# New InstallDir
	ni -Name Consul C:\ -type Directory
	# Download consul.exe bin
	Start-BitsTransfer $URL_CONSUL `
	-destination "C:\Consul\consul.exe"
}
catch{
	$_ | out-file "d:\ErrorInstallConsul.txt"
}

# git-x64
try{
	start "d:\git.exe" -args "/VERYSILENT /NORESTART /LOG=d:\InstallGit.txt" -wait
}
catch{
	$_ | out-file "d:\ErrorInstallGit.txt"
}

#######################################################
#  ENV PATH
#######################################################

# add <env path> ...
$OLDPATH = [System.Environment]::GetEnvironmentVariable('PATH','machine')
$Consul = "C:\Consul\"
$NEWPATH = "$OLDPATH;$Consul"
# new env path system
[Environment]::SetEnvironmentVariable("PATH", "$NEWPATH", "Machine")

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
restart-computer
