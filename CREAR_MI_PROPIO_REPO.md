# 🚀 CREAR TU PROPIO REPOSITORIO EN GITHUB

## PASO 1: Crear Repositorio Nuevo en GitHub

1. **Ve a:** https://github.com/new
2. **Completa:**
   - Repository name: `eventos-hackathon-testing` (o el nombre que quieras)
   - Description: "Sistema de eventos hackathon - Prueba deployment"
   - Visibility: **Public** (para que Render funcione gratis)
   - ❌ **NO marques** "Add a README file"
   - ❌ **NO marques** ".gitignore"
   - ❌ **NO marques** "Choose a license"
3. **Clic en:** "Create repository"

**Copia la URL que te da**, ejemplo:
```
https://github.com/DIEG0ROQUE/eventos-hackathon-testing.git
```

---

## PASO 2: Ejecutar Script Automático

Guarda esta URL y ejecuta:

```powershell
.\crear_mi_repo.ps1
```

O sigue los pasos manuales abajo ↓

---

## PASO 3: Conectar tu Proyecto Local al Nuevo Repo

```powershell
# 1. Ir a tu proyecto
cd C:\Users\diego\Downloads\eventos_hackaton

# 2. Ver repositorios actuales
git remote -v

# 3. Eliminar todos los remotos
git remote remove origin

# 4. Agregar TU NUEVO repositorio
# REEMPLAZA con la URL que copiaste:
git remote add origin https://github.com/DIEG0ROQUE/eventos-hackathon-testing.git

# 5. Verificar
git remote -v

# 6. Ver rama actual
git branch

# 7. Asegurarte de estar en main
git checkout main

# 8. Subir TODO a tu nuevo repo
git push -u origin main --force
```

El `--force` sobrescribe todo en el repo nuevo (está vacío, así que no hay problema).

---

## PASO 4: Verificar en GitHub

Ve a tu nuevo repositorio:
```
https://github.com/DIEG0ROQUE/eventos-hackathon-testing
```

Deberías ver TODOS los archivos, incluyendo:
- ✅ Dockerfile
- ✅ render.yaml
- ✅ composer.json
- ✅ package.json
- ✅ Todo el proyecto

---

## PASO 5: Configurar Render con TU Repo

1. **Ve a Render:** https://dashboard.render.com
2. **Si ya tienes un Web Service:**
   - Settings → Repository
   - Disconnect
   - Connect new repository
   - Selecciona: `DIEG0ROQUE/eventos-hackathon-testing`

3. **O crea uno nuevo:**
   - New → Blueprint
   - Connect: `DIEG0ROQUE/eventos-hackathon-testing`
   - Apply

---

## ✅ VENTAJAS DE TENER TU PROPIO REPO:

- ✅ No dependes de tu amigo
- ✅ No hay reglas de protección molestas
- ✅ Puedes hacer push cuando quieras
- ✅ Puedes probar sin afectar el proyecto principal
- ✅ Una vez que funcione, puedes hacer PR al repo principal

---

## 📝 RESUMEN DE COMANDOS:

```powershell
cd C:\Users\diego\Downloads\eventos_hackaton
git remote remove origin
git remote add origin https://github.com/DIEG0ROQUE/eventos-hackathon-testing.git
git checkout main
git push -u origin main --force
```

---

¿Listo para crear tu repo? ¡Vamos! 🚀
