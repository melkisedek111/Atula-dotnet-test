using net8Test.Models;

namespace net8Test.DTO
{
    public class CategoryDTO
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public List<ProductCategory> ProductCategories { get; set; } = new List<ProductCategory>();
    }
}
