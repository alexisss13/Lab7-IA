using System.ComponentModel.DataAnnotations;

namespace Lab7_IA.Models
{
    public class Producto
    {
        public int IdProducto { get; set; }

        [Required(ErrorMessage = "El nombre del producto es requerido")]
        [StringLength(40, ErrorMessage = "El nombre no puede exceder 40 caracteres")]
        [Display(Name = "Nombre del Producto")]
        public string NombreProducto { get; set; } = string.Empty;

        [Required(ErrorMessage = "Debe seleccionar un proveedor")]
        [Display(Name = "Proveedor")]
        public int IdProveedor { get; set; }
        
        public string? NombreProveedor { get; set; }

        [Required(ErrorMessage = "Debe seleccionar una categoría")]
        [Display(Name = "Categoría")]
        public int IdCategoria { get; set; }
        
        public string? NombreCategoria { get; set; }

        [StringLength(100, ErrorMessage = "La unidad de medida no puede exceder 100 caracteres")]
        [Display(Name = "Unidad de Medida")]
        public string? Umedida { get; set; }

        [Required(ErrorMessage = "El precio es requerido")]
        [Range(0.01, 999999999, ErrorMessage = "El precio debe ser mayor a 0")]
        [Display(Name = "Precio Unitario")]
        public decimal PrecioUnidad { get; set; }

        [Required(ErrorMessage = "El stock es requerido")]
        [Range(0, 32767, ErrorMessage = "El stock debe estar entre 0 y 32767")]
        [Display(Name = "Stock")]
        public short UnidadesEnExistencia { get; set; }
    }
}
