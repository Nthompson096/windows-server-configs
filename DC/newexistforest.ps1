#
# Windows PowerShell script for AD DS Deployment, uncomment/edit some lines if you feel necessary.
#

Import-Module ADDSDeployment
Install-ADDSDomain `
#-NoGlobalCatalog:$false `
#-CreateDnsDelegation:$true `
-Credential (Get-Credential) `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "WinThreshold" `
-DomainType "ChildDomain" `
#-InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
# Feel free to add a domain, domain bios name and a parent domain
# -NewDomainName " " `
# -NewDomainNetbiosName " " `
# -ParentDomainName " " `
# -NoRebootOnCompletion:$false `
-SiteName "Default-First-Site-Name" `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true

