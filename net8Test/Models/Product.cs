using System.ComponentModel.DataAnnotations.Schema;

namespace net8Test.Models
{
    public class Product
    {
        public int Id { get; set; }
        public string Sku { get; set; }
        public string Name { get; set; }

        // Navigation property
        public List<ProductCategory> ProductCategories { get; set; } = new List<ProductCategory>();
    }
}
