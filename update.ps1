# Go into the installation repository
# Get new code and rebase current changes
Push-Location "$Env:USERPROFILE\.oh-my-psh"
git pull --rebase --stat origin master
if ($LASTEXITCODE) {
  Pop-Location
  Write-Host "Something went wrong with the git pull, unable to update" -ForegroundColor Red
  exit 1
}
Pop-Location
# Copy module to the user modules folder
Write-Host "Installing Oh-My-Psh Module"
New-Item -Type Directory "$([Environment]::GetFolderPath("mydocuments"))\WindowsPowerShell\Modules" -Force | Out-Null
Copy-Item -Recurse -Force $Env:USERPROFILE\.oh-my-psh\modules\oh-my-psh  `
  "$([Environment]::GetFolderPath("mydocuments"))\WindowsPowerShell\Modules\"

# If all good, let the user know
if ($?) {
  Write-Host "Updated Oh-My-Psh successfully!" -ForegroundColor Green
  Write-Host "PLEASE RELOAD YOUR PROFILE DOING: `n.$PROFILE" -ForegroundColor Green
} else {
  Write-Host "Something went wrong with the update, you might need to reinstall" -ForegroundColor Red
}