using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using Lab7_IA.Models;
using System.Data;

namespace Lab7_IA.Controllers
{
    public class ProductosController : Controller
    {
        private readonly IConfiguration _configuration;
        private readonly string _connectionString;
        private readonly ILogger<ProductosController> _logger;

        public ProductosController(IConfiguration configuration, ILogger<ProductosController> logger)
        {
            _configuration = configuration;
            _connectionString = _configuration.GetConnectionString("NegociosDB") ?? "";
            _logger = logger;
        }

        // GET: Productos
        public IActionResult Index(
            string nombreProducto, 
            int? idCategoria, 
            int? idProveedor,
            decimal? precioMin,
            decimal? precioMax,
            int? stockMin,
            int? stockMax,
            string ordenarPor = "nombre",
            string direccion = "ASC")
        {
            List<Producto> productos = new List<Producto>();

            try
            {
                using (MySqlConnection conn = new MySqlConnection(_connectionString))
                {
                    conn.Open();
                    
                    // Usar el nuevo stored procedure con ordenamiento
                    using (MySqlCommand cmd = new MySqlCommand("sp_BuscarYOrdenarProductos", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("p_NombreProducto", nombreProducto ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("p_IdCategoria", idCategoria ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("p_IdProveedor", idProveedor ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("p_PrecioMin", precioMin ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("p_PrecioMax", precioMax ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("p_StockMin", stockMin ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("p_StockMax", stockMax ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("p_OrdenarPor", ordenarPor ?? "nombre");
                        cmd.Parameters.AddWithValue("p_Direccion", direccion ?? "ASC");

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                productos.Add(new Producto
                                {
                                    IdProducto = reader.GetInt32("IdProducto"),
                                    NombreProducto = reader.GetString("NombreProducto"),
                                    IdProveedor = reader.GetInt32("IdProveedor"),
                                    NombreProveedor = reader.GetString("NombreProveedor"),
                                    IdCategoria = reader.GetInt32("IdCategoria"),
                                    NombreCategoria = reader.GetString("NombreCategoria"),
                                    Umedida = reader.IsDBNull(reader.GetOrdinal("umedida")) ? null : reader.GetString("umedida"),
                                    PrecioUnidad = reader.GetDecimal("PrecioUnidad"),
                                    UnidadesEnExistencia = reader.GetInt16("UnidadesEnExistencia")
                                });
                            }
                        }
                    }
                }

                // Cargar categorías y proveedores para los filtros
                CargarCategoriasYProveedoresParaFiltro();
                
                // Mantener los valores de búsqueda y ordenamiento
                ViewBag.NombreProducto = nombreProducto;
                ViewBag.IdCategoriaFiltro = idCategoria;
                ViewBag.IdProveedorFiltro = idProveedor;
                ViewBag.PrecioMin = precioMin;
                ViewBag.PrecioMax = precioMax;
                ViewBag.StockMin = stockMin;
                ViewBag.StockMax = stockMax;
                ViewBag.OrdenarPor = ordenarPor;
                ViewBag.Direccion = direccion;
            }
            catch (MySqlException ex)
            {
                _logger.LogError(ex, "Error de base de datos al cargar productos");
                ViewBag.Error = $"Error de conexión a la base de datos: {ex.Message}";
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error inesperado al cargar productos");
                ViewBag.Error = $"Error inesperado: {ex.Message}";
            }

            return View(productos);
        }

        // GET: Productos/Create
        public IActionResult Create()
        {
            CargarListasCategoriaProveedor();
            return View();
        }

        // POST: Productos/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(Producto producto)
        {
            // Validaciones adicionales
            if (string.IsNullOrWhiteSpace(producto.NombreProducto))
            {
                ModelState.AddModelError("NombreProducto", "El nombre del producto es requerido");
            }

            if (producto.PrecioUnidad <= 0)
            {
                ModelState.AddModelError("PrecioUnidad", "El precio debe ser mayor a cero");
            }

            if (producto.UnidadesEnExistencia < 0)
            {
                ModelState.AddModelError("UnidadesEnExistencia", "El stock no puede ser negativo");
            }

            if (!ModelState.IsValid)
            {
                CargarListasCategoriaProveedor();
                return View(producto);
            }

            try
            {
                using (MySqlConnection conn = new MySqlConnection(_connectionString))
                {
                    conn.Open();
                    using (MySqlCommand cmd = new MySqlCommand("sp_InsertarProducto", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("p_NombreProducto", producto.NombreProducto.Trim());
                        cmd.Parameters.AddWithValue("p_IdProveedor", producto.IdProveedor);
                        cmd.Parameters.AddWithValue("p_IdCategoria", producto.IdCategoria);
                        cmd.Parameters.AddWithValue("p_umedida", producto.Umedida ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("p_PrecioUnidad", producto.PrecioUnidad);
                        cmd.Parameters.AddWithValue("p_UnidadesEnExistencia", producto.UnidadesEnExistencia);

                        cmd.ExecuteNonQuery();
                    }
                }

                TempData["Success"] = "Producto creado exitosamente";
                _logger.LogInformation($"Producto '{producto.NombreProducto}' creado exitosamente");
                return RedirectToAction(nameof(Index));
            }
            catch (MySqlException ex)
            {
                _logger.LogError(ex, "Error de base de datos al crear producto");
                ViewBag.Error = $"Error al crear producto: {ex.Message}";
                CargarListasCategoriaProveedor();
                return View(producto);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error inesperado al crear producto");
                ViewBag.Error = $"Error inesperado: {ex.Message}";
                CargarListasCategoriaProveedor();
                return View(producto);
            }
        }

        // GET: Productos/Edit/5
        public IActionResult Edit(int id)
        {
            Producto? producto = null;

            try
            {
                using (MySqlConnection conn = new MySqlConnection(_connectionString))
                {
                    conn.Open();
                    using (MySqlCommand cmd = new MySqlCommand("sp_ObtenerProductoPorId", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("p_IdProducto", id);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                producto = new Producto
                                {
                                    IdProducto = reader.GetInt32("IdProducto"),
                                    NombreProducto = reader.GetString("NombreProducto"),
                                    IdProveedor = reader.GetInt32("IdProveedor"),
                                    NombreProveedor = reader.GetString("NombreProveedor"),
                                    IdCategoria = reader.GetInt32("IdCategoria"),
                                    NombreCategoria = reader.GetString("NombreCategoria"),
                                    Umedida = reader.IsDBNull(reader.GetOrdinal("umedida")) ? null : reader.GetString("umedida"),
                                    PrecioUnidad = reader.GetDecimal("PrecioUnidad"),
                                    UnidadesEnExistencia = reader.GetInt16("UnidadesEnExistencia")
                                };
                            }
                        }
                    }
                }

                if (producto == null)
                {
                    return NotFound();
                }

                CargarListasCategoriaProveedor();
                return View(producto);
            }
            catch (Exception ex)
            {
                ViewBag.Error = $"Error al cargar producto: {ex.Message}";
                return RedirectToAction(nameof(Index));
            }
        }

        // POST: Productos/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(int id, Producto producto)
        {
            if (id != producto.IdProducto)
            {
                return BadRequest();
            }

            // Validaciones adicionales
            if (string.IsNullOrWhiteSpace(producto.NombreProducto))
            {
                ModelState.AddModelError("NombreProducto", "El nombre del producto es requerido");
            }

            if (producto.PrecioUnidad <= 0)
            {
                ModelState.AddModelError("PrecioUnidad", "El precio debe ser mayor a cero");
            }

            if (producto.UnidadesEnExistencia < 0)
            {
                ModelState.AddModelError("UnidadesEnExistencia", "El stock no puede ser negativo");
            }

            if (!ModelState.IsValid)
            {
                CargarListasCategoriaProveedor();
                return View(producto);
            }

            try
            {
                using (MySqlConnection conn = new MySqlConnection(_connectionString))
                {
                    conn.Open();
                    using (MySqlCommand cmd = new MySqlCommand("sp_ActualizarProducto", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("p_IdProducto", producto.IdProducto);
                        cmd.Parameters.AddWithValue("p_NombreProducto", producto.NombreProducto.Trim());
                        cmd.Parameters.AddWithValue("p_IdProveedor", producto.IdProveedor);
                        cmd.Parameters.AddWithValue("p_IdCategoria", producto.IdCategoria);
                        cmd.Parameters.AddWithValue("p_umedida", producto.Umedida ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("p_PrecioUnidad", producto.PrecioUnidad);
                        cmd.Parameters.AddWithValue("p_UnidadesEnExistencia", producto.UnidadesEnExistencia);

                        cmd.ExecuteNonQuery();
                    }
                }

                TempData["Success"] = "Producto actualizado exitosamente";
                _logger.LogInformation($"Producto ID {producto.IdProducto} actualizado exitosamente");
                return RedirectToAction(nameof(Index));
            }
            catch (MySqlException ex)
            {
                _logger.LogError(ex, "Error de base de datos al actualizar producto");
                ViewBag.Error = $"Error al actualizar producto: {ex.Message}";
                CargarListasCategoriaProveedor();
                return View(producto);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error inesperado al actualizar producto");
                ViewBag.Error = $"Error inesperado: {ex.Message}";
                CargarListasCategoriaProveedor();
                return View(producto);
            }
        }

        // GET: Productos/Delete/5
        public IActionResult Delete(int id)
        {
            Producto? producto = null;

            try
            {
                using (MySqlConnection conn = new MySqlConnection(_connectionString))
                {
                    conn.Open();
                    using (MySqlCommand cmd = new MySqlCommand("sp_ObtenerProductoPorId", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("p_IdProducto", id);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                producto = new Producto
                                {
                                    IdProducto = reader.GetInt32("IdProducto"),
                                    NombreProducto = reader.GetString("NombreProducto"),
                                    IdProveedor = reader.GetInt32("IdProveedor"),
                                    NombreProveedor = reader.GetString("NombreProveedor"),
                                    IdCategoria = reader.GetInt32("IdCategoria"),
                                    NombreCategoria = reader.GetString("NombreCategoria"),
                                    Umedida = reader.IsDBNull(reader.GetOrdinal("umedida")) ? null : reader.GetString("umedida"),
                                    PrecioUnidad = reader.GetDecimal("PrecioUnidad"),
                                    UnidadesEnExistencia = reader.GetInt16("UnidadesEnExistencia")
                                };
                            }
                        }
                    }
                }

                if (producto == null)
                {
                    return NotFound();
                }

                return View(producto);
            }
            catch (Exception ex)
            {
                ViewBag.Error = $"Error al cargar producto: {ex.Message}";
                return RedirectToAction(nameof(Index));
            }
        }

        // POST: Productos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public IActionResult DeleteConfirmed(int id)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(_connectionString))
                {
                    conn.Open();
                    using (MySqlCommand cmd = new MySqlCommand("sp_EliminarProducto", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("p_IdProducto", id);

                        cmd.ExecuteNonQuery();
                    }
                }

                TempData["Success"] = "Producto eliminado exitosamente";
                _logger.LogInformation($"Producto ID {id} eliminado exitosamente");
                return RedirectToAction(nameof(Index));
            }
            catch (MySqlException ex)
            {
                _logger.LogError(ex, "Error de base de datos al eliminar producto");
                TempData["Error"] = $"Error al eliminar producto: No se puede eliminar porque está relacionado con otros registros";
                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error inesperado al eliminar producto");
                TempData["Error"] = $"Error inesperado al eliminar producto: {ex.Message}";
                return RedirectToAction(nameof(Index));
            }
        }

        // GET: Productos/Details/5
        public IActionResult Details(int id)
        {
            Producto? producto = null;

            try
            {
                using (MySqlConnection conn = new MySqlConnection(_connectionString))
                {
                    conn.Open();
                    using (MySqlCommand cmd = new MySqlCommand("sp_ObtenerProductoPorId", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("p_IdProducto", id);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                producto = new Producto
                                {
                                    IdProducto = reader.GetInt32("IdProducto"),
                                    NombreProducto = reader.GetString("NombreProducto"),
                                    IdProveedor = reader.GetInt32("IdProveedor"),
                                    NombreProveedor = reader.GetString("NombreProveedor"),
                                    IdCategoria = reader.GetInt32("IdCategoria"),
                                    NombreCategoria = reader.GetString("NombreCategoria"),
                                    Umedida = reader.IsDBNull(reader.GetOrdinal("umedida")) ? null : reader.GetString("umedida"),
                                    PrecioUnidad = reader.GetDecimal("PrecioUnidad"),
                                    UnidadesEnExistencia = reader.GetInt16("UnidadesEnExistencia")
                                };
                            }
                        }
                    }
                }

                if (producto == null)
                {
                    return NotFound();
                }

                return View(producto);
            }
            catch (Exception ex)
            {
                ViewBag.Error = $"Error al cargar producto: {ex.Message}";
                return RedirectToAction(nameof(Index));
            }
        }

        // Método auxiliar para cargar listas de categorías y proveedores
        private void CargarListasCategoriaProveedor()
        {
            List<Categoria> categorias = new List<Categoria>();
            List<Proveedor> proveedores = new List<Proveedor>();

            try
            {
                using (MySqlConnection conn = new MySqlConnection(_connectionString))
                {
                    conn.Open();

                    // Cargar categorías
                    using (MySqlCommand cmd = new MySqlCommand("sp_ListarCategorias", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                categorias.Add(new Categoria
                                {
                                    IdCategoria = reader.GetInt32("IdCategoria"),
                                    NombreCategoria = reader.GetString("NombreCategoria")
                                });
                            }
                        }
                    }

                    // Cargar proveedores
                    using (MySqlCommand cmd = new MySqlCommand("sp_ListarProveedores", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                proveedores.Add(new Proveedor
                                {
                                    IdProveedor = reader.GetInt32("IdProveedor"),
                                    NombreCia = reader.GetString("NombreCia")
                                });
                            }
                        }
                    }
                }

                ViewBag.Categorias = categorias;
                ViewBag.Proveedores = proveedores;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error al cargar listas de categorías y proveedores");
                ViewBag.Error = $"Error al cargar listas: {ex.Message}";
                ViewBag.Categorias = new List<Categoria>();
                ViewBag.Proveedores = new List<Proveedor>();
            }
        }

        // Método auxiliar para cargar categorías (para filtro)
        private void CargarCategorias()
        {
            List<Categoria> categorias = new List<Categoria>();

            try
            {
                using (MySqlConnection conn = new MySqlConnection(_connectionString))
                {
                    conn.Open();
                    using (MySqlCommand cmd = new MySqlCommand("sp_ListarCategorias", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                categorias.Add(new Categoria
                                {
                                    IdCategoria = reader.GetInt32("IdCategoria"),
                                    NombreCategoria = reader.GetString("NombreCategoria")
                                });
                            }
                        }
                    }
                }

                ViewBag.CategoriasParaFiltro = categorias;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error al cargar categorías para filtro");
                ViewBag.CategoriasParaFiltro = new List<Categoria>();
            }
        }

        // Método auxiliar para cargar categorías y proveedores para filtros
        private void CargarCategoriasYProveedoresParaFiltro()
        {
            List<Categoria> categorias = new List<Categoria>();
            List<Proveedor> proveedores = new List<Proveedor>();

            try
            {
                using (MySqlConnection conn = new MySqlConnection(_connectionString))
                {
                    conn.Open();

                    // Cargar categorías
                    using (MySqlCommand cmd = new MySqlCommand("sp_ListarCategorias", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                categorias.Add(new Categoria
                                {
                                    IdCategoria = reader.GetInt32("IdCategoria"),
                                    NombreCategoria = reader.GetString("NombreCategoria")
                                });
                            }
                        }
                    }

                    // Cargar proveedores
                    using (MySqlCommand cmd = new MySqlCommand("sp_ListarProveedores", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                proveedores.Add(new Proveedor
                                {
                                    IdProveedor = reader.GetInt32("IdProveedor"),
                                    NombreCia = reader.GetString("NombreCia")
                                });
                            }
                        }
                    }
                }

                ViewBag.CategoriasParaFiltro = categorias;
                ViewBag.ProveedoresParaFiltro = proveedores;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error al cargar listas para filtros");
                ViewBag.CategoriasParaFiltro = new List<Categoria>();
                ViewBag.ProveedoresParaFiltro = new List<Proveedor>();
            }
        }
    }
}
