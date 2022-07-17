#Active Directory with DNS installed or a delegation
#
#Install-WindowsFeature -config .\AD-DNS.xml
#Active Directory without a DNS installed or a delegation
#
#Install-WindowsFeature -config .\AD.xml

# only use one of the following code blocks.
<#
# New Forest
# Windows PowerShell script for AD DS Deployment, uncomment/edit some lines if you feel necessary.
# Feel free to add a domain and domain bios name.

Import-Module ADDSDeployment
Install-ADDSForest `
# -CreateDnsDelegation:$false `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "WinThreshold" `
# -DomainName " " `
# -DomainNetbiosName " " `
-ForestMode "WinThreshold" `
# -InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
# -NoRebootOnCompletion:$false `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true
#>

<#
# Add to doamin
# Windows PowerShell script for AD DS Deployment, uncomment/edit some lines if you feel necessary.
#

Import-Module ADDSDeployment
Install-ADDSDomainController `
# -NoGlobalCatalog:$true `
# -CreateDnsDelegation:$true `
-Credential (Get-Credential) `
-CriticalReplicationOnly:$false `
-DatabasePath "C:\Windows\NTDS" `
# -DomainName " " `
# -InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
# -NoRebootOnCompletion:$false `
# -ReplicationSourceDC " " `
-SiteName "Default-First-Site-Name" `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true
#>
<#
# New Existing domain
# Windows PowerShell script for AD DS Deployment, uncomment/edit some lines if you feel necessary.
#

Import-Module ADDSDeployment
Install-ADDSDomain `
# -NoGlobalCatalog:$false `
# -CreateDnsDelegation:$true `
-Credential (Get-Credential) `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "WinThreshold" `
-DomainType "ChildDomain" `
# -InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
# -NewDomainName " " `
# -NewDomainNetbiosName " " `
# -ParentDomainName " " `
# -NoRebootOnCompletion:$false `
-SiteName "Default-First-Site-Name" `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true
#>
