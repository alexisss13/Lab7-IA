-- Procedimientos Almacenados para la Base de Datos Negocios
USE Negocios;

-- Eliminar procedimientos si existen
DROP PROCEDURE IF EXISTS sp_InsertarProducto;
DROP PROCEDURE IF EXISTS sp_ListarProductos;
DROP PROCEDURE IF EXISTS sp_ListarCategorias;
DROP PROCEDURE IF EXISTS sp_ListarProveedores;

-- Procedimiento para insertar un nuevo producto
DELIMITER $$

CREATE PROCEDURE sp_InsertarProducto(
    IN p_NombreProducto VARCHAR(40),
    IN p_IdProveedor INT,
    IN p_IdCategoria INT,
    IN p_umedida VARCHAR(100),
    IN p_PrecioUnidad DECIMAL(10,0),
    IN p_UnidadesEnExistencia SMALLINT
)
BEGIN
    INSERT INTO PRODUCTO (NombreProducto, IdProveedor, IdCategoria, umedida, PrecioUnidad, UnidadesEnExistencia)
    VALUES (p_NombreProducto, p_IdProveedor, p_IdCategoria, p_umedida, p_PrecioUnidad, p_UnidadesEnExistencia);
    
    SELECT LAST_INSERT_ID() AS IdProducto;
END$$

-- Procedimiento para listar todos los productos
CREATE PROCEDURE sp_ListarProductos()
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
    ORDER BY p.IdProducto DESC;
END$$

-- Procedimiento para listar categorías
CREATE PROCEDURE sp_ListarCategorias()
BEGIN
    SELECT IdCategoria, NombreCategoria, Descripcion
    FROM CATEGORIA
    ORDER BY NombreCategoria;
END$$

-- Procedimiento para listar proveedores
CREATE PROCEDURE sp_ListarProveedores()
BEGIN
    SELECT IdProveedor, NombreCia, NombreContacto
    FROM PROVEEDOR
    ORDER BY NombreCia;
END$$

DELIMITER ;

-- ========================================
-- EJERCICIOS DE FILTRADO
-- ========================================

-- Ejercicio 1: Filtrado por campo de texto (Clientes)
DROP PROCEDURE IF EXISTS sp_FiltrarClientesPorNombre;

DELIMITER $

CREATE PROCEDURE sp_FiltrarClientesPorNombre(
    IN p_NombreCia VARCHAR(40)
)
BEGIN
    SELECT 
        c.IdCliente,
        c.NombreCia,
        c.Direccion,
        p.NombrePais,
        c.Telefono,
        c.Estado
    FROM CLIENTE c
    INNER JOIN PAIS p ON c.idpais = p.Idpais
    WHERE c.NombreCia LIKE CONCAT('%', p_NombreCia, '%')
    ORDER BY c.NombreCia;
END$

DELIMITER ;

-- Ejercicio 2: Filtrado por campo numérico (Products)
DROP PROCEDURE IF EXISTS sp_FiltrarProductosPorPrecio;

DELIMITER $

CREATE PROCEDURE sp_FiltrarProductosPorPrecio(
    IN p_PrecioMinimo DECIMAL(10,0)
)
BEGIN
    SELECT 
        p.IdProducto,
        p.NombreProducto,
        pr.NombreCia AS NombreProveedor,
        c.NombreCategoria,
        p.umedida,
        p.PrecioUnidad,
        p.UnidadesEnExistencia
    FROM PRODUCTO p
    INNER JOIN PROVEEDOR pr ON p.IdProveedor = pr.IdProveedor
    INNER JOIN CATEGORIA c ON p.IdCategoria = c.IdCategoria
    WHERE p.PrecioUnidad >= p_PrecioMinimo
    ORDER BY p.PrecioUnidad DESC;
END$

DELIMITER ;

-- Ejercicio 4: Filtrado por campo de fecha (Orders)
DROP PROCEDURE IF EXISTS sp_FiltrarPedidosPorFecha;

DELIMITER $

CREATE PROCEDURE sp_FiltrarPedidosPorFecha(
    IN p_FechaInicio DATETIME,
    IN p_FechaFin DATETIME
)
BEGIN
    SELECT 
        pe.IdPedido,
        c.NombreCia AS NombreCliente,
        CONCAT(e.NomEmpleado, ' ', e.ApeEmpleado) AS NombreEmpleado,
        pe.FechaPedido,
        pe.FechaEntrega,
        pe.FechaEnvio,
        pe.Cargo,
        pe.Destinatario,
        pe.PaisDestinatario
    FROM PEDIDO pe
    INNER JOIN CLIENTE c ON pe.IdCliente = c.IdCliente
    INNER JOIN EMPLEADO e ON pe.IdEmpleado = e.IdEmpleado
    WHERE pe.FechaPedido BETWEEN p_FechaInicio AND p_FechaFin
    ORDER BY pe.FechaPedido DESC;
END$

DELIMITER ;
