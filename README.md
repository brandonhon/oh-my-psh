# Oh-My-Psh

#### NOTE: This is a work in progress (WIP). Use at your own risk.

My version of [Oh-My-Zsh](ohmyz.sh) for Powershell v4+ based on the great work of Gonzalo Peci and his work
[Oh-My-Psh](https://github.com/brandonhon/oh-my-psh). Thank you Gonzalo for the hard work and inspiration.

# Installation Instructions

**_Requirements:_**
- *Powershell 4+ (not tested on previous versions)*


### Internet Installation
**_Requirements:_**
- *Git - Must be installed for internet installation. Download here :arrow_right: [git-for-windows](https://git-for-windows.github.io)*

During installation the script will check for the presence of a Powershell profile and notify you if one does not exist. At this time you can choose to create one by simply answering the prompt. Please note the script will only create a profile for the running Powershell console. In this case a profile was created for ISE.

```
No profile found. Would you like to create one now? [y/n]: y

Profile for Windows Powershell ISE Host has been created
Enjoy!
```

Run:

```powershell
cd ~
iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/brandonhon/oh-my-psh/master/install.ps1'))
```
The installation script should prepend the correct Import-Module line to the powershell profile. To check
run ```notepad $PROFILE```.

Add the following line to your powershell profile:
```powershell
Import-Module "Oh-My-Psh" -DisableNameChecking -NoClobber
```
Now reload your Powershell profile

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
