using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using net8Test.Context;
using net8Test.Models;

namespace net8Test.Pages
{
    public class IndexModel : PageModel
    {
        private readonly net8Test.Context.DatabaseContext _context;

        public IndexModel(net8Test.Context.DatabaseContext context)
        {
            _context = context;
        }

        public IList<Product> Product { get;set; } = default!;

        public async Task OnGetAsync()
        {
            Product = await _context.Products.ToListAsync();
        }
    }
}
