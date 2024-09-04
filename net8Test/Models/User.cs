using Microsoft.AspNetCore.Identity;

namespace net8Test.Models
{
    public class User : IdentityUser
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
    }
}
