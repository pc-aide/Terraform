<#
  Time: ~ 5m
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
$URL_wsl_update = "https://master.dl.sourceforge.net/project/terraform/Apps/DockerDesktop/wsl_update/v5.10/wsl_update_x64.msi?viasf=1"

################
# FIlES in D:\ #
################

# wsl_update --wsl -windows system linux
try{
	start-BitsTransfer $URL_wsl_update `
	-destination "d:\wsl_update.msi"
}
catch{
	$_ | out-file "d:\ErrorDlWslUpdate.txt"
}

# python 2.7.18 msi
try{
	start-BitsTransfer $URL_python `
	-destination "d:\python.msi"
}
catch{
	$_ | out-file "d:\ErrorDlPython.txt"
}

# graphviz_nullsoft (installer)
try{
  start-BitsTransfer $URL_grahviz `
  -destination "d:\graphviz.exe"
}
catch{
  $_ | out-file "d:\ErrorDlGrahviz.txt"
}

# az_cli_v2_msi
try{
  start-BitsTransfer $URL_azcli `
  -destination "d:\azcli.msi"
}
catch{
  $_ | out-file "d:\ErrorDownloadAzcliv2.txt"
}

# AWS_cli_v2_msi
try{
	Start-BitsTransfer $URL_AWSCLIV2 `
	-destination "d:\awscliv2.msi"
}
catch{
	$_ | out-file "d:\ErrorDownloadAwsCliV2.txt"
}

# Git-x64
try{
	Start-BitsTransfer $URL_gitx64 `
	-destination "d:\git.exe"
}
catch{
	$_ | out-file "d:\ErrorDownloadGit.txt"
}

# vs code
try {
	Start-BitsTransfer $URL_vsCode `
	-destination "d:\vsCode.exe"
		
}
catch {
	$_ | out-file "d:\ErrorDownloadVsCode.txt"
}

################
# INSTALL APPS #
################

# python msi
try{
	start msiExec -args "/i d:\python.msi ALLUSERS=1 ADDLOCAL=DefaultFeature,PrependPath /q /norestart /l*v d:\installPython2_7.txt" -wait
}
catch{
	$_ | out-file "d:\ErrorInstPython.txt"
}

# graphviz
try{
  start "d:\graphviz.exe" -args "/S" -wait
}
catch{
  $_ | out-file "d:\ErrorInstGrahviz.txt"
}

# az_cli_v2_msi
try{
  start msiExec -args "/i d:\azcli.msi /q /noRestart /l*v d:\installAzCliv2.log" -wait
}
catch{
  $_ | out-file "d:\ErrorInstallAzCliv2.log"
}

# AWS_cli_v2_msi
try{
	start msiExec -args "/i d:\awscliv2.msi /q /noRestart /l*v d:\installAwsCliv2.log" -wait
}
catch{
	$_ | out-file "d\ErrorInstallAwsCliV2.log"
}

# git-x64
try{
	start "d:\git.exe" -args "/VERYSILENT /NORESTART /LOG=d:\InstallGit.txt" -wait
}
catch{
	$_ | out-file "d:\ErrorInstallGit.txt"
}

# terraform bin (.exe)
try {
	ni -name terraform C:\ -type Directory
	Start-BitsTransfer $URL_terraform_exe `
	-destination "C:\terraform\terraform.exe"
}
catch {
	$_ | out-file "d:\ErrorInstallterraform.txt"
}

# vs code portable
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
	$_ | out-file "d:\ErrorInstallConsul_exe_bin.log"
}

# add terraform, vsCode, & git folders in the $Path
# run\code --to open vsCode
$OLDPATH = [System.Environment]::GetEnvironmentVariable('PATH','machine')
$terraform = "C:\terraform"
$Consul = "C:\Consul\"
# graphviz (ex: dot)
$graphviz = "C:\Program Files\Graphviz\bin"
$NEWPATH = "$OLDPATH;$terraform;$Consul;$graphviz"
[Environment]::SetEnvironmentVariable("PATH", "$NEWPATH", "Machine")


################
#  CUSTOM OS   #
################

# windows features
# wls-1
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
# enable vm feature
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

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

# Remove PendingReboot
Restart-computer -force
