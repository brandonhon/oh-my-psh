# Install modules
& "$Env:USERPROFILE\.oh-my-psh\tools\modules.ps1"

# Handle Plugins
foreach ($plugin in $plugins) {
  Write-Verbose  "Loading from: $Env:USERPROFILE\.oh-my-psh\plugins\$plugin"
  $files = Get-ChildItem $Env:USERPROFILE\.oh-my-psh\plugins\$plugin -Filter *.ps1
  foreach ($file in $files) {
    Write-Verbose  "  Loading file: $($file.FullName)"
    . $file.FullName
  }
}

# Load theme
. "$Env:USERPROFILE\.oh-my-psh\themes\$theme.ps1"
