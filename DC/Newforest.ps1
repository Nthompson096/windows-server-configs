#
# Windows PowerShell script for AD DS Deployment, uncomment/edit some lines if you feel necessary.
#

Import-Module ADDSDeployment
Install-ADDSForest `
# -CreateDnsDelegation:$false `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "WinThreshold" `
# Feel free to add a domain and domain bios name.
# -DomainName " " `
# -DomainNetbiosName " " `
-ForestMode "WinThreshold" `
# -InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
# -NoRebootOnCompletion:$false `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true

