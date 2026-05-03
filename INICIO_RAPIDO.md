# 🚀 Inicio Rápido - CRUD Productos

## ⚡ 5 Pasos para Ejecutar

### 1️⃣ Base de Datos (5 minutos)

Abre **phpMyAdmin** y ejecuta estos 3 scripts en orden:

```sql
-- Paso 1: Base de datos y tablas
Negocios_MySQL.sql

-- Paso 2: Stored procedures básicos
StoredProcedures.sql

-- Paso 3: Stored procedures CRUD
StoredProcedures_CRUD_Productos.sql
```

✅ **Verificar**: En phpMyAdmin → Negocios → Rutinas → Deberías ver 8 stored procedures

---

### 2️⃣ Configuración (1 minuto)

Edita `Lab7-IA/appsettings.json`:

```json
{
  "ConnectionStrings": {
    "NegociosDB": "Server=localhost;Database=Negocios;User=root;Password=TU_PASSWORD;Port=3306;"
  }
}
```

⚠️ **Importante**: Cambia `TU_PASSWORD` por tu contraseña de MySQL (o déjalo vacío si no tienes)

---

### 3️⃣ Instalar Dependencias (2 minutos)

Abre terminal en la carpeta `Lab7-IA`:

```bash
cd Lab7-IA
dotnet restore
```

✅ **Verificar**: Debe descargar `MySql.Data` versión 9.1.0

---

### 4️⃣ Ejecutar (1 minuto)

```bash
dotnet run
```

O desde Visual Studio: **F5** o **Ctrl+F5**

✅ **Verificar**: Debe mostrar algo como:
```
Now listening on: https://localhost:5001
Now listening on: http://localhost:5000
```

---

### 5️⃣ Usar (¡Ya está!)

Abre tu navegador en:
- **HTTPS**: https://localhost:5001
- **HTTP**: http://localhost:5000

Clic en **"Productos"** en el menú superior

---

## 🎯 Funcionalidades Disponibles

### 📋 Listar Productos
- Ver todos los productos en tabla
- Información completa con badges de colores

### 🔍 Buscar Productos
- Por nombre (campo de texto)
- Por categoría (dropdown)
- Combinado (nombre + categoría)
- Botón "Limpiar" para resetear

### ➕ Crear Producto
- Formulario con validación
- Dropdowns de categoría y proveedor
- Mensajes de éxito/error

### ✏️ Editar Producto
- Formulario pre-cargado
- Validación de datos
- Confirmación de actualización

### 🗑️ Eliminar Producto
- Vista de confirmación
- Advertencia clara
- Mensaje de éxito

### 👁️ Ver Detalles
- Información completa
- Cálculo de valor total
- Estado del inventario

---

## 🧪 Prueba Rápida

### Crear un Producto de Prueba

1. Clic en **"Nuevo Producto"**
2. Llenar:
   - **Nombre**: Laptop HP
   - **Categoría**: Cualquiera
   - **Proveedor**: Cualquiera
   - **Unidad**: 1 unidad
   - **Precio**: 15000
   - **Stock**: 10
3. Clic en **"Guardar Producto"**
4. ✅ Debe aparecer en la lista con mensaje de éxito

### Buscar el Producto

1. En el campo "Buscar por nombre" escribe: **Laptop**
2. Clic en **"Buscar"**
3. ✅ Debe mostrar solo el producto "Laptop HP"

### Editar el Producto

1. Clic en el ícono de **lápiz** (✏️)
2. Cambiar precio a: **12000**
3. Clic en **"Actualizar Producto"**
4. ✅ Debe mostrar el nuevo precio

### Ver Detalles

1. Clic en el ícono de **ojo** (👁️)
2. ✅ Debe mostrar toda la información incluyendo valor total

### Eliminar el Producto

1. Clic en el ícono de **basura** (🗑️)
2. Revisar la información
3. Clic en **"Confirmar Eliminación"**
4. ✅ Debe desaparecer de la lista

---

## 🐛 Problemas Comunes

### Error: "Unable to connect to MySQL"

**Solución**:
1. Verifica que MySQL esté corriendo (XAMPP/WAMP)
2. Verifica usuario y contraseña en `appsettings.json`
3. Verifica el puerto (3306 por defecto)

### Error: "Procedure not found"

**Solución**:
1. Ejecuta los 3 scripts SQL en orden
2. Verifica que estés en la base de datos "Negocios"
3. En phpMyAdmin → Rutinas → Verifica que existan los SPs

### Los iconos no se muestran

**Solución**:
1. Verifica conexión a internet (Bootstrap Icons se carga desde CDN)
2. Limpia caché del navegador (Ctrl+Shift+R)

### El diseño no se ve bien

**Solución**:
1. Limpia caché del navegador (Ctrl+Shift+R)
2. Verifica que `site.css` se cargó correctamente
3. Abre DevTools (F12) y revisa errores en consola

---

## 📊 Características del Diseño

### Colores
- 🔵 **Azul** (#0071e3) - Acciones principales
- 🟠 **Naranja** (#ff9500) - Edición
- 🔴 **Rojo** (#ff3b30) - Eliminación
- 🟢 **Verde** (#34c759) - Éxito, stock alto

### Badges de Stock
- 🟢 **Verde** - Stock alto (> 20 unidades)
- 🟡 **Naranja** - Stock medio (1-20 unidades)
- 🔴 **Rojo** - Sin stock (0 unidades)

### Efectos
- Transparencias con blur
- Bordes redondeados
- Hover effects suaves
- Transiciones de 0.2s

---

## 📚 Documentación Completa

Si necesitas más información, revisa:

1. **README_CRUD_PRODUCTOS.md** - Documentación completa
2. **INSTRUCCIONES_EJECUCION.md** - Guía detallada
3. **FUNCIONALIDADES_ADICIONALES.md** - Nuevas funcionalidades
4. **VERIFICACION_REQUERIMIENTOS.md** - Cumplimiento de requerimientos

---

## ✅ Checklist Rápido

Antes de empezar, verifica:

- [ ] MySQL está corriendo
- [ ] phpMyAdmin está accesible
- [ ] .NET 10.0 SDK está instalado
- [ ] Scripts SQL ejecutados
- [ ] Cadena de conexión configurada
- [ ] Paquetes restaurados (`dotnet restore`)

---

## 🎯 Resultado Esperado

Al finalizar, deberías tener:

✅ Aplicación corriendo en https://localhost:5001  
✅ CRUD completo funcional  
✅ Búsqueda por nombre y categoría  
✅ Validación de datos  
✅ Mensajes de confirmación  
✅ Diseño moderno estilo Apple  

---

## 🆘 Ayuda

Si tienes problemas:

1. Revisa la sección "Problemas Comunes" arriba
2. Lee `INSTRUCCIONES_EJECUCION.md` para más detalles
3. Verifica que todos los archivos estén en su lugar
4. Asegúrate de que MySQL esté corriendo

---

## 🎉 ¡Listo!

Tu aplicación CRUD de Productos está lista para usar.

**Tiempo total de configuración**: ~10 minutos  
**Dificultad**: Fácil  
**Resultado**: Aplicación profesional completa  

---

**¡Disfruta tu aplicación!** 🚀
