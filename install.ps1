# Caminho em AppData (C:\Users\Usuario\AppData\Roaming\browser-files)
$installDir = Join-Path $env:APPDATA "browser-files"

$batFile = Join-Path $installDir "navegador.bat"
$dllFile = Join-Path $installDir "Microsoft.Web.WebView2.WinForms.dll"
$guiFile = Join-Path $installDir "testingGui.ps1"
$updateFile = Join-Path $installDir "update.ps1"
$uninstallFile = Join-Path $installDir "uninstall.ps1"


$urlMain = "https://raw.githubusercontent.com/Draconic-Hacker/scripts-batch/refs/heads/master/navegador.bat"
$urlGui = "https://raw.githubusercontent.com/Draconic-Hacker/scripts-batch/refs/heads/master/testingGui.ps1"
$urlDll = "https://raw.githubusercontent.com"
$urlUpdate = "https://raw.githubusercontent.com/Draconic-Hacker/scripts-batch/refs/heads/master/update.ps1"
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
Invoke-WebRequest -Uri $urlDll -OutFile $dllFile
Invoke-WebRequest -Uri $urlGui -OutFile $guiFile
Invoke-WebRequest -Uri $urlUninstall -OutFile $uninstallFile
Invoke-WebRequest -Uri $urlUpdate -OutFile $updateFile

# 3. Adiciona ao PATH do Usuário (se já não estiver lá)
$oldPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($oldPath -notlike "*$installDir*") {
    Write-Host "Configurando variaveis de ambiente..." -ForegroundColor Yellow
    [Environment]::SetEnvironmentVariable("Path", "$oldPath;$installDir", "User")
}

Write-Host "`nInstalacao concluida!" -ForegroundColor Green
Write-Host "Comandos disponiveis: navegador, uninstall" -ForegroundColor Green
Write-Host "`nVoce pode utilizar os comandos atraves do CMD ou Win + R" -ForegroundColor Cyan

Write-Host "`nPressione Enter para fechar o terminal..." -ForegroundColor Green
Read-Host | Out-Null
exit

# Chama o script pelo caminho completo, pois o PATH novo ainda não carregou nesta sessão
# & $batFile
# Start-Process cmd -ArgumentList "/k cd $env:USERPROFILE\browser-files & navegador.bat"
# exit