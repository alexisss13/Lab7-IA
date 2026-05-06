-- =============================================
-- EJEMPLOS DE PRUEBAS SQL
-- Stored Procedure: sp_BuscarYOrdenarProductos
-- =============================================

-- =============================================
-- PRUEBAS BÁSICAS
-- =============================================

-- 1. Listar todos los productos ordenados por nombre (ASC)
CALL sp_BuscarYOrdenarProductos(NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'nombre', 'ASC');

-- 2. Listar todos los productos ordenados por nombre (DESC)
CALL sp_BuscarYOrdenarProductos(NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'nombre', 'DESC');

-- 3. Listar todos los productos ordenados por precio (ASC)
CALL sp_BuscarYOrdenarProductos(NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'precio', 'ASC');

-- 4. Listar todos los productos ordenados por precio (DESC)
CALL sp_BuscarYOrdenarProductos(NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'precio', 'DESC');

-- 5. Listar todos los productos ordenados por stock (ASC)
CALL sp_BuscarYOrdenarProductos(NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'stock', 'ASC');

-- 6. Listar todos los productos ordenados por stock (DESC)
CALL sp_BuscarYOrdenarProductos(NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'stock', 'DESC');

-- =============================================
-- PRUEBAS DE BÚSQUEDA POR NOMBRE
-- =============================================

-- 7. Buscar productos que contengan "laptop"
CALL sp_BuscarYOrdenarProductos('laptop', NULL, NULL, NULL, NULL, NULL, NULL, 'nombre', 'ASC');

-- 8. Buscar productos que contengan "mouse"
CALL sp_BuscarYOrdenarProductos('mouse', NULL, NULL, NULL, NULL, NULL, NULL, 'nombre', 'ASC');

-- 9. Buscar productos que contengan "teclado"
CALL sp_BuscarYOrdenarProductos('teclado', NULL, NULL, NULL, NULL, NULL, NULL, 'precio', 'ASC');

-- =============================================
-- PRUEBAS DE FILTRO POR CATEGORÍA
-- =============================================

-- 10. Filtrar productos de categoría 1 (ajustar según tu BD)
CALL sp_BuscarYOrdenarProductos(NULL, 1, NULL, NULL, NULL, NULL, NULL, 'nombre', 'ASC');

-- 11. Filtrar productos de categoría 2 ordenados por precio
CALL sp_BuscarYOrdenarProductos(NULL, 2, NULL, NULL, NULL, NULL, NULL, 'precio', 'DESC');

-- 12. Filtrar productos de categoría 3 ordenados por stock
CALL sp_BuscarYOrdenarProductos(NULL, 3, NULL, NULL, NULL, NULL, NULL, 'stock', 'ASC');

-- =============================================
-- PRUEBAS DE FILTRO POR PROVEEDOR
-- =============================================

-- 13. Filtrar productos de proveedor 1 (ajustar según tu BD)
CALL sp_BuscarYOrdenarProductos(NULL, NULL, 1, NULL, NULL, NULL, NULL, 'nombre', 'ASC');

-- 14. Filtrar productos de proveedor 2 ordenados por precio
CALL sp_BuscarYOrdenarProductos(NULL, NULL, 2, NULL, NULL, NULL, NULL, 'precio', 'ASC');

-- =============================================
-- PRUEBAS DE RANGO DE PRECIO
-- =============================================

-- 15. Productos con precio entre $10 y $100
CALL sp_BuscarYOrdenarProductos(NULL, NULL, NULL, 10.00, 100.00, NULL, NULL, 'precio', 'ASC');

-- 16. Productos con precio entre $100 y $500
CALL sp_BuscarYOrdenarProductos(NULL, NULL, NULL, 100.00, 500.00, NULL, NULL, 'precio', 'ASC');

-- 17. Productos con precio mayor a $500
CALL sp_BuscarYOrdenarProductos(NULL, NULL, NULL, 500.00, NULL, NULL, NULL, 'precio', 'DESC');

-- 18. Productos con precio menor a $50
CALL sp_BuscarYOrdenarProductos(NULL, NULL, NULL, NULL, 50.00, NULL, NULL, 'precio', 'ASC');

-- =============================================
-- PRUEBAS DE RANGO DE STOCK
-- =============================================

-- 19. Productos con stock entre 10 y 50
CALL sp_BuscarYOrdenarProductos(NULL, NULL, NULL, NULL, NULL, 10, 50, 'stock', 'ASC');

-- 20. Productos con stock mayor a 100
CALL sp_BuscarYOrdenarProductos(NULL, NULL, NULL, NULL, NULL, 100, NULL, 'stock', 'DESC');

-- 21. Productos con stock menor a 20 (bajo stock)
CALL sp_BuscarYOrdenarProductos(NULL, NULL, NULL, NULL, NULL, NULL, 20, 'stock', 'ASC');

-- 22. Productos con stock entre 50 y 200
CALL sp_BuscarYOrdenarProductos(NULL, NULL, NULL, NULL, NULL, 50, 200, 'nombre', 'ASC');

-- =============================================
-- PRUEBAS COMBINADAS
-- =============================================

-- 23. Buscar "laptop" en categoría 1 con precio entre $500 y $1500
CALL sp_BuscarYOrdenarProductos('laptop', 1, NULL, 500.00, 1500.00, NULL, NULL, 'precio', 'ASC');

-- 24. Productos de proveedor 1 con stock bajo (< 20) ordenados por stock
CALL sp_BuscarYOrdenarProductos(NULL, NULL, 1, NULL, NULL, NULL, 20, 'stock', 'ASC');

-- 25. Productos de categoría 2 con precio < $100 ordenados por nombre
CALL sp_BuscarYOrdenarProductos(NULL, 2, NULL, NULL, 100.00, NULL, NULL, 'nombre', 'ASC');

-- 26. Buscar "mouse" con precio entre $20 y $80 ordenado por precio descendente
CALL sp_BuscarYOrdenarProductos('mouse', NULL, NULL, 20.00, 80.00, NULL, NULL, 'precio', 'DESC');

-- 27. Productos de proveedor 2, categoría 3, con stock > 50
CALL sp_BuscarYOrdenarProductos(NULL, 3, 2, NULL, NULL, 50, NULL, 'stock', 'DESC');

-- 28. Buscar "teclado" de cualquier proveedor con precio < $150 y stock > 10
CALL sp_BuscarYOrdenarProductos('teclado', NULL, NULL, NULL, 150.00, 10, NULL, 'precio', 'ASC');

-- =============================================
-- PRUEBAS DE ORDENAMIENTO POR DIFERENTES CAMPOS
-- =============================================

-- 29. Todos los productos ordenados por ID
CALL sp_BuscarYOrdenarProductos(NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'id', 'ASC');

-- 30. Todos los productos ordenados por categoría
CALL sp_BuscarYOrdenarProductos(NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'categoria', 'ASC');

-- 31. Todos los productos ordenados por proveedor
CALL sp_BuscarYOrdenarProductos(NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'proveedor', 'ASC');

-- =============================================
-- PRUEBAS DE CASOS EXTREMOS
-- =============================================

-- 32. Productos con precio exactamente $100
CALL sp_BuscarYOrdenarProductos(NULL, NULL, NULL, 100.00, 100.00, NULL, NULL, 'nombre', 'ASC');

-- 33. Productos con stock exactamente 50
CALL sp_BuscarYOrdenarProductos(NULL, NULL, NULL, NULL, NULL, 50, 50, 'nombre', 'ASC');

-- 34. Productos muy caros (> $1000) con bajo stock (< 10)
CALL sp_BuscarYOrdenarProductos(NULL, NULL, NULL, 1000.00, NULL, NULL, 10, 'precio', 'DESC');

-- 35. Productos muy baratos (< $10) con alto stock (> 100)
CALL sp_BuscarYOrdenarProductos(NULL, NULL, NULL, NULL, 10.00, 100, NULL, 'stock', 'DESC');

-- =============================================
-- PRUEBAS DE ANÁLISIS DE NEGOCIO
-- =============================================

-- 36. Top productos más caros
CALL sp_BuscarYOrdenarProductos(NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'precio', 'DESC');

-- 37. Productos con mayor stock (inventario alto)
CALL sp_BuscarYOrdenarProductos(NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'stock', 'DESC');

-- 38. Productos con menor stock (necesitan reabastecimiento)
CALL sp_BuscarYOrdenarProductos(NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'stock', 'ASC');

-- 39. Productos de rango medio ($50-$200) ordenados por popularidad (stock descendente)
CALL sp_BuscarYOrdenarProductos(NULL, NULL, NULL, 50.00, 200.00, NULL, NULL, 'stock', 'DESC');

-- 40. Productos premium (> $500) de un proveedor específico
CALL sp_BuscarYOrdenarProductos(NULL, NULL, 1, 500.00, NULL, NULL, NULL, 'precio', 'DESC');

-- =============================================
-- VERIFICACIÓN DE RESULTADOS
-- =============================================

-- Contar productos por categoría
SELECT c.NombreCategoria, COUNT(*) as TotalProductos
FROM Producto p
INNER JOIN Categoria c ON p.IdCategoria = c.IdCategoria
GROUP BY c.NombreCategoria
ORDER BY TotalProductos DESC;

-- Contar productos por proveedor
SELECT pr.NombreCia, COUNT(*) as TotalProductos
FROM Producto p
INNER JOIN Proveedor pr ON p.IdProveedor = pr.IdProveedor
GROUP BY pr.NombreCia
ORDER BY TotalProductos DESC;

-- Estadísticas de precio
SELECT 
    MIN(PrecioUnidad) as PrecioMinimo,
    MAX(PrecioUnidad) as PrecioMaximo,
    AVG(PrecioUnidad) as PrecioPromedio,
    COUNT(*) as TotalProductos
FROM Producto;

-- Estadísticas de stock
SELECT 
    MIN(UnidadesEnExistencia) as StockMinimo,
    MAX(UnidadesEnExistencia) as StockMaximo,
    AVG(UnidadesEnExistencia) as StockPromedio,
    SUM(UnidadesEnExistencia) as StockTotal
FROM Producto;

-- Productos con bajo stock (alerta)
SELECT 
    p.IdProducto,
    p.NombreProducto,
    p.UnidadesEnExistencia,
    c.NombreCategoria,
    pr.NombreCia
FROM Producto p
INNER JOIN Categoria c ON p.IdCategoria = c.IdCategoria
INNER JOIN Proveedor pr ON p.IdProveedor = pr.IdProveedor
WHERE p.UnidadesEnExistencia < 20
ORDER BY p.UnidadesEnExistencia ASC;

-- Productos más caros por categoría
SELECT 
    c.NombreCategoria,
    p.NombreProducto,
    p.PrecioUnidad,
    p.UnidadesEnExistencia
FROM Producto p
INNER JOIN Categoria c ON p.IdCategoria = c.IdCategoria
WHERE p.PrecioUnidad = (
    SELECT MAX(p2.PrecioUnidad)
    FROM Producto p2
    WHERE p2.IdCategoria = p.IdCategoria
)
ORDER BY c.NombreCategoria;

-- =============================================
-- NOTAS DE USO
-- =============================================

/*
PARÁMETROS DEL STORED PROCEDURE:
1. p_NombreProducto (VARCHAR) - Búsqueda parcial por nombre
2. p_IdCategoria (INT) - Filtro por categoría
3. p_IdProveedor (INT) - Filtro por proveedor
4. p_PrecioMin (DECIMAL) - Precio mínimo
5. p_PrecioMax (DECIMAL) - Precio máximo
6. p_StockMin (INT) - Stock mínimo
7. p_StockMax (INT) - Stock máximo
8. p_OrdenarPor (VARCHAR) - Campo de ordenamiento
   Valores: 'id', 'nombre', 'precio', 'stock', 'categoria', 'proveedor'
9. p_Direccion (VARCHAR) - Dirección de ordenamiento
   Valores: 'ASC', 'DESC'

TIPS:
- Usa NULL para parámetros que no quieres filtrar
- Combina múltiples filtros para búsquedas específicas
- El ordenamiento por defecto es por nombre ASC
- Los rangos son inclusivos (>= y <=)
*/

-- =============================================
-- FIN DE EJEMPLOS
-- =============================================
