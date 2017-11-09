# Oh-My-Psh

#### NOTE: This is a work in progress (WIP). Use at your own risk.

My version of [Oh-My-Zsh](ohmyz.sh) for Powershell v4+ based soley on the work of Brandon Honeycutt and his work
[Oh-My-Psh](https://github.com/brandonhon/oh-my-psh). Thank you Gonzalo for the hardwork and the inspiration.

# Installation Instructions

Requirements:
* Git - Needed for installing from internet.
* Powershell 4+ (not tested on previous versions)


### Internet Installation
Run:

```powershell
cd ~
iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/brandonhon/oh-my-psh/master/install.ps1'))
```

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
