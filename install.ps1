# Define o local de instalação (Ex: C:\Users\SeuUsuario\browser-files)
$installDir = Join-Path $HOME "browser-files"

$batFile = Join-Path $installDir "navegador.bat"
$updateFile = Join-Path $installDir "update.ps1"
$uninstallFile = Join-Path $installDir "uninstall.ps1"


$urlMain = "https://raw.githubusercontent.com/Draconic-Hacker/scripts-batch/refs/heads/master/navegador.bat"
$urlUpdate = "https://raw.githubusercontent.com/Draconic-Hacker/scripts-batch/refs/heads/master/update.ps1"
$urlUninstall = "https://raw.githubusercontent.com/Draconic-Hacker/scripts-batch/refs/heads/master/uninstall.ps1"

# 1. Cria a pasta se não existir
if (!(Test-Path $installDir)) {
    New-Item -ItemType Directory -Path $installDir -Force | Out-Null
}

# 2. Baixa o arquivo .bat do GitHub
Write-Host "Baixando os arquivos do browser-files..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $urlMain -OutFile $batFile
Invoke-WebRequest -Uri $urlUpdate -OutFile $updateFile
Invoke-WebRequest -Uri $urlUninstall -OutFile $uninstallFile

3. Adiciona ao PATH do Usuário (se já não estiver lá)
$oldPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($oldPath -notlike "*$installDir*") {
    Write-Host "Configurando variaveis de ambiente..." -ForegroundColor Yellow
    [Environment]::SetEnvironmentVariable("Path", "$oldPath;$installDir", "User")
    Write-Host "Instalacao concluida!" -ForegroundColor Green
    Write-Host "Comandos disponiveis: navegador, uninstall" -ForegroundColor Green
    Write-Host " "
    Write-Host "Voce pode utilizar os comandos atraves de uma instacia do CMD" -ForegroundColor cyan
    Write-Host "ou pressionando as teclas Windos + R e digitar: navegador e apertar em ok" -ForegroundColor cyan
    Write-Host " "
    Write-Host "pressione Enter para inicalizar o script: Navegador" -foreground green ; read-host | out-null
    navegador
} else {
    Write-Host "browser-files já está configurado no seu PATH!" -ForegroundColor Green
    Write-Host " "
    write-host "pressione Enter para fechar" ; read-host | out-null
    exit
}
