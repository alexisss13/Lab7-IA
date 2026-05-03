# 🏗️ Arquitectura del Sistema - CRUD Productos

## 📐 Diagrama de Arquitectura

```
┌─────────────────────────────────────────────────────────────────┐
│                         NAVEGADOR WEB                            │
│                    (Chrome, Firefox, Edge)                       │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             │ HTTPS/HTTP
                             │
┌────────────────────────────▼────────────────────────────────────┐
│                      ASP.NET CORE MVC                            │
│                         (.NET 10.0)                              │
│                                                                  │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │                    CAPA DE PRESENTACIÓN                   │  │
│  │                                                            │  │
│  │  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐      │  │
│  │  │  Index.     │  │  Create.    │  │  Edit.      │      │  │
│  │  │  cshtml     │  │  cshtml     │  │  cshtml     │      │  │
│  │  └─────────────┘  └─────────────┘  └─────────────┘      │  │
│  │                                                            │  │
│  │  ┌─────────────┐  ┌─────────────┐                        │  │
│  │  │  Delete.    │  │  Details.   │                        │  │
│  │  │  cshtml     │  │  cshtml     │                        │  │
│  │  └─────────────┘  └─────────────┘                        │  │
│  │                                                            │  │
│  │  • Bootstrap 5                                             │  │
│  │  • Bootstrap Icons                                         │  │
│  │  • CSS Personalizado (Estilo Apple)                       │  │
│  └────────────────────────┬───────────────────────────────────┘  │
│                           │                                      │
│  ┌────────────────────────▼───────────────────────────────────┐  │
│  │                    CAPA DE CONTROL                         │  │
│  │                                                            │  │
│  │              ProductosController.cs                        │  │
│  │                                                            │  │
│  │  • Index()          → Listar productos                     │  │
│  │  • Create()         → Crear producto                       │  │
│  │  • Edit(id)         → Editar producto                      │  │
│  │  • Delete(id)       → Eliminar producto                    │  │
│  │  • Details(id)      → Ver detalles                         │  │
│  │  • CargarListas()   → Cargar dropdowns                     │  │
│  └────────────────────────┬───────────────────────────────────┘  │
│                           │                                      │
│  ┌────────────────────────▼───────────────────────────────────┐  │
│  │                    CAPA DE MODELO                          │  │
│  │                                                            │  │
│  │  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐    │  │
│  │  │  Producto.cs │  │ Categoria.cs │  │ Proveedor.cs │    │  │
│  │  └──────────────┘  └──────────────┘  └──────────────┘    │  │
│  │                                                            │  │
│  │  • Propiedades del dominio                                 │  │
│  │  • Validaciones                                            │  │
│  │  • Relaciones                                              │  │
│  └────────────────────────┬───────────────────────────────────┘  │
│                           │                                      │
│  ┌────────────────────────▼───────────────────────────────────┐  │
│  │                  CAPA DE ACCESO A DATOS                    │  │
│  │                                                            │  │
│  │                    MySql.Data                              │  │
│  │                                                            │  │
│  │  • MySqlConnection                                         │  │
│  │  • MySqlCommand                                            │  │
│  │  • MySqlDataReader                                         │  │
│  │  • Stored Procedures                                       │  │
│  └────────────────────────┬───────────────────────────────────┘  │
└────────────────────────────┼────────────────────────────────────┘
                             │
                             │ TCP/IP (Port 3306)
                             │
┌────────────────────────────▼────────────────────────────────────┐
│                        MYSQL SERVER                              │
│                      (Base de Datos)                             │
│                                                                  │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │                  Base de Datos: Negocios                  │  │
│  │                                                            │  │
│  │  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐      │  │
│  │  │   PRODUCTO  │  │  CATEGORIA  │  │  PROVEEDOR  │      │  │
│  │  │   (Tabla)   │  │   (Tabla)   │  │   (Tabla)   │      │  │
│  │  └─────────────┘  └─────────────┘  └─────────────┘      │  │
│  │                                                            │  │
│  │  ┌─────────────────────────────────────────────────────┐  │  │
│  │  │           STORED PROCEDURES                         │  │  │
│  │  │                                                      │  │  │
│  │  │  • sp_ListarProductos                               │  │  │
│  │  │  • sp_ObtenerProductoPorId                          │  │  │
│  │  │  • sp_InsertarProducto                              │  │  │
│  │  │  • sp_ActualizarProducto                            │  │  │
│  │  │  • sp_EliminarProducto                              │  │  │
│  │  │  • sp_ListarCategorias                              │  │  │
│  │  │  • sp_ListarProveedores                             │  │  │
│  │  └─────────────────────────────────────────────────────┘  │  │
│  └──────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 🔄 Flujo de Datos - Operación CREATE

```
┌──────────┐
│ Usuario  │
└────┬─────┘
     │ 1. Clic en "Nuevo Producto"
     ▼
┌─────────────────┐
│  Index.cshtml   │
└────┬────────────┘
     │ 2. Navega a Create
     ▼
┌─────────────────────────┐
│  ProductosController    │
│  Create() GET           │
└────┬────────────────────┘
     │ 3. Carga listas (Categorías, Proveedores)
     ▼
┌─────────────────┐
│  MySQL          │
│  sp_ListarCat   │
│  sp_ListarProv  │
└────┬────────────┘
     │ 4. Retorna datos
     ▼
┌─────────────────┐
│  Create.cshtml  │
│  (Formulario)   │
└────┬────────────┘
     │ 5. Usuario llena formulario y envía
     ▼
┌─────────────────────────┐
│  ProductosController    │
│  Create() POST          │
└────┬────────────────────┘
     │ 6. Valida datos
     ▼
┌─────────────────┐
│  MySQL          │
│  sp_Insertar    │
│  Producto       │
└────┬────────────┘
     │ 7. Inserta registro
     ▼
┌─────────────────────────┐
│  ProductosController    │
│  RedirectToAction       │
└────┬────────────────────┘
     │ 8. Redirige a Index
     ▼
┌─────────────────┐
│  Index.cshtml   │
│  + Mensaje      │
│  "Éxito"        │
└─────────────────┘
```

---

## 🔄 Flujo de Datos - Operación READ (Lista)

```
Usuario → Index.cshtml → ProductosController.Index()
                              ↓
                         MySQL: sp_ListarProductos
                              ↓
                         Retorna List<Producto>
                              ↓
                         Index.cshtml (Renderiza tabla)
                              ↓
                         Navegador (Muestra UI)
```

---

## 🔄 Flujo de Datos - Operación UPDATE

```
Usuario clic "Editar" → ProductosController.Edit(id) GET
                              ↓
                         MySQL: sp_ObtenerProductoPorId
                              ↓
                         Edit.cshtml (Formulario pre-cargado)
                              ↓
                         Usuario modifica y envía
                              ↓
                         ProductosController.Edit(id) POST
                              ↓
                         MySQL: sp_ActualizarProducto
                              ↓
                         RedirectToAction("Index")
                              ↓
                         Index.cshtml + Mensaje "Actualizado"
```

---

## 🔄 Flujo de Datos - Operación DELETE

```
Usuario clic "Eliminar" → ProductosController.Delete(id) GET
                              ↓
                         MySQL: sp_ObtenerProductoPorId
                              ↓
                         Delete.cshtml (Confirmación)
                              ↓
                         Usuario confirma
                              ↓
                         ProductosController.DeleteConfirmed(id) POST
                              ↓
                         MySQL: sp_EliminarProducto
                              ↓
                         RedirectToAction("Index")
                              ↓
                         Index.cshtml + Mensaje "Eliminado"
```

---

## 📊 Diagrama de Clases

```
┌─────────────────────────────────────┐
│          Producto                   │
├─────────────────────────────────────┤
│ - IdProducto: int                   │
│ - NombreProducto: string            │
│ - IdProveedor: int                  │
│ - NombreProveedor: string?          │
│ - IdCategoria: int                  │
│ - NombreCategoria: string?          │
│ - Umedida: string?                  │
│ - PrecioUnidad: decimal             │
│ - UnidadesEnExistencia: short       │
└─────────────────────────────────────┘
              △
              │
              │ usa
              │
┌─────────────┴───────────────────────┐
│     ProductosController             │
├─────────────────────────────────────┤
│ - _configuration: IConfiguration    │
│ - _connectionString: string         │
├─────────────────────────────────────┤
│ + Index(): IActionResult            │
│ + Create(): IActionResult           │
│ + Create(Producto): IActionResult   │
│ + Edit(int): IActionResult          │
│ + Edit(int, Producto): IActionResult│
│ + Delete(int): IActionResult        │
│ + DeleteConfirmed(int): IActionResult│
│ + Details(int): IActionResult       │
│ - CargarListas(): void              │
└─────────────────────────────────────┘
              │
              │ usa
              ▼
┌─────────────────────────────────────┐
│         MySqlConnection             │
│         MySqlCommand                │
│         MySqlDataReader             │
└─────────────────────────────────────┘
```

---

## 🗂️ Estructura de Carpetas

```
Lab7-IA/
│
├── Controllers/
│   ├── HomeController.cs
│   └── ProductosController.cs ⭐
│
├── Models/
│   ├── Producto.cs ⭐
│   ├── Categoria.cs ⭐
│   ├── Proveedor.cs ⭐
│   └── ErrorViewModel.cs
│
├── Views/
│   ├── Home/
│   │   ├── Index.cshtml
│   │   └── Privacy.cshtml
│   │
│   ├── Productos/ ⭐
│   │   ├── Index.cshtml
│   │   ├── Create.cshtml
│   │   ├── Edit.cshtml
│   │   ├── Delete.cshtml
│   │   └── Details.cshtml
│   │
│   ├── Shared/
│   │   ├── _Layout.cshtml (modificado) ⭐
│   │   ├── _Layout.cshtml.css
│   │   ├── Error.cshtml
│   │   └── _ValidationScriptsPartial.cshtml
│   │
│   ├── _ViewImports.cshtml
│   └── _ViewStart.cshtml
│
├── wwwroot/
│   ├── css/
│   │   └── site.css (modificado) ⭐
│   │
│   ├── js/
│   │   └── site.js
│   │
│   ├── lib/
│   │   ├── bootstrap/
│   │   ├── jquery/
│   │   └── jquery-validation/
│   │
│   └── favicon.ico
│
├── Properties/
│   └── launchSettings.json
│
├── appsettings.json (modificado) ⭐
├── appsettings.Development.json
├── Program.cs
└── Lab7-IA.csproj (modificado) ⭐

⭐ = Archivos creados o modificados para el CRUD
```

---

## 🔐 Seguridad - Capas de Protección

```
┌─────────────────────────────────────────────────────────┐
│                    CAPA 1: VISTA                        │
│  • Validación HTML5 (required, type="number")          │
│  • Anti-forgery token (@Html.AntiForgeryToken())       │
└────────────────────┬────────────────────────────────────┘
                     │
┌────────────────────▼────────────────────────────────────┐
│                 CAPA 2: CONTROLADOR                     │
│  • [ValidateAntiForgeryToken]                           │
│  • Validación de ModelState                             │
│  • Try-Catch para manejo de errores                     │
│  • Validación de parámetros                             │
└────────────────────┬────────────────────────────────────┘
                     │
┌────────────────────▼────────────────────────────────────┐
│              CAPA 3: ACCESO A DATOS                     │
│  • Uso de parámetros (no concatenación)                 │
│  • MySqlParameter para prevenir SQL Injection           │
│  • Stored Procedures (lógica encapsulada)               │
└────────────────────┬────────────────────────────────────┘
                     │
┌────────────────────▼────────────────────────────────────┐
│                CAPA 4: BASE DE DATOS                    │
│  • Stored Procedures (no SQL dinámico)                  │
│  • Validación de tipos de datos                         │
│  • Constraints (FK, PK, NOT NULL)                       │
└─────────────────────────────────────────────────────────┘
```

---

## 🎨 Arquitectura de Diseño

```
┌─────────────────────────────────────────────────────────┐
│                   PRINCIPIOS DE DISEÑO                  │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  1. MINIMALISMO                                         │
│     • Espacios en blanco generosos                      │
│     • Elementos esenciales solamente                    │
│     • Sin decoraciones innecesarias                     │
│                                                         │
│  2. TRANSPARENCIAS                                      │
│     • backdrop-filter: blur(10px)                       │
│     • rgba() para colores con opacidad                  │
│     • Efecto de vidrio (glassmorphism)                  │
│                                                         │
│  3. BORDES REDONDEADOS                                  │
│     • border-radius: 12px - 16px                        │
│     • Suavidad en todos los elementos                   │
│     • Consistencia visual                               │
│                                                         │
│  4. COLORES SUTILES                                     │
│     • Sin degradados excesivos                          │
│     • Colores con significado (verde=éxito, rojo=error) │
│     • Paleta limitada y coherente                       │
│                                                         │
│  5. TIPOGRAFÍA                                          │
│     • -apple-system, BlinkMacSystemFont                 │
│     • Font-smoothing para mejor renderizado             │
│     • Jerarquía clara (títulos, subtítulos, texto)      │
│                                                         │
│  6. INTERACTIVIDAD                                      │
│     • Transiciones suaves (0.2s ease)                   │
│     • Hover effects sutiles                             │
│     • Transform: translateY(-1px) en hover              │
│                                                         │
│  7. ICONOGRAFÍA                                         │
│     • Bootstrap Icons (profesionales)                   │
│     • Tamaño consistente                                │
│     • Color coherente con el contexto                   │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

---

## 📱 Arquitectura Responsive

```
┌─────────────────────────────────────────────────────────┐
│                    DESKTOP (> 768px)                    │
│  ┌───────────────────────────────────────────────────┐  │
│  │  Header: Logo + Menú horizontal                   │  │
│  ├───────────────────────────────────────────────────┤  │
│  │  Título + Botón "Nuevo" (flex: space-between)     │  │
│  ├───────────────────────────────────────────────────┤  │
│  │  Tabla: 8 columnas                                │  │
│  │  Grid formularios: 2 columnas                     │  │
│  ├───────────────────────────────────────────────────┤  │
│  │  Footer                                           │  │
│  └───────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────┐
│                    MOBILE (< 768px)                     │
│  ┌───────────────────────────────────────────────────┐  │
│  │  Header: Logo + Menú hamburguesa                  │  │
│  ├───────────────────────────────────────────────────┤  │
│  │  Título                                           │  │
│  │  Botón "Nuevo" (full width)                       │  │
│  ├───────────────────────────────────────────────────┤  │
│  │  Tabla: Scroll horizontal                         │  │
│  │  Grid formularios: 1 columna                      │  │
│  ├───────────────────────────────────────────────────┤  │
│  │  Footer                                           │  │
│  └───────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────┘
```

---

## 🔄 Ciclo de Vida de una Petición

```
1. Usuario hace clic en "Productos"
   ↓
2. Navegador envía GET /Productos/Index
   ↓
3. ASP.NET Core recibe la petición
   ↓
4. Routing encuentra ProductosController.Index()
   ↓
5. Controlador se conecta a MySQL
   ↓
6. Ejecuta sp_ListarProductos
   ↓
7. MySQL retorna ResultSet
   ↓
8. Controlador mapea datos a List<Producto>
   ↓
9. Controlador pasa modelo a la vista
   ↓
10. Razor Engine procesa Index.cshtml
   ↓
11. Genera HTML + CSS + JS
   ↓
12. ASP.NET Core envía respuesta HTTP
   ↓
13. Navegador renderiza la página
   ↓
14. Usuario ve la lista de productos
```

---

## 🎯 Patrones de Diseño Utilizados

### 1. **MVC (Model-View-Controller)**
- **Model**: Producto.cs, Categoria.cs, Proveedor.cs
- **View**: *.cshtml
- **Controller**: ProductosController.cs

### 2. **Repository Pattern** (Implícito)
- Stored Procedures actúan como repositorio
- Encapsulan lógica de acceso a datos

### 3. **Dependency Injection**
- IConfiguration inyectado en el controlador
- Configuración centralizada

### 4. **PRG (Post-Redirect-Get)**
- Después de POST, se hace Redirect
- Previene reenvío de formularios

### 5. **DTO (Data Transfer Object)**
- Modelos transportan datos entre capas
- Propiedades adicionales (NombreProveedor, etc.)

---

## 📊 Diagrama de Estados - Producto

```
┌─────────────┐
│   NUEVO     │ (Usuario clic "Nuevo Producto")
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  CREANDO    │ (Formulario Create)
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  GUARDADO   │ (sp_InsertarProducto)
└──────┬──────┘
       │
       ├──────────────────┐
       │                  │
       ▼                  ▼
┌─────────────┐    ┌─────────────┐
│  EDITANDO   │    │  ELIMINANDO │
└──────┬──────┘    └──────┬──────┘
       │                  │
       ▼                  ▼
┌─────────────┐    ┌─────────────┐
│ ACTUALIZADO │    │  ELIMINADO  │
└─────────────┘    └─────────────┘
```

---

Esta arquitectura garantiza:
- ✅ Separación de responsabilidades
- ✅ Mantenibilidad
- ✅ Escalabilidad
- ✅ Seguridad
- ✅ Experiencia de usuario óptima
