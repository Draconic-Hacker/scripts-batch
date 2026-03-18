echo off
cd /d "%USERPROFILE%\Desktop\projeto_ciig_systems"

:: 4. CMD 1 - Terminal Geral
start "TERMINAL GERAL" cmd /k "@echo off && cd /d "%USERPROFILE%\Desktop\projeto_ciig_systems" & echo Abrindo Terminal Backend & timeout /t 3 >nul & echo Abrindo Terminal Frontend & timeout /t 2 >nul & cls & echo Bem-Vindo de volta"
timeout /t 3 /nobreak

:: 5. CMD 2 - Terminal Backend
start "Backend Server" cmd /k "@echo off && cd backend && echo Iniciando o Backend && node index.js"
timeout /t 5 /nobreak

:: 6. CMD 2 - Terminal Frontend
start "Frontend Server" cmd /k "@echo off && cd frontend && echo Iniciando o Frontend && npm run dev"
timeout /t 10 /nobreak

start "vscode" code
timeout /t 10 >nul
taskkill /FI "WINDOWTITLE eq vscode*" /IM cmd.exe /T /F
timeout /t 15 /nobreak

:: 7. Chrome
start "CHROME OPEN" cmd /k "@echo off && echo Abrindo Chrome... && start chrome https://github.com/Draconic-Hacker/projeto_ciig_systems && timeout /t 6 >nul && start chrome https://minicursogit.github.io/#/ && timeout /t 3 >nul && start chrome http://localhost:5173/ && timeout /t 5 >nul && exit"
