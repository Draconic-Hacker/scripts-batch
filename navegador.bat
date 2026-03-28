:: esconde o scopo dos comandos
@echo off

:: garante suporte a acentos
@chcp 65001 >nul

set "current_version=1.0 instable"

:: Busca a versão remota do GitHub
for /f "delims=" %%a in ('curl -s https://raw.githubusercontent.com/Draconic-Hacker/scripts-batch/refs/heads/master/version.txt') do set "latest_version=%%a"

:: altera o título da janela
title Meu Gerenciador

:: mira o cmd para a pasta padrão do sistema
cd %userprofile%

setlocal enabledelayedexpansion
cls

:inicio
color 0f
cls
echo ==============================================
echo     NAVEGADOR DE PASTAS - MODO TERMINAL
echo ==============================================
echo.
echo Versao Atual: %current_version%
echo.
echo Diretorio atual: %cd%
echo.
echo ----------------------------------------------
:: Verifica se a versão do GitHub é diferente da atual
if "%latest_version%" NEQ "%current_version%" (
    echo.
    echo [!] NOVA VERSAO DISPONIVEL: %latest_version%
    echo [!] Use a opção [6] para atualizar agora.
    echo ==============================================
)
echo.
echo [1] Listar arquivos      [5] Fechar o script
echo [2] Ver arvore (Tree)    [6] ATUALIZAR SCRIPT
echo [3] Entrar em pasta      [7] Desinstalar
echo [4] Voltar (CD ..)
echo.
echo ----------------------------------------------

set /p opt="Escolha uma opcao: "

if "%opt%"=="1" (
	echo.
	cls
	dir /w
	echo.
	echo pressione qualquer tecla para voltar ao menu
	pause >nul
	goto inicio
)

if "%opt%"=="2" (
	echo.
	cls
	tree /f /a
	echo.
	echo pressione qualquer tecla para voltar ao menu
	pause >nul
	goto inicio
)

if "%opt%"=="3" (
	echo.
	set /p pasta="Digite o nome da pasta para entrar: "
	if exist "!pasta!" (
		cd "!pasta!"
	) else (
		color 0c & echo Pasta nao encontrada!
		timeout /t 2 >nul
	)
	goto inicio
)

if "%opt%"=="4" (
	cd ..
	goto inicio
)

if "%opt%"=="5" exit

if "%opt%"=="6" (
    cls
    echo [!] Iniciando atualizacao...
	timeout /t 3
    :: Chama o PowerShell de atualização que você já tem
    start powershell -ExecutionPolicy Bypass -File "update"
)

if "%opt%"=="7" (
	echo [!] Iniciando a desinstalacao...
	timeout /t 3
    start powershell -ExecutionPolicy Bypass -Command "uninstall"
)


echo Opção inválida!
timeout /t 2 >nul
goto inicio
