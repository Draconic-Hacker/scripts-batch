# update.ps1
$installDir = Join-Path $HOME "browser-files"
$batFile = Join-Path $installDir "browser-files.bat"
$url = "https://raw.githubusercontent.com/Draconic-Hacker/scripts-batch/refs/heads/master/browser-files.bat"

Write-Host "Verificando atualizações para browser-files..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $url -OutFile $batFile -ErrorAction Stop
Write-Host "Atualizado com sucesso!" -ForegroundColor Green ; timeout /t 2 >null ; pause ; browser-files
