using net8Test.Models;

namespace net8Test.DTO
{
    public class ProductCategoryDTO
    {
        public int ProductId { get; set; }
        public Product Product { get; set; }

        public int CategoryId { get; set; }
        public Category Category { get; set; }
    }
}
