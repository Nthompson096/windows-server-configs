#SetupSCCM script (include windows update module)
#
#
#
#Compiled by seperate scripts
#Install script for PSwindowsUpdate; requires internet.
#Use this if you want to install update via powershell; or just use sconfig for updates if it failed.
#Feel free to edit the IP addresses, hostnames and teams.

Install-Module -Name PSWindowsUpdate -Force

Import-Module PSWindowsUpdate

Set-DisplayResolution -Width 1920 -Height 1080 -Force

Rename-Computer -NewName SCCM -LocalCredential Administrator -PassThru

New-NetLbfoTeam -Name "Internet" -TeamMembers "Ethernet" -TeamingMode Static

New-NetLbfoTeam -Name "Clients" -TeamMembers "Ethernet 2" -TeamingMode Static

New-NetIPAddress -IPAddress "192.168.1.1" -InterfaceAlias "Clients" -DefaultGateway "192.168.1.1" -PrefixLength 24

Set-DnsClientServerAddress -InterfaceAlias "Clients" -ServerAddresses "127.0.0.1"

Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot

shutdown /r
