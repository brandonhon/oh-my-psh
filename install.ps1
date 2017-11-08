param (
  [bool]$local = $false,
  [bool]$force = $false
)

# Load utils
. ./tools/utils.ps1

function Install-OMP {
  Check-Recommends
  Check-Dependencies

  Write-Output "Deleting $Env:USERPROFILE\.oh-my-sph"
  Remove-Item -Force -Recurse "$Env:USERPROFILE\.oh-my-psh" -ErrorAction SilentlyContinue
  if ($local) {
    # Deploy from current folder
    Write-Output "Coping Oh-My-Psh to its destination"
    Copy-Item -Recurse -Force .\  "$Env:USERPROFILE\.oh-my-psh\"
  } else {
    # Clone project
    Write-Output "Cloning Oh-My-Psh from Github"
    git clone https://github.com/pecigonzalo/Oh-My-Psh.git $Env:USERPROFILE\.oh-my-psh
  }
  # Copy module to the user modules folder
  Write-Output "Installting Oh-My-Psh Module"
  New-Item -Type Directory "$([Environment]::GetFolderPath("mydocuments"))\WindowsPowerShell\Modules" -Force | Out-Null
  Copy-Item -Recurse -Force $Env:USERPROFILE\.oh-my-psh\modules\oh-my-psh  `
    "$([Environment]::GetFolderPath("mydocuments"))\WindowsPowerShell\Modules\"
}

# Add Oh-My-Psh to local Powershell profile
function Insert-Content {
  param ( [String]$Path )
  process {
    $( ,$_; Get-Content $Path -ea SilentlyContinue) | Out-File $Path
  }
}

if (! ( Test-Path $PROFILE ) ) {
  Write-Output 'No profile found. Please create profile by running "New-Item -Path $PROFILE -Type File -Force" in the console.'
} else {
  "#`r`n" + '# Welcome to a whole new world of Powershell script management.' + "`r`n#`r`n" + 'Import-Module "Oh-My-Psh" -DisableNameChecking -NoClobber' + "`r`n`r`n" | Insert-Content $PROFILE
}

#
# Install logic
#
if ( Test-Path $Env:USERPROFILE\.oh-my-psh ) {
  Write-Output "Oh-My-Psh is already installed"
  if ( $force -eq $true ) {
    Write-Output "Reinstalling Oh-My-Psh"
    Install-OMP
  }
} else {
  Install-OMP
}
.$PROFILE
