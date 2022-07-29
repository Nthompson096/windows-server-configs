# A collection of windows sever 201x/202x powershell scripts and xml files.

## Windows DC DHCP, DNS, DHCP-DNS

To install these features change into directory after cloning this repo and run the appropriate script, for example if i wanted to run a dhcp router inside my DC server i would change into the networking directory and run `.\networking.ps1`; just be sure to uncomment the 	`#Install-WindowsFeature -config .\DHCP.xml` command. to install a DC server with the powershell command enter into the DC directory and enter `.\Newforest.ps1`; you should be able to run this script after editing it inside notepad. Be sure to edit in anything you'd want in any of these scripts in the folders inside this repo. *Also contains info on what you want to do inside these scripts*

## Windows SCCM

Same with SCCM, clone this repository and navigate to the SCCM folder, edit the following file `.\SetupSCCM.ps1` with notepad inside powershell then go ahead and run this script
with powershell; edit this script to whichever you'd like, if you want to download the ADK uncomment the block, if you'd like to download config manager uncomment the block, take a look at the script and uncomment/edit the commands you'd need. there's a more verbose guide [here](https://www.prajwaldesai.com/sccm-1902-install-guide-using-baseline-media/#Step-2-SCCM-1902-Prerequisites-Checklist); this config file includes SCCM inside the same server as AD,DNS,DHCP etc; basically something Microsoft probably doesn't recommend but this is for something quick. additionally you can show Ethernet nics with ipconfig in powershell and edit the script that way. Mind you that config manager doesn't come with the ISO anymore; as DVD's are legacy hardware, istead it just packs itself as an EXE. There's also some goodies about SQL being on the local account when deploying config manager, info found [here](https://social.technet.microsoft.com/wiki/contents/articles/36617.sccm-2016-troubleshooting-resolve-sql-server-service-account-issue-during-setup.aspx) Errors about Dynamic ports would be [here](http://www.systemadept.com/2018/02/23/resolve-sccm-site-require-sql-server-tcp-enabled-and-set-static-port/?i=1). Note this setup may take a few hours or more depending on how powerful your computer/VM is. [Here's some tasks to do after the install](https://docs.microsoft.com/en-us/mem/configmgr/core/servers/manage/install-in-console-updates#bkmk_after) </br>
*Note: Most of the exe's should be stored in the C:\ drive.*
If you're getting errors on this list not being completed; add in more ram, I started out with at least 16 GB (VM) for the SCCM server but you could try 8 GB; typical workstations (host) could be 64GB in ram for GNS3 (or higher if you're fancy)

To install the client on a computer; go to the share you installed SCCM into; it would usually reside in `\\computer-name\SMS_sitecode`
An example would be my lab in `\\sccm-server\SMS_001` from there copy cmtrace from tools and place it inside the desktop; place Client inside C:\.

When you execute ccmsetup be sure to add these switches inside powershell; `\mp:sitename /logon /SMSSITECODE=sitecode`
Example `\mp:sccm-sever-center /logon /SMSSITECODE=001` if you have a fallback sever include `/FSP=fallbackname`

## Wsus
If you ever had errors about wsus erroring out just use [This](https://docs.microsoft.com/en-us/answers/questions/754982/windows-server-2022-wsus-fatal-error-the-schema-ve.html) Microsoft gave wsus a type-o apparently.

1) Go to C:\Program Files\Update Services\Database

2) Take ownership of VersionCheck.sql from "TrustInstall"

3) Open file in notepad

4) On line 3 change "DECLARE @scriptMinorVersion int = (11)" to "DECLARE @scriptMinorVersion int = (51)"
the "11" is a typo

5) make "Everyone" the owner

6) Re-run post install config

7) Have a beer.
