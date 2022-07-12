#SetupSCCM script (include windows update module)
#
#
#Install script for PSwindowsUpdate; requires internet.
#Use this if you want to install update via powershell; or just use sconfig for updates if it failed.
#Feel free to edit the IP addresses, hostnames, monitor width and height, nic teams.

#Windows Update Powershell module
Install-Module -Name PSWindowsUpdate -Force

Import-Module PSWindowsUpdate

Set-DisplayResolution -Width 1920 -Height 1080 -Force

#Hostname
Rename-Computer -NewName SCCM -LocalCredential Administrator -PassThru

#Internet Team
New-NetLbfoTeam -Name "Internet" -TeamMembers "Ethernet" -TeamingMode Static

#Cliant Team
New-NetLbfoTeam -Name "Clients" -TeamMembers "Ethernet 2" -TeamingMode Static

#Client Team Static IP
New-NetIPAddress -IPAddress "192.168.1.1" -InterfaceAlias "Clients" -DefaultGateway "192.168.1.1" -PrefixLength 24

#DNS Address
Set-DnsClientServerAddress -InterfaceAlias "Clients" -ServerAddresses "127.0.0.1"

Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot

shutdown /r
