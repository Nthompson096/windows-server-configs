Install-WindowsFeature -config .\ADDC-DHCP-DNS.XML

Get-Module servermanager
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
# Windows PowerShell script for AD DS Deployment
#

Import-Module ADDSDeployment
Install-ADDSForest `
-CreateDnsDelegation:$false `
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
