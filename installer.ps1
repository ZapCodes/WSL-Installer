$ErrorActionPreference = 'SilentlyContinue'
$wshell = New-Object -ComObject Wscript.Shell
$Button = [System.Windows.MessageBoxButton]::YesNoCancel
$ErrorIco = [System.Windows.MessageBoxImage]::Error
If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
	Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
	Exit
}


Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

Write-Host "Restart needed"

Set-Location C:\

if (Test-Path ~\C:\WSL){
    'Folder exists already'
}  


mkdir WSL

Set-Location WSL

#Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile Ubuntu.appx -UseBasicParsing

#Rename-Item .\Ubuntu.appx .\Ubuntu.zip

#Expand-Archive .\Ubuntu.zip .\Ubuntu

Set-Location .\Ubuntu\

.\ubuntu1804.exe
