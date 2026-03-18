@chcp 65001 >nul
echo off
:menu
cls
echo 1. option 1
echo 2. option 2
echo 3. sair
choice /c 123 >nul /m "select one option: "
if %errorlevel%==1 goto opcao1
if %errorlevel%==2 goto opcao2
if %errorlevel%==3 goto sair

:opcao1
echo [SIMULACAO] O PC entraria em modo de SUSPENSÃO. & pause >nul & goto menu

:opcao2
echo two
goto menu

:sair
echo exit