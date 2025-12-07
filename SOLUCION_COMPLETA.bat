@echo off
setlocal enabledelayedexpansion
cls
color 0F
echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║   DIAGNOSTICO Y SOLUCION AUTOMATICA - GIT + DOCKERFILE    ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

cd /d C:\Users\diego\Downloads\eventos_hackaton

echo [1/6] Verificando ubicacion...
echo Carpeta actual: %cd%
echo.

echo [2/6] Verificando repositorio remoto...
echo ────────────────────────────────────────
git remote -v
echo.

echo Esperando 2 segundos...
timeout /t 2 >nul

for /f "tokens=2" %%a in ('git remote -v ^| findstr "fetch"') do set REPO_URL=%%a

echo Repositorio detectado: !REPO_URL!
echo.

if "!REPO_URL!"=="https://github.com/dev-deivis/eventos_hackaton.git" (
    echo [✓] Repositorio CORRECTO
    set REPO_OK=1
) else (
    echo [✗] Repositorio INCORRECTO o NO CONFIGURADO
    echo.
    echo Tu repositorio deberia ser:
    echo https://github.com/dev-deivis/eventos_hackaton.git
    echo.
    echo Pero encontramos:
    echo !REPO_URL!
    echo.
    set /p FIX_REPO="¿Quieres corregir el repositorio? (s/n): "
    
    if /i "!FIX_REPO!"=="s" (
        echo.
        echo Corrigiendo repositorio...
        git remote remove origin
        git remote add origin https://github.com/dev-deivis/eventos_hackaton.git
        echo [✓] Repositorio actualizado
        set REPO_OK=1
    ) else (
        set REPO_OK=0
    )
)

echo.
echo [3/6] Verificando rama actual...
echo ────────────────────────────────────────
git branch
echo.

for /f "tokens=*" %%a in ('git branch --show-current') do set RAMA_ACTUAL=%%a

echo Rama actual: !RAMA_ACTUAL!
echo.

if "!RAMA_ACTUAL!"=="main" (
    echo [✓] Estas en la rama MAIN
    set RAMA_OK=1
) else (
    echo [✗] NO estas en la rama MAIN
    echo.
    set /p FIX_RAMA="¿Quieres cambiar a la rama main? (s/n): "
    
    if /i "!FIX_RAMA!"=="s" (
        echo.
        echo Cambiando a rama main...
        git checkout main
        if errorlevel 1 (
            echo Rama main no existe, creandola...
            git checkout -b main
        )
        echo [✓] Ahora estas en main
        set RAMA_OK=1
    ) else (
        set RAMA_OK=0
    )
)

echo.
echo [4/6] Verificando archivos...
echo ────────────────────────────────────────

if exist "Dockerfile" (
    echo [✓] Dockerfile existe localmente
    set DOCKERFILE_LOCAL=1
) else (
    echo [✗] Dockerfile NO existe localmente
    set DOCKERFILE_LOCAL=0
)

git ls-files | findstr "Dockerfile" >nul
if errorlevel 1 (
    echo [✗] Dockerfile NO esta en Git
    set DOCKERFILE_GIT=0
) else (
    echo [✓] Dockerfile esta en Git
    set DOCKERFILE_GIT=1
)

echo.
echo [5/6] Estado de Git...
echo ────────────────────────────────────────
git status --short
echo.

echo.
echo [6/6] Resumen y Recomendacion...
echo ════════════════════════════════════════════════════════════
echo.

if !REPO_OK!==1 if !RAMA_OK!==1 if !DOCKERFILE_LOCAL!==1 (
    echo [✓] Todo esta bien!
    echo.
    echo SIGUIENTE PASO:
    echo ───────────────
    echo.
    
    if !DOCKERFILE_GIT!==0 (
        echo El Dockerfile existe pero NO esta en Git.
        echo.
        set /p SUBIR="¿Quieres agregarlo y subirlo ahora? (s/n): "
        
        if /i "!SUBIR!"=="s" (
            echo.
            echo Agregando archivos...
            git add Dockerfile render.yaml .dockerignore
            
            echo.
            echo Haciendo commit...
            git commit -m "Agregar Dockerfile y configuracion para Render"
            
            echo.
            echo Subiendo a GitHub...
            git push origin main
            
            echo.
            echo ════════════════════════════════════════════════════════════
            echo [✓✓✓] COMPLETADO!
            echo ════════════════════════════════════════════════════════════
            echo.
            echo AHORA HAZ ESTO:
            echo.
            echo 1. Ve a: https://github.com/dev-deivis/eventos_hackaton
            echo 2. Refresca la pagina (F5)
            echo 3. Debes ver "Dockerfile" en la lista
            echo.
            echo 4. En Render:
            echo    - Ve a tu Web Service
            echo    - Manual Deploy ^> Clear build cache ^& deploy
            echo.
        )
    ) else (
        echo El Dockerfile YA esta en Git.
        echo.
        echo Verifica en GitHub:
        echo https://github.com/dev-deivis/eventos_hackaton
        echo.
        echo Si NO lo ves ahi, puede que necesites hacer push:
        git push origin main
    )
) else (
    echo [✗] Hay problemas que corregir:
    echo.
    if !REPO_OK!==0 echo    - Repositorio incorrecto
    if !RAMA_OK!==0 echo    - Rama incorrecta
    if !DOCKERFILE_LOCAL!==0 echo    - Dockerfile no existe localmente
    echo.
    echo Ejecuta este script de nuevo y acepta las correcciones.
)

echo.
echo ════════════════════════════════════════════════════════════
pause
