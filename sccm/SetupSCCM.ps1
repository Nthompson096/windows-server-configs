#SetupSCCM script (include windows update module)
#
#
#
#Compiled by seperate scripts, this has no PSwindows update so use sconfig.

Set-DisplayResolution -Width 1920 -Height 1080 -Force

Rename-Computer -NewName SCCM -LocalCredential Administrator -PassThru

New-NetLbfoTeam -Name "Internet" -TeamMembers "Ethernet" -TeamingMode Static

New-NetLbfoTeam -Name "Clients" -TeamMembers "Ethernet 2" -TeamingMode Static

New-NetIPAddress -IPAddress "192.168.1.1" -InterfaceAlias "Clients" -DefaultGateway "192.168.1.1" -PrefixLength 24

Set-DnsClientServerAddress -InterfaceAlias "Clients" -ServerAddresses "127.0.0.1"

shutdown /r
