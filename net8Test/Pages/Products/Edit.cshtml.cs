using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Mapster;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using net8Test.Context;
using net8Test.DTO;
using net8Test.Models;
using net8Test.Types;

namespace net8Test.Pages.Products
{
    public class EditModel : PageModel
    {
        private readonly net8Test.Context.DatabaseContext _context;

        public EditModel(net8Test.Context.DatabaseContext context)
        {
            _context = context;
        }

        [BindProperty]
        public ProductViewModel Product { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            var product = _context.Products.Include(p => p.ProductCategories)
                                           .FirstOrDefault(p => p.Id == id);
            var productDto = product.Adapt<ProductDTO>();
            if (productDto == null)
            {
                return NotFound();
            }
            var selectedCategoryIds = product.ProductCategories.Select(pc => pc.CategoryId).ToList();
            var categories = await _context.Categories.ToListAsync();
            var categoriesSelectItem = categories.Select(c => new SelectListItem
            {
                Value = c.Id.ToString(),
                Text = c.Name,
                Selected = product.ProductCategories.Any(pc => pc.CategoryId == c.Id)
            }).ToList();

            // Populate the ProductViewModel with existing product data
            Product = new ProductViewModel
            {
                Id = product.Id,
                Name = product.Name,
                Sku = product.Sku,
                SelectedCategoryIds = selectedCategoryIds,
                Categories = categoriesSelectItem
            };

            return Page();
        }

        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                // Re-populate the Categories list in case of an error
                Product.Categories = _context.Categories.Select(c => new SelectListItem
                {
                    Value = c.Id.ToString(),
                    Text = c.Name
                }).ToList();

                return Page();
            }

            var product = _context.Products.Include(p => p.ProductCategories)
                                            .FirstOrDefault(p => p.Id == Product.Id);

            if (product == null)
            {
                return NotFound();
            }

            // Update product details
            product.Name = Product.Name;
            product.Sku = Product.Sku;

            // Clear existing categories
            product.ProductCategories.Clear();

            // Assign selected categories
            foreach (var categoryId in Product.SelectedCategoryIds)
            {
                product.ProductCategories.Add(new ProductCategory
                {
                    CategoryId = categoryId,
                    ProductId = product.Id
                });
            }

            try
            {
                await _context.SaveChangesAsync();
                TempData["SuccessMessage"] = "Product updated successfully!";
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductExists(Product.Id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("Index");
        }

        private bool ProductExists(int id)
        {
            return _context.Products.Any(e => e.Id == id);
        }
    }
}
