# PowerShell Script - Crear y conectar a tu propio repositorio

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "   CREAR TU PROPIO REPOSITORIO" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# Ir a la carpeta del proyecto
Set-Location "C:\Users\diego\Downloads\eventos_hackaton"

Write-Host "PASO 1: Crear repositorio en GitHub" -ForegroundColor Yellow
Write-Host "------------------------------------" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. Ve a: https://github.com/new" -ForegroundColor White
Write-Host "2. Nombre: eventos-hackathon-testing (o el que quieras)" -ForegroundColor White
Write-Host "3. Visibilidad: Public" -ForegroundColor White
Write-Host "4. NO marques nada mas" -ForegroundColor White
Write-Host "5. Clic en 'Create repository'" -ForegroundColor White
Write-Host ""

$continuar = Read-Host "¿Ya creaste el repositorio en GitHub? (s/n)"

if ($continuar -ne "s") {
    Write-Host ""
    Write-Host "Crea el repositorio primero y vuelve a ejecutar este script." -ForegroundColor Red
    Read-Host "Presiona Enter para salir"
    exit
}

Write-Host ""
Write-Host "PASO 2: Ingresar URL del nuevo repositorio" -ForegroundColor Yellow
Write-Host "-------------------------------------------" -ForegroundColor Yellow
Write-Host ""
Write-Host "Ejemplo: https://github.com/DIEG0ROQUE/eventos-hackathon-testing.git" -ForegroundColor Gray
Write-Host ""

$repoUrl = Read-Host "Pega la URL de tu repositorio"

if ([string]::IsNullOrWhiteSpace($repoUrl)) {
    Write-Host ""
    Write-Host "[ERROR] URL vacia. Saliendo..." -ForegroundColor Red
    Read-Host "Presiona Enter para salir"
    exit
}

Write-Host ""
Write-Host "PASO 3: Configurando repositorio local" -ForegroundColor Yellow
Write-Host "---------------------------------------" -ForegroundColor Yellow
Write-Host ""

Write-Host "Repositorios actuales:" -ForegroundColor Cyan
git remote -v

Write-Host ""
Write-Host "Eliminando remote 'origin'..." -ForegroundColor Yellow
git remote remove origin 2>$null

Write-Host ""
Write-Host "Agregando tu nuevo repositorio..." -ForegroundColor Yellow
git remote add origin $repoUrl

Write-Host ""
Write-Host "Verificando:" -ForegroundColor Cyan
git remote -v

Write-Host ""
Write-Host "PASO 4: Verificando rama" -ForegroundColor Yellow
Write-Host "------------------------" -ForegroundColor Yellow
Write-Host ""

$ramaActual = git branch --show-current
Write-Host "Rama actual: $ramaActual" -ForegroundColor Cyan

if ($ramaActual -ne "main") {
    Write-Host "Cambiando a rama main..." -ForegroundColor Yellow
    git checkout main
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Creando rama main..." -ForegroundColor Yellow
        git checkout -b main
    }
}

Write-Host ""
Write-Host "PASO 5: Subiendo proyecto a tu repositorio" -ForegroundColor Yellow
Write-Host "-------------------------------------------" -ForegroundColor Yellow
Write-Host ""

$confirmar = Read-Host "¿Subir TODO el proyecto a tu nuevo repo? (s/n)"

if ($confirmar -eq "s") {
    Write-Host ""
    Write-Host "Subiendo a GitHub (esto puede tardar 1-2 minutos)..." -ForegroundColor Yellow
    git push -u origin main --force
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "============================================" -ForegroundColor Green
        Write-Host "   ¡COMPLETADO!" -ForegroundColor Green
        Write-Host "============================================" -ForegroundColor Green
        Write-Host ""
        Write-Host "Tu proyecto está en:" -ForegroundColor Cyan
        Write-Host $repoUrl.Replace(".git", "") -ForegroundColor White
        Write-Host ""
        Write-Host "VERIFICA QUE ESTOS ARCHIVOS ESTEN:" -ForegroundColor Yellow
        Write-Host "  - Dockerfile" -ForegroundColor White
        Write-Host "  - render.yaml" -ForegroundColor White
        Write-Host "  - composer.json" -ForegroundColor White
        Write-Host "  - Todo el proyecto" -ForegroundColor White
        Write-Host ""
        Write-Host "SIGUIENTE PASO:" -ForegroundColor Cyan
        Write-Host "1. Ve a Render: https://dashboard.render.com" -ForegroundColor White
        Write-Host "2. New > Blueprint" -ForegroundColor White
        Write-Host "3. Conecta tu nuevo repositorio" -ForegroundColor White
        Write-Host "4. Apply" -ForegroundColor White
        Write-Host ""
    } else {
        Write-Host ""
        Write-Host "[ERROR] No se pudo hacer push" -ForegroundColor Red
        Write-Host "Verifica la URL del repositorio y que tengas permisos" -ForegroundColor Red
    }
} else {
    Write-Host ""
    Write-Host "Operación cancelada." -ForegroundColor Yellow
}

Write-Host ""
Read-Host "Presiona Enter para cerrar"
