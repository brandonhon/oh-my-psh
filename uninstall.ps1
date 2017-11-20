#
# Uninstall Logic
#
Write-Output "Deleting $Env:USERPROFILE\.oh-my-psh"
Remove-Item -Force -Recurse "$Env:USERPROFILE\.oh-my-psh" -ErrorAction SilentlyContinue
Write-Output "Deleting oh-my-psh module"
Remove-Item -Force -Recurse  "$([Environment]::GetFolderPath("mydocuments"))\WindowsPowerShell\Modules\oh-my-psh" -ErrorAction SilentlyContinue
Write-Output "All done, your oh-my-psh config file will be kept, please remember"
Write-Output "to remove the Import-Module logic from your `$PROFILE."