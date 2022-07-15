# SetupSCCM script (Uncomment "<#,#>" the stuff you'd want)
#
#
# Requires internet to download mem-config mananger and SQL server.
#
# Windows PS-Update module; requires internet to install.
<#
Install-Module -Name PSWindowsUpdate -Force
Import-Module PSWindowsUpdate
#>
#
# Set-DisplayResolution -Width 1920 -Height 1080 -Force
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
#Renames the computer; will ask for a password.
# Rename-Computer -NewName SCCM -LocalCredential Administrator -PassThru
#
#
#	Windows ADK, what you could do is download the EXE's on the host machine and install filezilla on the guest and sysprep it with oobe.
#
<#
$source1 = 'https://download.microsoft.com/download/8/6/c/86c218f3-4349-4aa5-beba-d05e48bbc286/adk/adksetup.exe'
$destination1 = './adk.exe'
Invoke-WebRequest -Uri $source1 -OutFile $destination1
#>
#
#	Windows ADK-PE
#
#
<#
$source2 = 'https://download.microsoft.com/download/5/2/5/525dcde0-c7b8-487a-894d-0952775a78c7/adkwinpeaddons/adkwinpesetup.exe'
$destination2 = './adkwinpesetup.exe'
Invoke-WebRequest -Uri $source2 -OutFile $destination2
#>
#
#
# This is for config manager, this will be a 1.2 GB download.
#
#
<#
$source3 = 'https://download.microsoft.com/download/f/5/5/f55e3b9c-781d-493b-932b-16aa1b2f6371/MEM_Configmgr_2203.exe?culture=en-us&country=US'
$destination3 = './MEM_Configmgr_2203.exe'
Invoke-WebRequest -Uri $source3 -OutFile $destination3
#>
#
# Uncomment one SQL Server download
#
# SQL Server 2019
<# 
$source4 = 'https://download.microsoft.com/download/4/8/6/486005eb-7aa8-4128-aac0-6569782b37b0/SQL2019-SSEI-Eval.exe'
$destination4 = './SQL2019-SSEI-Eval.exe'
Invoke-WebRequest -Uri $source4 -OutFile $destination4
#>
# SQL Server 2017
#
<# 
$source4 = 'https://download.microsoft.com/download/5/2/2/522EE642-941E-47A6-8431-57F0C2694EDF/SQLServer2017-SSEI-Eval.exe?culture=en-us&country=us'
$destination4 = './SQLServer2017-SSEI-Eval.exe'
Invoke-WebRequest -Uri $source4 -OutFile $destination4
#>
#
# SQL Server 2016
<#
$source4 = 'https://download.microsoft.com/download/A/C/6/AC6F2802-4CC4-40B2-B333-395A4291EF29/SQLServer2016-SSEI-Eval.exe?culture=en-us&country=us'
#$destination4 = './SQLServer2016-SSEI-Eval.exe'
Invoke-WebRequest -Uri $source4 -OutFile $destination4
#>
#
# Sets teams inside the server.
<# 
New-NetLbfoTeam -Name "Internet" -TeamMembers "Ethernet" -TeamingMode Static
New-NetLbfoTeam -Name "Clients" -TeamMembers "Ethernet 2" -TeamingMode Static
#>
#Sets a satic IP address and DNS address as loopback
<# 
New-NetIPAddress -IPAddress "192.168.1.1" -InterfaceAlias "Clients" -DefaultGateway "192.168.1.1" -PrefixLength 24
Set-DnsClientServerAddress -InterfaceAlias "Clients" -ServerAddresses "127.0.0.1"
#>
# Will reboot the computer with no update.
# shutdown /r
#
# This will reboot the computer with updates, as long as you have pswindowsupdate installed.
#
# Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot
#
# be sure to run ADDC_SCCM.ps1 in powershell, or run this
<# 
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll
# Add the computer to the domain of your choice in this script
add-Computer -DomainName Domain01 -Restart
#>
