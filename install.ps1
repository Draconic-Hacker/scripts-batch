# Define o local de instalação (Ex: C:\Users\SeuUsuario\browser-files)
$installDir = Join-Path $HOME "browser-files"

$batFile = Join-Path $installDir "navegador.bat"
# $updateFile = Join-Path $installDir "update.ps1"
$uninstallFile = Join-Path $installDir "uninstall.ps1"


$urlMain = "https://raw.githubusercontent.com/Draconic-Hacker/scripts-batch/refs/heads/master/navegador.bat"
# $urlUpdate = "https://raw.githubusercontent.com/Draconic-Hacker/scripts-batch/refs/heads/master/update.ps1"
$urlUninstall = "https://raw.githubusercontent.com/Draconic-Hacker/scripts-batch/refs/heads/master/uninstall.ps1"

# 1. Cria a pasta se não existir
if (!(Test-Path $installDir)) {
    New-Item -ItemType Directory -Path $installDir -Force | Out-Null
}

# 2. Baixa os arquivos com a codificação correta para o CMD
Write-Host "Baixando os arquivos do browser-files..." -ForegroundColor Cyan

# Baixa o conteúdo e salva em ASCII para evitar o erro de 'comando não reconhecido'
$navegadorContent = Invoke-WebRequest -Uri $urlMain -UseBasicParsing
[System.IO.File]::WriteAllText($batFile, $navegadorContent.Content, [System.Text.Encoding]::ASCII)

# Os scripts .ps1 podem ser baixados normalmente
# Invoke-WebRequest -Uri $urlUpdate -OutFile $updateFile
Invoke-WebRequest -Uri $urlUninstall -OutFile $uninstallFile

# 3. Adiciona ao PATH do Usuário (se já não estiver lá)
$oldPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($oldPath -notlike "*$installDir*") {
    Write-Host "Configurando variaveis de ambiente..." -ForegroundColor Yellow
    [Environment]::SetEnvironmentVariable("Path", "$oldPath;$installDir", "User")
}

Write-Host "`nInstalacao concluida!" -ForegroundColor Green
Write-Host "Comandos disponiveis: navegador, uninstall" -ForegroundColor Green
Write-Host "`nVoce pode utilizar os comandos atraves do CMD ou Win + R" -ForegroundColor Cyan

Write-Host "`nPressione Enter para inicializar o Navegador..." -ForegroundColor Green
Read-Host | Out-Null

# Chama o script pelo caminho completo, pois o PATH novo ainda não carregou nesta sessão
# & $batFile
Start-Process cmd -ArgumentList "/k cd $env:USERPROFILE\browser-files & navegador.bat"
exit
