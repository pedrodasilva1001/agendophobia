@echo off
title Agendophobia - Enviar Alteracoes para o GitHub
echo ============================================
echo   Agendophobia - Sincronizacao com GitHub
echo ============================================
cd /d "%~dp0"

set "GIT_EXE=%LOCALAPPDATA%\GitHubDesktop\app-3.6.7\resources\app\git\cmd\git.exe"

if not exist "%GIT_EXE%" (
    for /d %%i in ("%LOCALAPPDATA%\GitHubDesktop\app-*") do (
        if exist "%%i\resources\app\git\cmd\git.exe" set "GIT_EXE=%%i\resources\app\git\cmd\git.exe"
    )
)

echo 1. Preparando arquivos modificados...
"%GIT_EXE%" add index.html

echo 2. Registrando atualizacao...
"%GIT_EXE%" commit -m "Agendophobia: Atualizacao do sistema"

echo 3. Enviando para o GitHub Pages...
"%GIT_EXE%" push origin main

echo ============================================
echo   Sucesso! Publicado em:
echo   https://pedrodasilva1001.github.io/agendophobia/
echo ============================================
pause
