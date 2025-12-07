@echo off
cls
color 0A
echo ============================================
echo    SUBIR DOCKERFILE A GITHUB
echo ============================================
echo.
echo Verificando archivos...
echo.

if exist "Dockerfile" (
    echo [OK] Dockerfile encontrado
) else (
    echo [ERROR] No se encuentra Dockerfile
    pause
    exit
)

if exist "render.yaml" (
    echo [OK] render.yaml encontrado
) else (
    echo [ERROR] No se encuentra render.yaml
    pause
    exit
)

echo.
echo Agregando archivos a Git...
git add Dockerfile
git add render.yaml
git add .dockerignore

echo.
echo Haciendo commit...
git commit -m "Agregar Dockerfile y configuracion para Render"

echo.
echo Subiendo a GitHub...
git push origin main

echo.
echo ============================================
echo    ARCHIVOS SUBIDOS!
echo ============================================
echo.
echo Ahora en Render:
echo 1. Ve a tu Web Service
echo 2. Clic en "Manual Deploy"
echo 3. Clic en "Deploy latest commit"
echo.
echo O simplemente espera, Render detectara
echo los cambios automaticamente.
echo.
pause
