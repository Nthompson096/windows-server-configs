# SetupSCCM script (Uncomment "<#,#>" for the stuff you'd want)
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
<#
Common display resolutions, pick your flavor and place them inside 'set-DisplayResolution', do not un-comment this block.
Useful if you are just running windows server in VNC instead of spice; or didn't have spice installed prior to oobe.
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
# Renames the computer; will ask for a password.
# Rename-Computer -NewName DC -LocalCredential Administrator -PassThru
#
# Sets teams inside the server.
<# 
New-NetLbfoTeam -Name "Internet" -TeamMembers "Ethernet" -TeamingMode Static
New-NetLbfoTeam -Name "Clients" -TeamMembers "Ethernet 2" -TeamingMode Static
#>
<# 
New-NetLbfoTeam -Name "Internet" -TeamMembers "Ethernet" -TeamingMode SwitchIndependent
New-NetLbfoTeam -Name "Clients" -TeamMembers "Ethernet 2" -TeamingMode SwitchIndependent
#>
<# 
New-NetLbfoTeam -Name "Internet" -TeamMembers "Ethernet" -TeamingMode LACP
New-NetLbfoTeam -Name "Clients" -TeamMembers "Ethernet 2" -TeamingMode LACP
#>
# Sets a satic IP address and DNS address as loopback
# Set the values
<# 
New-NetIPAddress -IPAddress "x.x.x.x" -InterfaceAlias "Clients" -DefaultGateway "x.x.x.x" -PrefixLength xx
Set-DnsClientServerAddress -InterfaceAlias "Clients" -ServerAddresses "x.x.x.x"
#>
# Will reboot the computer with no update.
# shutdown /r
#
# This will reboot the computer with updates, as long as you have pswindowsupdate installed.
#
# Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot
#
# Add the computer to the domain of your choice in this script
# If you encounter an error joining a doamin, turn off the firewall or switch nics.
<# 
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll
add-Computer -DomainName Domain01 -Restart
#>
