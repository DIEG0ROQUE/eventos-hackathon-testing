@echo off
cls
color 0B
echo ============================================
echo    DIAGNOSTICO DE GIT
echo ============================================
echo.

cd /d C:\Users\diego\Downloads\eventos_hackaton

echo [INFO] Ubicacion actual:
cd
echo.

echo ============================================
echo [1] REPOSITORIO REMOTO
echo ============================================
git remote -v
echo.

echo ============================================
echo [2] RAMA ACTUAL
echo ============================================
git branch
echo.
git status
echo.

echo ============================================
echo [3] ULTIMOS COMMITS
echo ============================================
git log --oneline -5
echo.

echo ============================================
echo [4] ARCHIVOS NO RASTREADOS
echo ============================================
git status --short
echo.

echo ============================================
echo [5] ARCHIVOS EN EL REPOSITORIO
echo ============================================
git ls-files | findstr /I "Dockerfile render.yaml"
echo.

echo ============================================
echo    RESUMEN
echo ============================================
echo.
echo Si ves "origin" apuntando a:
echo   - dev-deivis/eventos_hackaton = TU REPO (correcto)
echo   - otro-usuario/eventos_hackaton = REPO DE TU AMIGO (incorrecto)
echo.
echo Rama actual deberia ser: main o master
echo.
pause
