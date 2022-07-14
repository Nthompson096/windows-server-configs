#
# Windows PowerShell script for AD DS Deployment, uncomment/edit some lines if you feel necessary.
#

Import-Module ADDSDeployment
Install-ADDSDomainController `
#-NoGlobalCatalog:$true `
#-CreateDnsDelegation:$true `
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

