@echo off
cls
color 0E
echo ============================================
echo    SOLUCION: CONFIGURAR REPOSITORIO CORRECTO
echo ============================================
echo.

cd /d C:\Users\diego\Downloads\eventos_hackaton

echo PASO 1: Ver repositorio actual
echo ================================
git remote -v
echo.

echo Tu repositorio deberia ser:
echo https://github.com/dev-deivis/eventos_hackaton
echo.

set /p CORRECTO="Es este tu repositorio? (s/n): "

if /i "%CORRECTO%"=="n" (
    echo.
    echo Vamos a cambiar al repositorio correcto...
    echo.
    
    echo Removiendo repositorio actual...
    git remote remove origin
    
    echo Agregando tu repositorio...
    git remote add origin https://github.com/dev-deivis/eventos_hackaton.git
    
    echo.
    echo [OK] Repositorio actualizado!
    git remote -v
)

echo.
echo PASO 2: Verificar rama
echo ================================
git branch
echo.

echo Deberia estar en: main o master
set /p RAMA_ACTUAL="En que rama estas? (main/master/otra): "

if /i not "%RAMA_ACTUAL%"=="main" (
    echo.
    echo Cambiando a rama main...
    git checkout main
    
    if errorlevel 1 (
        echo No existe rama main, creandola...
        git checkout -b main
    )
)

echo.
echo PASO 3: Agregar y subir archivos
echo ================================

echo Agregando archivos...
git add Dockerfile
git add render.yaml
git add .dockerignore

echo.
echo Estado:
git status

echo.
set /p CONTINUAR="Continuar con commit y push? (s/n): "

if /i "%CONTINUAR%"=="s" (
    git commit -m "Agregar Dockerfile y configuracion Render"
    
    echo.
    echo Subiendo a GitHub...
    git push -u origin main
    
    if errorlevel 1 (
        echo.
        echo [ERROR] No se pudo hacer push
        echo.
        echo Intenta con force push? (CUIDADO: sobreescribe el remoto)
        set /p FORCE="Force push? (s/n): "
        
        if /i "!FORCE!"=="s" (
            git push -u origin main --force
        )
    )
    
    echo.
    echo [OK] Archivos subidos!
    echo.
    echo Verifica en: https://github.com/dev-deivis/eventos_hackaton
)

echo.
pause
