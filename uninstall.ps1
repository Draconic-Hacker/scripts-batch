# uninstall.ps1
$installDir = Join-Path $HOME "browser-files"

# 1. Remove do PATH do Usuário
$oldPath = [Environment]::GetEnvironmentVariable("Path", "User")
$newPath = ($oldPath -split ';' | Where-Object { $_ -ne $installDir }) -join ';'
[Environment]::SetEnvironmentVariable("Path", $newPath, "User")

# 2. Remove a pasta física
if (Test-Path $installDir) {
    Remove-Item -Path $installDir -Recurse -Force
}

Write-Host "browser-files foi removido com sucesso." -ForegroundColor Yellow ; pause ; exit
