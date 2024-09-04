using Microsoft.AspNetCore.Mvc.Rendering;

namespace net8Test.Types
{
    public class ProductViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Sku { get; set; }

        // This property will hold the selected categories' IDs
        public List<int> SelectedCategoryIds { get; set; } = new List<int>();

        // This will hold the list of categories for the ListBox
        public List<SelectListItem> Categories { get; set; } = new List<SelectListItem>();
    }
}
