# CRUD de Productos - Lab7-IA

Sistema completo de gestión de productos con interfaz moderna estilo Apple para la base de datos Negocios.

## 📋 Características

- ✅ **CRUD Completo**: Crear, Leer, Actualizar y Eliminar productos
- 🎨 **Diseño Moderno**: Interfaz limpia estilo Apple con transparencias y bordes redondeados
- 🔍 **Vista Detallada**: Información completa de cada producto
- 📊 **Indicadores Visuales**: Badges de stock con colores según disponibilidad
- 🎯 **UX Profesional**: Navegación intuitiva y responsive
- 🔒 **Stored Procedures**: Todas las operaciones usan procedimientos almacenados

## 🗄️ Base de Datos

### Stored Procedures Creados

1. **sp_ListarProductos**: Lista todos los productos con información de categoría y proveedor
2. **sp_ObtenerProductoPorId**: Obtiene un producto específico por ID
3. **sp_InsertarProducto**: Inserta un nuevo producto
4. **sp_ActualizarProducto**: Actualiza un producto existente
5. **sp_EliminarProducto**: Elimina un producto
6. **sp_ListarCategorias**: Lista todas las categorías
7. **sp_ListarProveedores**: Lista todos los proveedores

### Instalación de Stored Procedures

```sql
-- 1. Ejecutar el script original de la base de datos
source Negocios_MySQL.sql

-- 2. Ejecutar los stored procedures existentes
source StoredProcedures.sql

-- 3. Ejecutar los nuevos stored procedures para CRUD
source StoredProcedures_CRUD_Productos.sql
```

## 🚀 Instalación

### Requisitos Previos

- .NET 10.0 SDK
- MySQL Server (con phpMyAdmin)
- Visual Studio 2022 o VS Code

### Pasos de Instalación

1. **Configurar la Base de Datos**

   ```bash
   # En phpMyAdmin o MySQL CLI, ejecutar los scripts en orden:
   # 1. Negocios_MySQL.sql
   # 2. StoredProcedures.sql
   # 3. StoredProcedures_CRUD_Productos.sql
   ```

2. **Configurar la Cadena de Conexión**

   Editar `Lab7-IA/appsettings.json`:

   ```json
   {
     "ConnectionStrings": {
       "NegociosDB": "Server=localhost;Database=Negocios;User=root;Password=TU_PASSWORD;Port=3306;"
     }
   }
   ```

3. **Restaurar Paquetes NuGet**

   ```bash
   cd Lab7-IA
   dotnet restore
   ```

4. **Ejecutar la Aplicación**

   ```bash
   dotnet run
   ```

5. **Acceder a la Aplicación**

   Abrir el navegador en: `https://localhost:5001` o `http://localhost:5000`

## 📁 Estructura del Proyecto

```
Lab7-IA/
├── Controllers/
│   ├── HomeController.cs
│   └── ProductosController.cs          # Controlador CRUD de Productos
├── Models/
│   ├── Producto.cs                     # Modelo de Producto
│   ├── Categoria.cs                    # Modelo de Categoría
│   ├── Proveedor.cs                    # Modelo de Proveedor
│   └── ErrorViewModel.cs
├── Views/
│   ├── Productos/
│   │   ├── Index.cshtml               # Lista de productos
│   │   ├── Create.cshtml              # Crear producto
│   │   ├── Edit.cshtml                # Editar producto
│   │   ├── Delete.cshtml              # Confirmar eliminación
│   │   └── Details.cshtml             # Detalles del producto
│   └── Shared/
│       └── _Layout.cshtml             # Layout principal
└── wwwroot/
    └── css/
        └── site.css                    # Estilos globales
```

## 🎨 Características de Diseño

### Paleta de Colores

- **Azul Principal**: `#0071e3` (Acciones principales, enlaces)
- **Naranja**: `#ff9500` (Edición)
- **Rojo**: `#ff3b30` (Eliminación)
- **Verde**: `#34c759` (Stock alto)
- **Gris**: `#1d1d1f` (Texto principal)

### Componentes UI

- **Transparencias**: `rgba()` con `backdrop-filter: blur(10px)`
- **Bordes Redondeados**: `border-radius: 12px` - `16px`
- **Sombras Suaves**: `box-shadow: 0 2px 16px rgba(0, 0, 0, 0.06)`
- **Transiciones**: `transition: all 0.2s ease`
- **Iconos**: Bootstrap Icons 1.11.3

### Badges de Stock

- 🟢 **Stock Alto** (> 20 unidades): Verde
- 🟡 **Stock Medio** (1-20 unidades): Naranja
- 🔴 **Sin Stock** (0 unidades): Rojo

## 🔧 Funcionalidades

### 1. Listar Productos (Index)

- Tabla responsive con todos los productos
- Información de categoría y proveedor
- Indicadores visuales de stock
- Acciones rápidas: Ver, Editar, Eliminar

### 2. Crear Producto (Create)

- Formulario con validación
- Selección de categoría y proveedor desde dropdowns
- Campos: Nombre, Categoría, Proveedor, Unidad de Medida, Precio, Stock

### 3. Editar Producto (Edit)

- Formulario pre-cargado con datos actuales
- Mismos campos que crear
- Validación de datos

### 4. Ver Detalles (Details)

- Vista completa del producto
- Información organizada en secciones
- Cálculo de valor total en stock
- Estado visual del inventario

### 5. Eliminar Producto (Delete)

- Vista de confirmación con todos los detalles
- Advertencia clara sobre la acción
- Confirmación requerida

## 🔐 Seguridad

- Uso de Stored Procedures para prevenir SQL Injection
- Validación de datos en el servidor
- Anti-forgery tokens en formularios
- Manejo de errores con try-catch

## 📱 Responsive Design

- Diseño adaptable a móviles, tablets y desktop
- Grid responsive que se ajusta automáticamente
- Botones y formularios optimizados para touch

## 🎯 Mejores Prácticas Implementadas

- ✅ Separación de responsabilidades (MVC)
- ✅ Uso de Stored Procedures
- ✅ Manejo de errores robusto
- ✅ Código limpio y comentado
- ✅ Diseño UX/UI profesional
- ✅ Validación de datos
- ✅ Mensajes de feedback al usuario

## 📝 Notas Adicionales

### Personalización de la Conexión

Si tu configuración de MySQL es diferente, ajusta estos parámetros en `appsettings.json`:

- **Server**: Dirección del servidor (localhost, IP, etc.)
- **Database**: Nombre de la base de datos (Negocios)
- **User**: Usuario de MySQL (root por defecto)
- **Password**: Contraseña del usuario (vacío por defecto en XAMPP)
- **Port**: Puerto de MySQL (3306 por defecto)

### Solución de Problemas Comunes

1. **Error de conexión a MySQL**
   - Verificar que MySQL esté corriendo
   - Verificar credenciales en appsettings.json
   - Verificar que el puerto sea correcto

2. **Stored Procedures no encontrados**
   - Ejecutar los scripts SQL en orden
   - Verificar que la base de datos "Negocios" esté seleccionada

3. **Paquete MySql.Data no encontrado**
   - Ejecutar `dotnet restore`
   - Verificar conexión a internet

## 👨‍💻 Desarrollo

Este proyecto fue desarrollado siguiendo las mejores prácticas de:

- ASP.NET Core MVC
- Diseño de interfaces modernas
- Arquitectura limpia
- Experiencia de usuario

## 📄 Licencia

Proyecto educativo para Lab7-IA

---

**Desarrollado con ❤️ usando ASP.NET Core y MySQL**
