@echo off
echo ================================
echo  COMPILANDO ASSETS PARA DEPLOY
echo ================================
echo.

cd /d "%~dp0"

echo [1/4] Verificando Node.js...
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Node.js no esta instalado
    pause
    exit /b 1
)

echo [2/4] Instalando dependencias npm...
call npm install
if %errorlevel% neq 0 (
    echo ERROR: npm install fallo
    pause
    exit /b 1
)

echo [3/4] Compilando assets (npm run build)...
call npm run build
if %errorlevel% neq 0 (
    echo ERROR: npm run build fallo
    pause
    exit /b 1
)

echo [4/4] Verificando archivos generados...
if not exist "public\build\manifest.json" (
    echo ERROR: No se genero public\build\manifest.json
    pause
    exit /b 1
)

echo.
echo ================================
echo  COMPILACION EXITOSA!
echo ================================
echo.
echo Archivos generados en: public\build\
dir public\build
echo.
echo SIGUIENTE PASO:
echo 1. git add .
echo 2. git commit -m "Assets compilados para deploy"
echo 3. git push origin main
echo 4. Render: Manual Deploy
echo.
pause
