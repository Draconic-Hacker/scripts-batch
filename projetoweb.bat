@echo off
cd /d "%USERPROFILE%\Desktop\projeto_ciig_systems"

:: 1. Mediaplayer (O mais demorado)
echo Iniciando Playlist...
start "" "C:\Users\BEBETY\Music\Playlists\work day.m3u8"
timeout /t 35 /nobreak

:: 4. CMD 1 - Terminal Geral
start "TERMINAL GERAL" cmd /k "@echo off && cd /d "%USERPROFILE%\Desktop\projeto_ciig_systems" & echo Abrindo Terminal Backend & timeout /t 3 >nul & echo Abrindo Terminal Frontend & timeout /t 2 >nul & cls & echo Bem-Vindo de volta"
timeout /t 3 /nobreak

:: 5. CMD 2 - Terminal Backend
start "Backend Server" cmd /k "@echo off && cd backend && echo Iniciando o Backend && node index.js"
timeout /t 5 /nobreak

:: 6. CMD 2 - Terminal Frontend
start "Frontend Server" cmd /k "@echo off && cd frontend && echo Iniciando o Frontend && npm run dev"
timeout /t 6 /nobreak

:: 3. MySQL Workbench
start "MySQL OPEN" cmd /k "@echo off && echo Abrindo Banco de Dados... && start "" "C:\Program Files\MySQL\MySQL Workbench 8.0 CE\mysqlworkbench.exe""
timeout /t 15 /nobreak
timeout /t 10 >nul
taskkill /FI "WINDOWTITLE eq MySQL OPEN*" /IM cmd.exe /T /F

:: 3. VsCode
start "vscode" code
timeout /t 10 >nul
taskkill /FI "WINDOWTITLE eq vscode*" /IM cmd.exe /T /F