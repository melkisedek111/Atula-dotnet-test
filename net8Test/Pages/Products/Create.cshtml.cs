using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using net8Test.Context;
using net8Test.Models;
using net8Test.Types;

namespace net8Test.Pages.Products
{
    public class CreateModel : PageModel
    {
        private readonly net8Test.Context.DatabaseContext _context;

        public CreateModel(net8Test.Context.DatabaseContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
            Product = new ProductViewModel
            {
                Categories = _context.Categories.Select(c => new SelectListItem
                {
                    Value = c.Id.ToString(),
                    Text = c.Name
                }).ToList()
            };
            return Page();
        }

        [BindProperty]
        public ProductViewModel Product { get; set; }

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
            var qwe = Product;

            if (!ModelState.IsValid)
            {
                Product.Categories = _context.Categories.Select(c => new SelectListItem
                {
                    Value = c.Id.ToString(),
                    Text = c.Name
                }).ToList();

                return Page();
            }

            var newProduct = new Product
            {
                Name = Product.Name,
                Sku = Product.Sku,
                ProductCategories = Product.SelectedCategoryIds.Select(id => new ProductCategory
                {
                    CategoryId = id
                }).ToList()
            };

            _context.Products.Add(newProduct);
            _context.SaveChanges();

            TempData["SuccessMessage"] = "Product created successfully!";
            return RedirectToPage("Index");
        }
    }
}
