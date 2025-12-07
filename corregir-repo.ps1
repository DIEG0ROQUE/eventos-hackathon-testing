# PowerShell Script - Corregir repositorio Git
# Ejecutar en PowerShell como administrador

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "   CORRIGIENDO REPOSITORIO GIT" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# Ir a la carpeta del proyecto
Set-Location "C:\Users\diego\Downloads\eventos_hackaton"

Write-Host "[1/5] Repositorios actuales:" -ForegroundColor Yellow
git remote -v
Write-Host ""

Write-Host "[2/5] Cambiando 'origin' a TU repositorio..." -ForegroundColor Yellow
# Eliminar el origin actual (repo de DIEG0ROQUE)
git remote remove origin

# Agregar TU repo como origin
git remote add origin https://github.com/dev-deivis/eventos_hackaton.git

# Eliminar 'partner' ya que ahora origin es el correcto
git remote remove partner

Write-Host "[OK] Repositorio actualizado!" -ForegroundColor Green
Write-Host ""

Write-Host "[3/5] Verificando repositorio:" -ForegroundColor Yellow
git remote -v
Write-Host ""

Write-Host "[4/5] Verificando rama actual:" -ForegroundColor Yellow
git branch
Write-Host ""

# Asegurarse de estar en main
$ramaActual = git branch --show-current
if ($ramaActual -ne "main") {
    Write-Host "Cambiando a rama main..." -ForegroundColor Yellow
    git checkout main
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Creando rama main..." -ForegroundColor Yellow
        git checkout -b main
    }
}

Write-Host "[5/5] Agregando y subiendo Dockerfile..." -ForegroundColor Yellow
git add Dockerfile
git add render.yaml
git add .dockerignore

Write-Host ""
Write-Host "Estado de Git:" -ForegroundColor Yellow
git status
Write-Host ""

$continuar = Read-Host "¿Hacer commit y push? (s/n)"

if ($continuar -eq "s") {
    git commit -m "Agregar Dockerfile y configuracion para Render"
    
    Write-Host ""
    Write-Host "Subiendo a TU repositorio (dev-deivis)..." -ForegroundColor Yellow
    git push -u origin main
    
    Write-Host ""
    Write-Host "============================================" -ForegroundColor Green
    Write-Host "   COMPLETADO!" -ForegroundColor Green
    Write-Host "============================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "VERIFICA EN GITHUB:" -ForegroundColor Cyan
    Write-Host "https://github.com/dev-deivis/eventos_hackaton" -ForegroundColor White
    Write-Host ""
    Write-Host "Debe aparecer 'Dockerfile' en la lista de archivos" -ForegroundColor White
    Write-Host ""
}

Write-Host ""
Read-Host "Presiona Enter para cerrar"
