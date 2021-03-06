#use this script after you have used SetupSCCM.ps1 in order to set the new computer name.

Get-Module servermanager

# Use only if you want a stand-alone DC-DHCP-SCCM server
# Install-WindowsFeature -config .\ADDC-DHCP-DNS.XML
#
#
Install-WindowsFeature Web-Windows-Auth

Install-WindowsFeature Web-ISAPI-Ext

Install-WindowsFeature Web-Metabase

Install-WindowsFeature Web-WMI

Install-WindowsFeature BITS

Install-WindowsFeature RDC

Install-WindowsFeature Web-Asp-Net

Install-WindowsFeature Web-Asp-Net45

Install-WindowsFeature NET-HTTP-Activation

Install-WindowsFeature NET-Non-HTTP-Activ
#
#
# Windows PowerShell script for AD DS Deployment, Stand-alone DC.
#
<# 
Import-Module ADDSDeployment
Install-ADDSForest `
# -createDnsDelegation:$false `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "WinThreshold" `
-DomainName "sccm.edu" `
-DomainNetbiosName "SCCM0" `
-ForestMode "WinThreshold" `
-InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
-NoRebootOnCompletion:$false `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true
#>
