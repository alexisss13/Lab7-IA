# 🎨 Guía Visual - CRUD Productos

## 📸 Vistas de la Aplicación

Esta guía describe cómo se verá cada pantalla de la aplicación.

---

## 1️⃣ Vista: Index (Lista de Productos)

### Descripción Visual

```
╔════════════════════════════════════════════════════════════════╗
║  Lab7_IA    Home    Productos    Privacy                      ║
╠════════════════════════════════════════════════════════════════╣
║                                                                ║
║  📦 Productos                          [+ Nuevo Producto]     ║
║  Administra el catálogo de productos                          ║
║  ────────────────────────────────────────────────────────────  ║
║                                                                ║
║  ┌──────────────────────────────────────────────────────────┐ ║
║  │ ID │ Producto      │ Categoría │ Proveedor │ ... │ Acc. │ ║
║  ├────┼───────────────┼───────────┼───────────┼─────┼──────┤ ║
║  │ 77 │ Te Dharamsala │ Bebidas   │ Exotic... │ $18 │ 👁✏🗑 │ ║
║  │ 76 │ Cerveza...    │ Bebidas   │ Exotic... │ $19 │ 👁✏🗑 │ ║
║  │ 75 │ Sirope...     │ Condim... │ Exotic... │ $10 │ 👁✏🗑 │ ║
║  └──────────────────────────────────────────────────────────┘ ║
║                                                                ║
╚════════════════════════════════════════════════════════════════╝
```

### Elementos Visuales

**Header**
- Título grande: "📦 Productos" (icono + texto)
- Subtítulo gris: "Administra el catálogo de productos"
- Botón azul redondeado: "+ Nuevo Producto"
- Separador sutil debajo

**Tabla**
- Fondo blanco semi-transparente con blur
- Bordes redondeados (16px)
- Sombra suave
- Headers en gris con texto en mayúsculas
- Filas con hover effect (fondo azul muy claro)

**Badges**
- Categoría: Fondo azul claro, texto azul
- Stock alto (>20): Fondo verde claro, texto verde
- Stock medio (1-20): Fondo naranja claro, texto naranja
- Stock bajo (0): Fondo rojo claro, texto rojo

**Botones de Acción**
- Ojo (Ver): Fondo azul claro, icono azul
- Lápiz (Editar): Fondo naranja claro, icono naranja
- Basura (Eliminar): Fondo rojo claro, icono rojo
- Todos con bordes redondeados (8px)
- Hover: Color más intenso + elevación

---

## 2️⃣ Vista: Create (Crear Producto)

### Descripción Visual

```
╔════════════════════════════════════════════════════════════════╗
║  Lab7_IA    Home    Productos    Privacy                      ║
╠════════════════════════════════════════════════════════════════╣
║                                                                ║
║  ➕ Nuevo Producto                            [← Volver]      ║
║  Completa la información del producto                         ║
║  ────────────────────────────────────────────────────────────  ║
║                                                                ║
║  ┌──────────────────────────────────────────────────────────┐ ║
║  │                                                          │ ║
║  │  📦 Nombre del Producto                                 │ ║
║  │  [_____________________________________________]         │ ║
║  │                                                          │ ║
║  │  🏷️ Categoría              🏢 Proveedor                 │ ║
║  │  [▼ Seleccione...]         [▼ Seleccione...]           │ ║
║  │                                                          │ ║
║  │  📏 Unidad de Medida        💵 Precio Unitario          │ ║
║  │  [_____________]            [_____________]             │ ║
║  │                                                          │ ║
║  │  📦 Stock                                                │ ║
║  │  [_____________]                                         │ ║
║  │                                                          │ ║
║  │  ────────────────────────────────────────────────────    │ ║
║  │                    [❌ Cancelar]  [✅ Guardar Producto]  │ ║
║  └──────────────────────────────────────────────────────────┘ ║
║                                                                ║
╚════════════════════════════════════════════════════════════════╝
```

### Elementos Visuales

**Header**
- Título: "➕ Nuevo Producto" (icono azul)
- Subtítulo: "Completa la información del producto"
- Botón "← Volver" (gris claro)

**Formulario**
- Card blanco semi-transparente con blur
- Bordes redondeados (16px)
- Grid de 2 columnas (responsive)
- Labels con iconos azules
- Inputs con bordes redondeados (10px)
- Focus: Borde azul + sombra azul suave

**Botones**
- Cancelar: Gris claro, texto oscuro
- Guardar: Azul, texto blanco
- Ambos con iconos y bordes redondeados (12px)
- Hover: Elevación + color más intenso

---

## 3️⃣ Vista: Edit (Editar Producto)

### Descripción Visual

```
╔════════════════════════════════════════════════════════════════╗
║  Lab7_IA    Home    Productos    Privacy                      ║
╠════════════════════════════════════════════════════════════════╣
║                                                                ║
║  ✏️ Editar Producto                           [← Volver]      ║
║  Modifica la información del producto                         ║
║  ────────────────────────────────────────────────────────────  ║
║                                                                ║
║  ┌──────────────────────────────────────────────────────────┐ ║
║  │                                                          │ ║
║  │  📦 Nombre del Producto                                 │ ║
║  │  [Te Dharamsala_____________________________]           │ ║
║  │                                                          │ ║
║  │  🏷️ Categoría              🏢 Proveedor                 │ ║
║  │  [▼ Bebidas]               [▼ Exotic Liquids]          │ ║
║  │                                                          │ ║
║  │  📏 Unidad de Medida        💵 Precio Unitario          │ ║
║  │  [12 frascos___]            [18.00________]            │ ║
║  │                                                          │ ║
║  │  📦 Stock                                                │ ║
║  │  [39___________]                                         │ ║
║  │                                                          │ ║
║  │  ────────────────────────────────────────────────────    │ ║
║  │                [❌ Cancelar]  [✅ Actualizar Producto]   │ ║
║  └──────────────────────────────────────────────────────────┘ ║
║                                                                ║
╚════════════════════════════════════════════════════════════════╝
```

### Elementos Visuales

**Diferencias con Create**
- Título: "✏️ Editar Producto" (icono naranja)
- Labels con iconos naranjas (en lugar de azules)
- Campos pre-llenados con datos actuales
- Botón principal naranja: "Actualizar Producto"
- Focus de inputs: Borde naranja + sombra naranja

---

## 4️⃣ Vista: Delete (Confirmar Eliminación)

### Descripción Visual

```
╔════════════════════════════════════════════════════════════════╗
║  Lab7_IA    Home    Productos    Privacy                      ║
╠════════════════════════════════════════════════════════════════╣
║                                                                ║
║  🗑️ Eliminar Producto                         [← Volver]      ║
║  ¿Estás seguro de que deseas eliminar este producto?          ║
║  ────────────────────────────────────────────────────────────  ║
║                                                                ║
║  ┌──────────────────────────────────────────────────────────┐ ║
║  │ ⚠️ Advertencia: Esta acción no se puede deshacer.       │ ║
║  │    El producto será eliminado permanentemente.           │ ║
║  └──────────────────────────────────────────────────────────┘ ║
║                                                                ║
║  ┌──────────────────────────────────────────────────────────┐ ║
║  │  Información del Producto                                │ ║
║  ├──────────────────────────────────────────────────────────┤ ║
║  │                                                          │ ║
║  │  # ID                      📦 Nombre del Producto        │ ║
║  │  77                        Te Dharamsala                 │ ║
║  │                                                          │ ║
║  │  🏷️ Categoría              🏢 Proveedor                 │ ║
║  │  Bebidas                   Exotic Liquids                │ ║
║  │                                                          │ ║
║  │  📏 Unidad de Medida        💵 Precio Unitario          │ ║
║  │  12 frascos                $18.00                        │ ║
║  │                                                          │ ║
║  │  📦 Stock                                                │ ║
║  │  39 unidades                                             │ ║
║  │                                                          │ ║
║  │  ────────────────────────────────────────────────────    │ ║
║  │              [❌ Cancelar]  [🗑️ Confirmar Eliminación]   │ ║
║  └──────────────────────────────────────────────────────────┘ ║
║                                                                ║
╚════════════════════════════════════════════════════════════════╝
```

### Elementos Visuales

**Alerta de Advertencia**
- Fondo naranja muy claro
- Borde naranja
- Icono ⚠️ grande
- Texto en naranja oscuro

**Card de Información**
- Fondo blanco semi-transparente
- Header con título "Información del Producto"
- Datos organizados en grid 2 columnas
- Labels en gris claro
- Valores en negro

**Botones**
- Cancelar: Gris claro
- Confirmar: Rojo, texto blanco
- Hover en confirmar: Rojo más intenso + elevación

---

## 5️⃣ Vista: Details (Ver Detalles)

### Descripción Visual

```
╔════════════════════════════════════════════════════════════════╗
║  Lab7_IA    Home    Productos    Privacy                      ║
╠════════════════════════════════════════════════════════════════╣
║                                                                ║
║  ℹ️ Detalles del Producto                     [← Volver]      ║
║  Información completa del producto                            ║
║  ────────────────────────────────────────────────────────────  ║
║                                                                ║
║  ┌──────────────────────────────────────────────────────────┐ ║
║  │  ID: 77                                      [✏️ Editar]  │ ║
║  │  Te Dharamsala                                           │ ║
║  ├──────────────────────────────────────────────────────────┤ ║
║  │                                                          │ ║
║  │  📋 Información General                                  │ ║
║  │  ────────────────────────────────────────────────────    │ ║
║  │                                                          │ ║
║  │  🏷️ CATEGORÍA              🏢 PROVEEDOR                 │ ║
║  │  Bebidas                   Exotic Liquids                │ ║
║  │                                                          │ ║
║  │  📏 UNIDAD DE MEDIDA                                     │ ║
║  │  12 frascos                                              │ ║
║  │                                                          │ ║
║  │  💰 Información Comercial                                │ ║
║  │  ────────────────────────────────────────────────────    │ ║
║  │                                                          │ ║
║  │  💵 PRECIO UNITARIO         📦 STOCK DISPONIBLE         │ ║
║  │  $18.00                     39 unidades                  │ ║
║  │                                                          │ ║
║  │  🧮 VALOR TOTAL EN STOCK    📊 ESTADO                   │ ║
║  │  $702.00                    ✅ Stock Óptimo             │ ║
║  │                                                          │ ║
║  ├──────────────────────────────────────────────────────────┤ ║
║  │  [← Volver]          [✏️ Editar Producto]  [🗑️ Eliminar] │ ║
║  └──────────────────────────────────────────────────────────┘ ║
║                                                                ║
╚════════════════════════════════════════════════════════════════╝
```

### Elementos Visuales

**Header del Card**
- Fondo con gradiente azul muy suave
- Badge "ID: 77" en azul
- Título grande del producto
- Botón "Editar" en naranja claro

**Secciones**
- Títulos de sección con iconos
- Separadores sutiles
- Grid de 2 columnas para datos

**Campos Destacados**
- Precio: Texto grande en azul
- Stock: Badge grande con color según cantidad
- Valor total: Texto grande en verde
- Estado: Badge con icono y color

**Footer**
- Fondo gris muy claro
- 3 botones: Volver (gris), Editar (azul), Eliminar (rojo claro)

---

## 🎨 Paleta de Colores Aplicada

### Colores Principales

```
┌─────────────────────────────────────────────────────────┐
│  AZUL PRINCIPAL (#0071e3)                               │
│  ████████████████████████████████████████████████████   │
│  • Botones principales                                  │
│  • Enlaces                                              │
│  • Iconos de información                                │
│  • Badges de categoría                                  │
└─────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────┐
│  NARANJA (#ff9500)                                      │
│  ████████████████████████████████████████████████████   │
│  • Botones de edición                                   │
│  • Iconos de edición                                    │
│  • Advertencias                                         │
│  • Stock medio                                          │
└─────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────┐
│  ROJO (#ff3b30)                                         │
│  ████████████████████████████████████████████████████   │
│  • Botones de eliminación                               │
│  • Iconos de eliminación                                │
│  • Errores                                              │
│  • Stock bajo/cero                                      │
└─────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────┐
│  VERDE (#34c759)                                        │
│  ████████████████████████████████████████████████████   │
│  • Mensajes de éxito                                    │
│  • Stock alto                                           │
│  • Estado positivo                                      │
│  • Valor total                                          │
└─────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────┐
│  GRIS OSCURO (#1d1d1f)                                  │
│  ████████████████████████████████████████████████████   │
│  • Texto principal                                      │
│  • Títulos                                              │
│  • Contenido                                            │
└─────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────┐
│  GRIS MEDIO (#6e6e73)                                   │
│  ████████████████████████████████████████████████████   │
│  • Texto secundario                                     │
│  • Subtítulos                                           │
│  • Labels                                               │
└─────────────────────────────────────────────────────────┘
```

---

## 🎭 Efectos Visuales

### 1. Transparencias y Blur

```
┌─────────────────────────────────────────────────────────┐
│  ANTES (Sin efecto)          DESPUÉS (Con efecto)      │
│                                                         │
│  ┌─────────────┐             ┌─────────────┐          │
│  │             │             │░░░░░░░░░░░░░│          │
│  │   Sólido    │             │░ Translúcido│          │
│  │             │             │░░░░░░░░░░░░░│          │
│  └─────────────┘             └─────────────┘          │
│                                                         │
│  background: white           background: rgba(255,     │
│                              255, 255, 0.8)            │
│                              backdrop-filter: blur(10px)│
└─────────────────────────────────────────────────────────┘
```

### 2. Bordes Redondeados

```
┌─────────────────────────────────────────────────────────┐
│  ANTES                       DESPUÉS                    │
│                                                         │
│  ┌─────────────┐             ╭─────────────╮          │
│  │   Cuadrado  │             │  Redondeado │          │
│  └─────────────┘             ╰─────────────╯          │
│                                                         │
│  border-radius: 0            border-radius: 12px       │
└─────────────────────────────────────────────────────────┘
```

### 3. Hover Effects

```
┌─────────────────────────────────────────────────────────┐
│  ESTADO NORMAL               ESTADO HOVER               │
│                                                         │
│  ┌─────────────┐             ┌─────────────┐          │
│  │   Botón     │             │   Botón     │ ↑        │
│  └─────────────┘             └─────────────┘          │
│                              (elevado + color intenso) │
│                                                         │
│  transform: none             transform: translateY(-1px)│
│  box-shadow: small           box-shadow: larger        │
└─────────────────────────────────────────────────────────┘
```

### 4. Transiciones

```
┌─────────────────────────────────────────────────────────┐
│  SIN TRANSICIÓN              CON TRANSICIÓN             │
│                                                         │
│  [Estado A] → [Estado B]     [Estado A] ~~~> [Estado B]│
│  (Cambio instantáneo)        (Cambio suave 0.2s)       │
│                                                         │
│  transition: none            transition: all 0.2s ease │
└─────────────────────────────────────────────────────────┘
```

---

## 📱 Responsive Breakpoints

### Desktop (> 768px)

```
┌────────────────────────────────────────────────────────┐
│  ┌──────────────────────────────────────────────────┐  │
│  │  Header: Logo + Menú horizontal                  │  │
│  └──────────────────────────────────────────────────┘  │
│                                                        │
│  ┌──────────────────────────────────────────────────┐  │
│  │  Título                    [Botón Nuevo]         │  │
│  └──────────────────────────────────────────────────┘  │
│                                                        │
│  ┌──────────────────────────────────────────────────┐  │
│  │  Tabla: 8 columnas visibles                      │  │
│  │  ┌────┬────────┬─────────┬─────────┬──────────┐  │  │
│  │  │ ID │ Nombre │ Categ.  │ Proveed │ Acciones │  │  │
│  │  └────┴────────┴─────────┴─────────┴──────────┘  │  │
│  └──────────────────────────────────────────────────┘  │
│                                                        │
│  Formularios: Grid 2 columnas                          │
│  ┌─────────────────────┬─────────────────────┐        │
│  │  Campo 1            │  Campo 2            │        │
│  └─────────────────────┴─────────────────────┘        │
└────────────────────────────────────────────────────────┘
```

### Mobile (< 768px)

```
┌──────────────────────┐
│  ┌────────────────┐  │
│  │ Logo  ☰ Menú   │  │
│  └────────────────┘  │
│                      │
│  ┌────────────────┐  │
│  │  Título        │  │
│  │  [Botón Nuevo] │  │
│  └────────────────┘  │
│                      │
│  ┌────────────────┐  │
│  │ Tabla: Scroll→ │  │
│  │ ┌──┬────┬────┐ │  │
│  │ │ID│Nom │Act │ │  │
│  │ └──┴────┴────┘ │  │
│  └────────────────┘  │
│                      │
│  Formularios: 1 col  │
│  ┌────────────────┐  │
│  │  Campo 1       │  │
│  ├────────────────┤  │
│  │  Campo 2       │  │
│  └────────────────┘  │
└──────────────────────┘
```

---

## ✨ Animaciones y Microinteracciones

### 1. Carga de Página
- Fade in suave de los elementos
- Transición de opacidad 0 → 1

### 2. Hover en Botones
- Elevación (translateY -1px)
- Intensificación de color
- Aparición de sombra
- Duración: 0.2s

### 3. Hover en Filas de Tabla
- Cambio de fondo a azul muy claro
- Transición suave
- Duración: 0.2s

### 4. Focus en Inputs
- Borde cambia de color
- Aparece sombra del color del borde
- Transición suave
- Duración: 0.2s

### 5. Mensajes de Feedback
- Aparecen con fade in
- Se pueden cerrar con fade out
- Colores según tipo (éxito/error)

---

## 🎯 Consistencia Visual

### Espaciado
- Padding interno: 1rem - 2rem
- Margin entre elementos: 1rem - 1.5rem
- Gap en grids: 1.5rem

### Tipografía
- Títulos principales: 2rem, peso 600
- Subtítulos: 1rem, peso 400
- Texto normal: 1rem, peso 400
- Labels: 0.95rem, peso 500
- Texto pequeño: 0.875rem

### Bordes
- Cards grandes: 16px
- Botones: 12px
- Inputs: 10px
- Badges: 8px

### Sombras
- Cards: 0 2px 16px rgba(0, 0, 0, 0.06)
- Hover: 0 4px 12px rgba(color, 0.3)
- Focus: 0 0 0 4px rgba(color, 0.1)

---

Esta guía visual te ayudará a entender cómo se verá la aplicación antes de ejecutarla. El diseño es limpio, profesional y sigue los principios de diseño de Apple.
