# A collection of windows sever 201x/202x powershell scripts and xml files.

## Windows DC DHCP, DNS, DHCP-DNS

To install these features change into directory after cloning this repo and run the approprie script, for example if i wanted to run a dhcp router inside my DC server i would change into the networking directory and run `.\networking.ps1`; just be sure to uncomment the 	`#Install-WindowsFeature -config .\DHCP.xml` command. to install a DC server with the powershell command enter into the DC directory and enter `.\Newforest.ps1`; you should be able to run this script after editing it inside notepad. Be sure to edit in anything you'd want in any of these scripts in the folders inside this repo.

## Windows SCCM

Same with SCCM, clone this repository and navigate to the SCCM folder, edit the following file `.\SetupSCCM.ps1` with notepad inside powershell then go ahead and run this script
with powershell; edit this script to whichever you'd like, if you want to download the ADK uncomment the block, if you'd like to download config manager uncomment the block, take a look at the script and uncomment/edit the commands you'd need. there's a more verbose guide [here](https://www.prajwaldesai.com/sccm-1902-install-guide-using-baseline-media/#Step-2-SCCM-1902-Prerequisites-Checklist) and [here](https://www.systemcenterdudes.com/complete-sccm-installation-guide-and-configuration/#design); this config file includes SCCM inside the same server as AD,DNS,DHCP etc; basically something Microsoft probably doesn't recommend but this is for something quick. additionally you can show Ethernet nics with ipconfig in powershell and edit the script that way.
