-- =============================================
-- Stored Procedure: sp_BuscarYOrdenarProductos
-- Descripción: Búsqueda avanzada y ordenamiento de productos
-- =============================================

DELIMITER $$

DROP PROCEDURE IF EXISTS sp_BuscarYOrdenarProductos$$

CREATE PROCEDURE sp_BuscarYOrdenarProductos(
    IN p_NombreProducto VARCHAR(100),
    IN p_IdCategoria INT,
    IN p_IdProveedor INT,
    IN p_PrecioMin DECIMAL(10,2),
    IN p_PrecioMax DECIMAL(10,2),
    IN p_StockMin INT,
    IN p_StockMax INT,
    IN p_OrdenarPor VARCHAR(50),
    IN p_Direccion VARCHAR(4)
)
BEGIN
    SET @sql = 'SELECT 
        p.IdProducto,
        p.NombreProducto,
        p.IdProveedor,
        pr.NombreCia AS NombreProveedor,
        p.IdCategoria,
        c.NombreCategoria,
        p.umedida,
        p.PrecioUnidad,
        p.UnidadesEnExistencia
    FROM Producto p
    INNER JOIN Proveedor pr ON p.IdProveedor = pr.IdProveedor
    INNER JOIN Categoria c ON p.IdCategoria = c.IdCategoria
    WHERE 1=1';
    
    -- Filtro por nombre
    IF p_NombreProducto IS NOT NULL AND p_NombreProducto != '' THEN
        SET @sql = CONCAT(@sql, ' AND p.NombreProducto LIKE ''%', p_NombreProducto, '%''');
    END IF;
    
    -- Filtro por categoría
    IF p_IdCategoria IS NOT NULL AND p_IdCategoria > 0 THEN
        SET @sql = CONCAT(@sql, ' AND p.IdCategoria = ', p_IdCategoria);
    END IF;
    
    -- Filtro por proveedor
    IF p_IdProveedor IS NOT NULL AND p_IdProveedor > 0 THEN
        SET @sql = CONCAT(@sql, ' AND p.IdProveedor = ', p_IdProveedor);
    END IF;
    
    -- Filtro por rango de precio
    IF p_PrecioMin IS NOT NULL AND p_PrecioMin > 0 THEN
        SET @sql = CONCAT(@sql, ' AND p.PrecioUnidad >= ', p_PrecioMin);
    END IF;
    
    IF p_PrecioMax IS NOT NULL AND p_PrecioMax > 0 THEN
        SET @sql = CONCAT(@sql, ' AND p.PrecioUnidad <= ', p_PrecioMax);
    END IF;
    
    -- Filtro por rango de stock
    IF p_StockMin IS NOT NULL THEN
        SET @sql = CONCAT(@sql, ' AND p.UnidadesEnExistencia >= ', p_StockMin);
    END IF;
    
    IF p_StockMax IS NOT NULL THEN
        SET @sql = CONCAT(@sql, ' AND p.UnidadesEnExistencia <= ', p_StockMax);
    END IF;
    
    -- Ordenamiento
    SET @ordenamiento = ' ORDER BY ';
    
    IF p_OrdenarPor IS NULL OR p_OrdenarPor = '' OR p_OrdenarPor = 'nombre' THEN
        SET @ordenamiento = CONCAT(@ordenamiento, 'p.NombreProducto');
    ELSEIF p_OrdenarPor = 'precio' THEN
        SET @ordenamiento = CONCAT(@ordenamiento, 'p.PrecioUnidad');
    ELSEIF p_OrdenarPor = 'stock' THEN
        SET @ordenamiento = CONCAT(@ordenamiento, 'p.UnidadesEnExistencia');
    ELSEIF p_OrdenarPor = 'categoria' THEN
        SET @ordenamiento = CONCAT(@ordenamiento, 'c.NombreCategoria');
    ELSEIF p_OrdenarPor = 'proveedor' THEN
        SET @ordenamiento = CONCAT(@ordenamiento, 'pr.NombreCia');
    ELSEIF p_OrdenarPor = 'id' THEN
        SET @ordenamiento = CONCAT(@ordenamiento, 'p.IdProducto');
    ELSE
        SET @ordenamiento = CONCAT(@ordenamiento, 'p.NombreProducto');
    END IF;
    
    -- Dirección de ordenamiento
    IF p_Direccion IS NULL OR p_Direccion = '' OR UPPER(p_Direccion) = 'ASC' THEN
        SET @ordenamiento = CONCAT(@ordenamiento, ' ASC');
    ELSE
        SET @ordenamiento = CONCAT(@ordenamiento, ' DESC');
    END IF;
    
    SET @sql = CONCAT(@sql, @ordenamiento);
    
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END$$

DELIMITER ;
