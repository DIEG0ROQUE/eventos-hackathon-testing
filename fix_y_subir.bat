@echo off
cls
color 0E
echo ============================================
echo    SOLUCION RAPIDA: SUBIR A GITHUB
echo ============================================
echo.

REM Verificar archivos
echo [1/4] Verificando archivos necesarios...
echo.

set FALTA=0

if exist "Dockerfile" (
    echo [OK] Dockerfile
) else (
    echo [FALTA] Dockerfile
    set FALTA=1
)

if exist "render.yaml" (
    echo [OK] render.yaml
) else (
    echo [FALTA] render.yaml
    set FALTA=1
)

if %FALTA%==1 (
    echo.
    echo [ERROR] Faltan archivos necesarios!
    echo.
    echo Por favor verifica que estos archivos existan.
    pause
    exit /b
)

echo.
echo [2/4] Verificando estado de Git...
git status

echo.
echo [3/4] Agregando archivos a Git...
git add Dockerfile
git add render.yaml
git add .dockerignore
git add .env.example
git status

echo.
echo [4/4] Haciendo commit y push...
git commit -m "Fix: Agregar Dockerfile y configuracion para Render"
git push origin main

echo.
echo ============================================
echo    COMPLETADO!
echo ============================================
echo.
echo Archivos subidos a GitHub:
echo [OK] Dockerfile
echo [OK] render.yaml  
echo [OK] .dockerignore
echo.
echo SIGUIENTE PASO EN RENDER:
echo.
echo Render redesplegara automaticamente en 1-2 minutos.
echo.
echo O puedes forzar un redeploy:
echo 1. Ve a tu Web Service en Render
echo 2. Clic en "Manual Deploy"
echo 3. Clic en "Deploy latest commit"
echo.
echo MONITOREA LOS LOGS:
echo - Ve a la pestana "Logs" en Render
echo - Deberia empezar a construir el Docker image
echo.
pause
