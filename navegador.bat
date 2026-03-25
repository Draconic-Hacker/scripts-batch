:: esconde o scopo dos comandos
@echo off

:: garante suporte a acentos
@chcp 65001 >nul

:: altera o título da janela
title Meu Gerenciador

setlocal enabledelayedexpansion
cls

:inicio
color 0f
cls
echo ==============================================
echo     NAVEGADOR DE PASTAS - MODO TERMINAL
echo ==============================================
echo Diretorio atual: %cd%
echo.
echo [1] Listar arquivos e pastas (simples)
echo [2] Ver estrutura em arvore (Tree)
echo [3] Entrar em uma pasta
echo [4] Voltar (CD ..)
echo [5] Sair
echo [6] Verificar Atualizacoes
echo [7] Desinstalar
echo.

set /p opt="Escolha uma opcao: "

if "%opt%"=="1" (
	echo.
	echo.
	dir /w
	echo.
	pause
	goto inicio
)

if "%opt%"=="2" (
	echo.
	tree /f | more
	echo.
	pause
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

if "%opt%"=="5" (
	exit
)

:: cd /d %TEMP%
:: start powershell -ExecutionPolicy Bypass -Command "update"
:: exit

if %opt%==6 (
	color 0e
	echo.
	echo Funcionalidade ainda em desenvolvimento
	echo.
	timeout /t 3 >nul
	goto inicio
)

if "%opt%"=="7" (
    cd /d %TEMP%
    start powershell -ExecutionPolicy Bypass -Command "uninstall"
    exit
)


echo Opção inválida!
timeout /t 2 >nul
goto inicio
