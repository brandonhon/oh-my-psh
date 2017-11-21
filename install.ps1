param (
  [bool]$local = $false,
  [bool]$force = $false
)

function Check-Dependencies {
  $exit = 0
  # Check git installed
  try {
    Get-Command git -ErrorAction Stop | Out-Null
  } catch {
    Write-Error "Git not found, please install git or add it to your PATH before running again"
    $exit = 1
  }
  # If any errors exit install
  if ($exit) { exit 1 }
}

function Check-Recommends {
  # Check PSCX installed
  if (!(Get-Module PSCX -ListAvailable)) {
    Write-Warning "PSCX not found, while not required it is recommended: https://www.powershellgallery.com/packages/Pscx/"
  }
  # Check PSColor installed
  if (!(Get-Module PSColor -ListAvailable)) {
    Write-Warning "PSColor not found, while not required it is recommended: https://github.com/pecigonzalo/pscolor"
  }
}

function Install-OMP {
  Write-Output "Deleting $Env:USERPROFILE\.oh-my-psh"
  Remove-Item -Force -Recurse "$Env:USERPROFILE\.oh-my-psh" -ErrorAction SilentlyContinue
  if ($local) {
    # Deploy from current folder
    Write-Output "Coping Oh-My-Psh to its destination"
    Copy-Item -Recurse -Force .\  "$Env:USERPROFILE\.oh-my-psh\"
  } else {
    # Clone project
    Write-Output "Cloning Oh-My-Psh from Github"
    git clone https://github.com/brandonhon/oh-my-psh.git $Env:USERPROFILE\.oh-my-psh
  }
  # Copy module to the user modules folder
  Write-Output "Installting Oh-My-Psh Module"
  New-Item -Type Directory "$([Environment]::GetFolderPath("mydocuments"))\WindowsPowerShell\Modules" -Force | Out-Null
  Copy-Item -Recurse -Force $Env:USERPROFILE\.oh-my-psh\modules\oh-my-psh  `
    "$([Environment]::GetFolderPath("mydocuments"))\WindowsPowerShell\Modules\"
}

# Prepend text to file
function Insert-Content {
  param ( [String]$Path )
  process {
    $( ,$_; Get-Content $Path -ea SilentlyContinue) | Out-File $Path
  }
}

# Create profile
function Create-Profile {
  New-Item -Path $PROFILE -Type File -Force | Out-Null
  "#`r`n" + '# Welcome to a whole new world of Powershell script management.' + "`r`n#`r`n" + `
  'Import-Module "Oh-My-Psh" -DisableNameChecking -NoClobber' + "`r`n`r`n" | Insert-Content $PROFILE
}

#
# Install logic
#
if ( Test-Path $Env:USERPROFILE\.oh-my-psh ) {
  Write-Output "Oh-My-Psh is already installed. "
  if ( $force -eq $true ) {
    Write-Output "Reinstalling Oh-My-Psh"
    Install-OMP
  }
} else {
  Install-OMP
}

# Check for profile and create/prepend as necessary
if (! ( Test-Path $PROFILE ) ) {
  $h = $HOST.Name
  Write-Host "No profile found. " -ForegroundColor Red -NoNewline
  $yn = Read-Host -Prompt 'Would you like to create one now? [y/n] '
  if ( $yn -match "[yY]" ) {
    Create-Profile; if ( Test-Path $PROFILE ) { Write-Host "`r`nProfile for $h only has been created" -ForegroundColor Green }
    Write-Host "Enjoy!" -ForegroundColor Green
    Write-Host "`r`n"
  } else {
    clear
    Write-Host "`r`nSorry to see you`r`n" -ForegroundColor Yellow
  }
} else {
  Write-Host "Profile for $h has been found. Prepending " -ForegroundColor Green -NoNewline
  Write-Host "Import-Module ""Oh-My-Psh"" -DisableNameChecking -NoClobber " -ForegroundColor Yellow -NoNewline
  Write-Host "to profile" -ForegroundColor Green
  "#`r`n" + '# Welcome to a whole new world of Powershell script management' + "`r`n" + '# Created by Oh-My-Psh installer' `
    + "`r`n#`r`n" + 'Import-Module "Oh-My-Psh" -DisableNameChecking -NoClobber' + "`r`n`r`n" | Insert-Content $PROFILE
  Write-Host "`r`n"
  Write-Host "Enjoy!" -ForegroundColor Green
  Write-Host "`r`n"
}

. $PROFILE
