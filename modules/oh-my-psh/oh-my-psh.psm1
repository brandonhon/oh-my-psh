# Check if profile exists

If ( Test-Path ("$Env:USERPROFILE\.oh-my-psh.config.ps1") ) {
    Write-Output "Detected a Oh-My-Psh Profile"
} else {
    cp $Env:USERPROFILE"\.oh-my-psh\template\oh-my-psh.config.ps1" $Env:USERPROFILE"\.oh-my-psh.config.ps1"
}

# Load Profile var
. $Env:USERPROFILE"\.oh-my-psh.config.ps1"

# Check for updates
. $Env:USERPROFILE"\.oh-my-psh\tools\check_for_updates.ps1"

# Execute Oh-My-Powershell
. $Env:USERPROFILE"\.oh-my-psh\oh-my-psh.ps1"
