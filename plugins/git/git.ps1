try {
    Get-command -Name "git" -ErrorAction Stop >$null
    if (Get-Module "psh-git" -ListAvailable) {
        $gitStatus = $true
    } else { throw }
} catch {
    Write-Warning "Missing git support, install psh-git with 'Install-Module psh-git' and restart cmder."
    $gitStatus = $false
}

#
# Create funtion to quickly get git graph
#
function gitlog {
  git log --oneline --all --graph --decorate -n 30
}

function checkGit($Path = "") {
    if (Test-Path -Path (Join-Path $Path '.git/') ) {
        Write-VcsStatus
        return
    }
    $SplitPath = split-path $path
    if ($SplitPath) {
        checkGit($SplitPath)
    }
}
