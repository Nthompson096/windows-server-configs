#DCsetup script (Uncomment "<#,#>" for the stuff you'd want)
#
#
#
# Windows PS-Update module; requires internet to install.
<#
Install-Module -Name PSWindowsUpdate -Force
Import-Module PSWindowsUpdate
#>
#
# Set-DisplayResolution -Width 1440 -Height 900 -Force
#
# do not un-comment this following block.
<# Common display resolutions, pick your flavor and place them inside 'set-DisplayResolution'
640360
800x600
1536x864
1024x768
1280x800
1280x1024
1360x768
1366x768
1440x900
1536x864
1600x900
1680x1050
1920x1080
#>
#Renames the computer; will ask for a password.
# Rename-Computer -NewName DC -LocalCredential Administrator -PassThru
#
#Sets teams inside the server.
# New-NetLbfoTeam -Name "Internet" -TeamMembers "Ethernet" -TeamingMode Static
#
# New-NetLbfoTeam -Name "Clients" -TeamMembers "Ethernet 2" -TeamingMode Static
#
#Sets a satic IP address and DNS address as loopback, can be used on regular ethernet nics
# New-NetIPAddress -IPAddress "192.168.1.1" -InterfaceAlias "Clients" -DefaultGateway "192.168.1.1" -PrefixLength 24
#
# Set-DnsClientServerAddress -InterfaceAlias "Clients" -ServerAddresses "127.0.0.1"
#
# Will reboot the computer with no update.
# shutdown /r
#
#This will reboot the computer with updates, as long as you have pswindowsupdate installed.
#
# Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot
#
