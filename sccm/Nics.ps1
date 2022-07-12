#Use this if NIC's we're not set up right.

New-NetLbfoTeam -Name "Internet" -TeamMembers "Ethernet" -TeamingMode Static
New-NetLbfoTeam -Name "Clients" -TeamMembers "Ethernet 2" -TeamingMode Static
#
#set the new IP address and DNS down here.
#
#
#
#
New-NetIPAddress -IPAddress "192.168.1.1" -InterfaceAlias "Clients" -DefaultGateway "192.168.1.1" -PrefixLength 24
Set-DnsClientServerAddress -InterfaceAlias "Clients" -ServerAddresses "127.0.0.1"
