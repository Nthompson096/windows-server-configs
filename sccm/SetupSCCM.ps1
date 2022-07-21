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
640 360
800 600
1536 864
1024 768
1280 800
1280 1024
1360 768
1366 768
1440 900
1536 864
1600 900
1680 1050
1920 1080
#>
#Renames the computer; will ask for a password.
# Rename-Computer -NewName SCCM-Server -LocalCredential Administrator -PassThru
#
#
#	Windows ADK, what you could do is download the EXE's on the host machine and install filezilla on the guest and sysprep it with oobe.
#
<#
$source1 = 'https://download.microsoft.com/download/8/6/c/86c218f3-4349-4aa5-beba-d05e48bbc286/adk/adksetup.exe'
$destination1 = 'C:\adk.exe'
Invoke-WebRequest -Uri $source1 -OutFile $destination1
#>
#
#	Windows ADK-PE
#
#
<#
$source2 = 'https://download.microsoft.com/download/5/2/5/525dcde0-c7b8-487a-894d-0952775a78c7/adkwinpeaddons/adkwinpesetup.exe'
$destination2 = 'C:\adkwinpesetup.exe'
Invoke-WebRequest -Uri $source2 -OutFile $destination2
#>
#
#
# This is for config manager, this will be a 1.2 GB download.
# Would advise you to install filezilla and sysprep with oobe, along with other drivers you'd need.
#
<#
$source3 = 'https://download.microsoft.com/download/f/5/5/f55e3b9c-781d-493b-932b-16aa1b2f6371/MEM_Configmgr_2203.exe?culture=en-us&country=US'
$destination3 = 'C:\MEM_Configmgr_2203.exe'
Invoke-WebRequest -Uri $source3 -OutFile $destination3
#>
#
# Uncomment one SQL Server download
#
# SQL Server MGM Studio
<#
$source4 = 'https://download.microsoft.com/download/8/a/8/8a8073d2-2e00-472b-9a18-88361d105915/SSMS-Setup-ENU.exe'
$destination4 = 'C:\SSMS-Setup-ENU.exe'
Invoke-WebRequest -Uri $source4 -OutFile $destination4
#>
# SQL Reporting Services
<#
$source4 = 'https://download.microsoft.com/download/1/a/a/1aaa9177-3578-4931-b8f3-373b24f63342/SQLServerReportingServices.exe'
$destination4 = 'C:\SQLServerReportingServices.exe'
Invoke-WebRequest -Uri $source4 -OutFile $destination4
# https://download.microsoft.com/download/1/a/a/1aaa9177-3578-4931-b8f3-373b24f63342/SQLServerReportingServices.exe
#>
# SQL Server 2019
<# 
$source4 = 'https://download.microsoft.com/download/4/8/6/486005eb-7aa8-4128-aac0-6569782b37b0/SQL2019-SSEI-Eval.exe'
$destination4 = 'C:\SQL2019-SSEI-Eval.exe'
Invoke-WebRequest -Uri $source4 -OutFile $destination4
#>
# SQL Server 2017
#
<# 
$source4 = 'https://download.microsoft.com/download/5/2/2/522EE642-941E-47A6-8431-57F0C2694EDF/SQLServer2017-SSEI-Eval.exe?culture=en-us&country=us'
$destination4 = 'C:\SQLServer2017-SSEI-Eval.exe'
Invoke-WebRequest -Uri $source4 -OutFile $destination4
#>
#
# SQL Server 2016
<#
$source4 = 'https://download.microsoft.com/download/A/C/6/AC6F2802-4CC4-40B2-B333-395A4291EF29/SQLServer2016-SSEI-Eval.exe?culture=en-us&country=us'
$destination4 = 'C:\SQLServer2016-SSEI-Eval.exe'
Invoke-WebRequest -Uri $source4 -OutFile $destination4
#>
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
# For AD domains joins
<# 
New-NetIPAddress -IPAddress "x.x.x.x" -InterfaceAlias "Clients" -DefaultGateway "x.x.x.x" -PrefixLength xx
Set-DnsClientServerAddress -InterfaceAlias "Internet" -ServerAddresses "x.x.x.x","x.x.x.x"
Set-DnsClientServerAddress -InterfaceAlias "Clients" -ServerAddresses "x.x.x.x","x.x.x.x"
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
# Install-WindowsUpdate -MicrosoftUpdate -AcceptAll
# Add the computer to the domain of your choice in this script
add-Computer -DomainName Domain01 -Restart
#>
