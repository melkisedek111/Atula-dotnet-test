using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Mapster;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using net8Test.Context;
using net8Test.DTO;
using net8Test.Models;

namespace net8Test.Pages.Products
{
    public class IndexModel : PageModel
    {
        private readonly net8Test.Context.DatabaseContext _context;

        public IndexModel(net8Test.Context.DatabaseContext context)
        {
            _context = context;
        }

        public IList<ProductDTO> Product { get;set; } = default!;

        public async Task OnGetAsync()
        {
            var products = await _context.Products.ToListAsync();
            Product = products.Adapt<List<ProductDTO>>();
        }
    }
}
