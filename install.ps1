# Define o local de instalação (Ex: C:\Users\SeuUsuario\browser-files)
$installDir = Join-Path $HOME "browser-files"
$batFile = Join-Path $installDir "browser-files.bat"
$url = "https://raw.githubusercontent.com/Draconic-Hacker/scripts-batch/refs/heads/master/browser-files.bat"

# 1. Cria a pasta se não existir
if (!(Test-Path $installDir)) {
    New-Item -ItemType Directory -Path $installDir -Force | Out-Null
}

# 2. Baixa o arquivo .bat do GitHub
Write-Host "Baixando browser-files.bat..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $url -OutFile $batFile

# 3. Adiciona ao PATH do Usuário (se já não estiver lá)
$oldPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($oldPath -notlike "*$installDir*") {
    Write-Host "Configurando variaveis de ambiente..." -ForegroundColor Yellow
    [Environment]::SetEnvironmentVariable("Path", "$oldPath;$installDir", "User")
    Write-Host "Instalacao concluida! Reinicie o terminal ou o Executar (Win+R)." -ForegroundColor Green
} else {
    Write-Host "browser-files já está configurado no seu PATH!" -ForegroundColor Green
}
