#Windows Server Networking
#
# Install-WindowsFeature -config .\DHCP.xml
#Active Directory without a DNS installed or a delegation
#
# Install-WindowsFeature -config .\DHCP-DNS.xml
#
#DNS Sever
#
# Install-WindowsFeature -config .\DNS.xml
# 
# Feel Free to add servers in this code block
# Use Get-DhcpServerInDC for a list of DHCP servers
<#
Add-DhcpServerInDC -DnsName host.name.example -IPAddress x.x.x.x
#>
