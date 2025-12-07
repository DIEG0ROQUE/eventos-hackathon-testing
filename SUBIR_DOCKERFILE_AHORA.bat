@echo off
cls
color 0C
echo ============================================
echo    SUBIR DOCKERFILE A GITHUB - AHORA SI
echo ============================================
echo.

cd /d C:\Users\diego\Downloads\eventos_hackaton

echo [PASO 1] Verificando que Dockerfile existe localmente...
if exist "Dockerfile" (
    echo [OK] Dockerfile encontrado
    type Dockerfile | findstr "FROM php" >nul
    if errorlevel 1 (
        echo [ERROR] Dockerfile parece estar vacio o corrupto
        pause
        exit /b
    )
    echo [OK] Dockerfile tiene contenido valido
) else (
    echo [ERROR] Dockerfile NO existe!
    echo.
    echo El archivo deberia estar en:
    echo C:\Users\diego\Downloads\eventos_hackaton\Dockerfile
    echo.
    pause
    exit /b
)

echo.
echo [PASO 2] Estado actual de Git...
git status

echo.
echo [PASO 3] Agregando Dockerfile a Git...
git add Dockerfile
git add render.yaml
git add .dockerignore

echo.
echo [PASO 4] Verificando que se agregaron...
git status

echo.
echo [PASO 5] Haciendo commit...
git commit -m "Agregar Dockerfile, render.yaml y .dockerignore para Render"

echo.
echo [PASO 6] Subiendo a GitHub...
git push origin main

echo.
echo [PASO 7] Verificando el commit mas reciente...
git log --oneline -1

echo.
echo ============================================
echo    COMPLETADO!
echo ============================================
echo.
echo VERIFICA EN GITHUB:
echo 1. Ve a: https://github.com/dev-deivis/eventos_hackaton
echo 2. Deberia aparecer "Dockerfile" en la lista de archivos
echo 3. Haz clic en "Commits" para ver el ultimo commit
echo.
echo LUEGO EN RENDER:
echo 1. Ve a tu Web Service
echo 2. Clic en "Manual Deploy"
echo 3. Clic en "Clear build cache & deploy"
echo.
pause
