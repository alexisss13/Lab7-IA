# 📋 Instrucciones de Ejecución - CRUD Productos

## ⚡ Pasos Rápidos para Ejecutar

### 1️⃣ Preparar la Base de Datos

Abre **phpMyAdmin** y ejecuta los siguientes scripts en orden:

```sql
-- Paso 1: Crear la base de datos y tablas
-- Ejecutar: Negocios_MySQL.sql

-- Paso 2: Crear los stored procedures básicos
-- Ejecutar: StoredProcedures.sql

-- Paso 3: Crear los stored procedures del CRUD
-- Ejecutar: StoredProcedures_CRUD_Productos.sql
```

**Verificación**: Deberías ver estos stored procedures en la base de datos Negocios:
- ✅ sp_ListarProductos
- ✅ sp_ObtenerProductoPorId
- ✅ sp_InsertarProducto
- ✅ sp_ActualizarProducto
- ✅ sp_EliminarProducto
- ✅ sp_ListarCategorias
- ✅ sp_ListarProveedores

### 2️⃣ Configurar la Conexión

Edita el archivo `Lab7-IA/appsettings.json` y ajusta la cadena de conexión:

```json
{
  "ConnectionStrings": {
    "NegociosDB": "Server=localhost;Database=Negocios;User=root;Password=;Port=3306;"
  }
}
```

**Nota**: Si tu MySQL tiene contraseña, agrégala en `Password=TU_PASSWORD`

### 3️⃣ Restaurar Paquetes

Abre una terminal en la carpeta `Lab7-IA` y ejecuta:

```bash
dotnet restore
```

Esto instalará el paquete `MySql.Data` versión 9.1.0

### 4️⃣ Compilar el Proyecto

```bash
dotnet build
```

Verifica que no haya errores de compilación.

### 5️⃣ Ejecutar la Aplicación

```bash
dotnet run
```

O desde Visual Studio: presiona **F5** o **Ctrl+F5**

### 6️⃣ Acceder a la Aplicación

Abre tu navegador en:
- **HTTPS**: https://localhost:5001
- **HTTP**: http://localhost:5000

Navega a: **Productos** en el menú superior

---

## 🧪 Pruebas Funcionales

### Prueba 1: Listar Productos ✅

1. Ir a **Productos** en el menú
2. Deberías ver una tabla con todos los productos existentes
3. Verificar que se muestren:
   - ID del producto
   - Nombre
   - Categoría (con badge azul)
   - Proveedor
   - Unidad de medida
   - Precio
   - Stock (con colores: verde/naranja/rojo)
   - Botones de acción (Ver/Editar/Eliminar)

### Prueba 2: Crear Producto ✅

1. Clic en **"Nuevo Producto"**
2. Llenar el formulario:
   - **Nombre**: "Producto de Prueba"
   - **Categoría**: Seleccionar cualquiera
   - **Proveedor**: Seleccionar cualquiera
   - **Unidad de Medida**: "1 unidad"
   - **Precio**: 100
   - **Stock**: 50
3. Clic en **"Guardar Producto"**
4. Verificar mensaje de éxito
5. Verificar que el producto aparece en la lista

### Prueba 3: Ver Detalles ✅

1. En la lista de productos, clic en el ícono del ojo 👁️
2. Verificar que se muestre:
   - Información general del producto
   - Información comercial
   - Valor total en stock (Precio × Stock)
   - Estado del inventario con badge de color

### Prueba 4: Editar Producto ✅

1. En la lista, clic en el ícono de lápiz ✏️
2. Modificar algún campo (ej: cambiar el precio a 150)
3. Clic en **"Actualizar Producto"**
4. Verificar mensaje de éxito
5. Verificar que los cambios se reflejan en la lista

### Prueba 5: Eliminar Producto ✅

1. En la lista, clic en el ícono de basura 🗑️
2. Verificar que aparece la advertencia
3. Revisar los detalles del producto a eliminar
4. Clic en **"Confirmar Eliminación"**
5. Verificar mensaje de éxito
6. Verificar que el producto ya no aparece en la lista

---

## 🎨 Verificación de Diseño

### Elementos Visuales a Verificar:

✅ **Transparencias y Blur**
- Fondo con gradiente suave
- Cards con efecto de vidrio (backdrop-filter)
- Navbar transparente

✅ **Bordes Redondeados**
- Botones con border-radius de 12px
- Cards con border-radius de 16px
- Inputs con border-radius de 10px

✅ **Iconos Bootstrap**
- Todos los iconos deben mostrarse correctamente
- No deben aparecer emojis

✅ **Colores Estilo Apple**
- Azul: #0071e3 (botones principales)
- Naranja: #ff9500 (editar)
- Rojo: #ff3b30 (eliminar)
- Verde: #34c759 (stock alto)

✅ **Responsive**
- Probar en diferentes tamaños de ventana
- En móvil, el grid debe cambiar a 1 columna

---

## 🐛 Solución de Problemas

### Error: "Unable to connect to any of the specified MySQL hosts"

**Solución**:
1. Verificar que MySQL esté corriendo (XAMPP/WAMP)
2. Verificar el puerto en appsettings.json (3306 por defecto)
3. Verificar usuario y contraseña

### Error: "Procedure 'sp_ListarProductos' not found"

**Solución**:
1. Ejecutar los scripts SQL en orden
2. Verificar que estás en la base de datos "Negocios"
3. En phpMyAdmin, ir a la pestaña "Rutinas" y verificar que existen

### Error: "Package MySql.Data not found"

**Solución**:
```bash
dotnet restore
```

### Los iconos no se muestran

**Solución**:
1. Verificar conexión a internet (Bootstrap Icons se carga desde CDN)
2. Verificar que el link esté en _Layout.cshtml:
```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
```

### El diseño no se ve bien

**Solución**:
1. Limpiar caché del navegador (Ctrl+Shift+R)
2. Verificar que site.css se cargó correctamente
3. Abrir DevTools (F12) y revisar errores en consola

---

## 📊 Datos de Prueba

Si quieres probar con datos específicos, aquí hay ejemplos:

### Producto 1:
- **Nombre**: Laptop HP Pavilion
- **Categoría**: Granos/Cereales (o cualquiera)
- **Proveedor**: Exotic Liquids (o cualquiera)
- **Unidad**: 1 unidad
- **Precio**: 15000
- **Stock**: 10

### Producto 2:
- **Nombre**: Mouse Inalámbrico
- **Categoría**: Bebidas
- **Proveedor**: Tokyo Traders
- **Unidad**: 1 pieza
- **Precio**: 250
- **Stock**: 100

### Producto 3:
- **Nombre**: Teclado Mecánico
- **Categoría**: Condimentos
- **Proveedor**: Grandma Kellys Homestead
- **Unidad**: 1 unidad
- **Precio**: 800
- **Stock**: 0

---

## ✅ Checklist de Verificación

Antes de considerar el proyecto completo, verifica:

- [ ] La base de datos está creada con todos los stored procedures
- [ ] La aplicación compila sin errores
- [ ] La aplicación se ejecuta correctamente
- [ ] Se pueden listar todos los productos
- [ ] Se puede crear un nuevo producto
- [ ] Se pueden ver los detalles de un producto
- [ ] Se puede editar un producto existente
- [ ] Se puede eliminar un producto
- [ ] Los iconos se muestran correctamente (no emojis)
- [ ] El diseño es limpio y profesional
- [ ] Las transparencias y efectos de blur funcionan
- [ ] Los badges de stock muestran colores correctos
- [ ] Los mensajes de éxito/error se muestran
- [ ] El diseño es responsive

---

## 🎯 Resultado Esperado

Al finalizar, deberías tener:

1. ✅ Un CRUD completamente funcional de Productos
2. ✅ Interfaz moderna estilo Apple
3. ✅ Todas las operaciones usando Stored Procedures
4. ✅ Diseño responsive y profesional
5. ✅ Iconos Bootstrap (no emojis)
6. ✅ Validación de datos
7. ✅ Mensajes de feedback al usuario

---

**¡Listo para usar! 🚀**

Si tienes algún problema, revisa la sección de "Solución de Problemas" o verifica que todos los archivos estén en su lugar.
