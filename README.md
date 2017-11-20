# Oh-My-Psh

#### NOTE: This is a work in progress (WIP). Use at your own risk.

My version of [Oh-My-Zsh](ohmyz.sh) for Powershell v4+ based on the great work of Gonzalo Peci and his work
[Oh-My-Psh](https://github.com/brandonhon/oh-my-psh). Thank you Gonzalo for the hard work and inspiration.

# Installation Instructions

**_Requirements:_**
- *Powershell 4+ (not tested on previous versions)*


### Internet Installation
**_Requirements:_**
- *Git - Must be installed for internet installation. [git-for-windows install](https://git-for-windows.github.io)*

**_Notes:_**

The installation script will check for the presence of a Powershell profile and notify you if one does or does not exist. At this time you can choose to create one by simply answering the prompt. Please note the script will only create a profile for the running console. In this case a profile was created for ISE only.
```
No profile found. Would you like to create one now? [y/n]: y

Profile for Windows Powershell ISE Host has been created
Enjoy!
```
```
Profile for Windows Powershell ISE Host has been found. Prepending Import-Module "Oh-My-Psh" -DisableNameChecking -NoClobber to profile

Enjoy!
```

In the event that a profile is found the following will be prepended to the profile:
```
#
# Welcome to a whole new world of Powershell script management
# Created by Oh-My-Psh installer
#
Import-Module "Oh-My-Psh" -DisableNameChecking -NoClobber
```

**_The good stuff:_**

*Installation Steps:*
1. *Open Powershell Console or ISE*
2. *Run*
```powershell
cd ~
iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/brandonhon/oh-my-psh/master/install.ps1'))
```
3. *Check profile for prepended text. Run ```notepad $PROFILE``` and look for:*
```
#
# Welcome to a whole new world of Powershell script management
# Created by Oh-My-Psh installer
#
Import-Module "Oh-My-Psh" -DisableNameChecking -NoClobber
```
4. *The script is set to reload your profile via dot sourcing. However, Windowze being finicky you may need to restart Powershell.*
5. *Enjoy!*

### Alternative Installation (local installation):
Download and extract or clone the repository into a folder e.g. ```C:\TEMP```
Open a Powershell session and run
```powershell
cd C:\TEMP
.\install.ps1 -local $true
```

# Configuration

Configuration parameters are found under
```powershell
$env:USERPROFILE\.powershellrc.ps1
```
Open it with your prefered editor and change as you want, keep in mind some functionality is still WIP but don't hesitate on reporting any issue you have.
