@echo off
:: garante suporte a acentos
@chcp 65001 >nul
title Meu Gerenciador
setlocal enabledelayedexpansion
cls

:inicio
cls
echo ==============================================
echo     NAVEGADOR DE PASTAS - MODO TERMINAL
echo ==============================================
echo Diretório atual: %cd%
echo.
echo [1] Listar arquivos e pastas (simples)
echo [2] Ver estrutura em árvore (Tree)
echo [3] Entrar em uma pasta
echo [4] Voltar (CD ..)
echo [5] Sair
echo [6] Verificar Atualizacoes
echo [7] Desinstalar
echo.

set /p opt="Escolha uma opção: "

if "%opt%"=="1" (
	dir /w
	pause
	goto inicio
)

if "%opt%"=="2" (
tree /f | more
pause
goto inicio
)

if "%opt%"=="3" (
	set /p pasta="Digite o nome da pasta para entrar: "
	if exist "!pasta!" (
		cd "!pasta!"
	) else (
		color 0c && echo Pasta n o encontrada!
		timeout /t 2 >nul
	)
	color 0f && goto inicio
)

if "%opt%"=="4" (
	cd ..
	goto inicio
)

if "%opt%"=="5" exit

if %opt%==6 powershell -ExecutionPolicy Bypass -File "%USERPROFILE%\browser-files\update.ps1"
if %opt%==7 powershell -ExecutionPolicy Bypass -File "%USERPROFILE%\browser-files\uninstall.ps1"

echo Opção inválida!
timeout /t 2 >nul
goto inicio