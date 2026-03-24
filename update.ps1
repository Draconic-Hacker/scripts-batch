# update.ps1
$installDir = Join-Path $HOME "browser-files"
$batFile = Join-Path $installDir "navegador.bat"
$url = "https://raw.githubusercontent.com/Draconic-Hacker/scripts-batch/refs/heads/master/navegador.bat"

Write-Host "Verificando atualizações para browser-files..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $url -OutFile $batFile -ErrorAction Stop
Write-Host "Atualizado com sucesso!" -ForegroundColor Green ; timeout /t 2 >null ; pause ; browser-files
