-- ========================================
-- STORED PROCEDURES CRUD PARA PRODUCTOS
-- ========================================
USE Negocios;

-- Eliminar procedimientos si existen
DROP PROCEDURE IF EXISTS sp_ObtenerProductoPorId;
DROP PROCEDURE IF EXISTS sp_ActualizarProducto;
DROP PROCEDURE IF EXISTS sp_EliminarProducto;
DROP PROCEDURE IF EXISTS sp_BuscarProductos;

-- ========================================
-- 1. OBTENER PRODUCTO POR ID
-- ========================================
DELIMITER $

CREATE PROCEDURE sp_ObtenerProductoPorId(
    IN p_IdProducto INT
)
BEGIN
    SELECT 
        p.IdProducto,
        p.NombreProducto,
        p.IdProveedor,
        pr.NombreCia AS NombreProveedor,
        p.IdCategoria,
        c.NombreCategoria,
        p.umedida,
        p.PrecioUnidad,
        p.UnidadesEnExistencia
    FROM PRODUCTO p
    INNER JOIN PROVEEDOR pr ON p.IdProveedor = pr.IdProveedor
    INNER JOIN CATEGORIA c ON p.IdCategoria = c.IdCategoria
    WHERE p.IdProducto = p_IdProducto;
END$

-- ========================================
-- 2. ACTUALIZAR PRODUCTO
-- ========================================
CREATE PROCEDURE sp_ActualizarProducto(
    IN p_IdProducto INT,
    IN p_NombreProducto VARCHAR(40),
    IN p_IdProveedor INT,
    IN p_IdCategoria INT,
    IN p_umedida VARCHAR(100),
    IN p_PrecioUnidad DECIMAL(10,0),
    IN p_UnidadesEnExistencia SMALLINT
)
BEGIN
    UPDATE PRODUCTO
    SET 
        NombreProducto = p_NombreProducto,
        IdProveedor = p_IdProveedor,
        IdCategoria = p_IdCategoria,
        umedida = p_umedida,
        PrecioUnidad = p_PrecioUnidad,
        UnidadesEnExistencia = p_UnidadesEnExistencia
    WHERE IdProducto = p_IdProducto;
    
    SELECT ROW_COUNT() AS FilasAfectadas;
END$

-- ========================================
-- 3. ELIMINAR PRODUCTO
-- ========================================
CREATE PROCEDURE sp_EliminarProducto(
    IN p_IdProducto INT
)
BEGIN
    DELETE FROM PRODUCTO
    WHERE IdProducto = p_IdProducto;
    
    SELECT ROW_COUNT() AS FilasAfectadas;
END$

-- ========================================
-- 4. BUSCAR PRODUCTOS (Por nombre y/o categoría)
-- ========================================
CREATE PROCEDURE sp_BuscarProductos(
    IN p_NombreProducto VARCHAR(40),
    IN p_IdCategoria INT
)
BEGIN
    SELECT 
        p.IdProducto,
        p.NombreProducto,
        p.IdProveedor,
        pr.NombreCia AS NombreProveedor,
        p.IdCategoria,
        c.NombreCategoria,
        p.umedida,
        p.PrecioUnidad,
        p.UnidadesEnExistencia
    FROM PRODUCTO p
    INNER JOIN PROVEEDOR pr ON p.IdProveedor = pr.IdProveedor
    INNER JOIN CATEGORIA c ON p.IdCategoria = c.IdCategoria
    WHERE 
        (p_NombreProducto IS NULL OR p_NombreProducto = '' OR p.NombreProducto LIKE CONCAT('%', p_NombreProducto, '%'))
        AND (p_IdCategoria IS NULL OR p_IdCategoria = 0 OR p.IdCategoria = p_IdCategoria)
    ORDER BY p.IdProducto DESC;
END$

DELIMITER ;
