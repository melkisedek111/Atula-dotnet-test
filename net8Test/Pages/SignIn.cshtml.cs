using FluentValidation;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using net8Test.Models;
using net8Test.Validators;
using System.ComponentModel.DataAnnotations;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace net8Test.Pages
{

    public class SignInModel : PageModel
    {
        private readonly IValidator<SignInInputModel> _validator;
        private readonly SignInManager<User> _signInManager;
        [BindProperty]
        public SignInInputModel Input { get; set; }
        public List<string> ErrorMessages { get; set; } = new List<string>();
        public string ErrorMessage { get; set; }
        public SignInModel(SignInManager<User> signInManager, IValidator<SignInInputModel> validator)
        {
            _signInManager = signInManager;
            _validator = validator;
        }

        public void OnGet()
        {
        }

        public async Task<IActionResult> OnPostAsync()
        {
            var validationResult = await _validator.ValidateAsync(Input);

            if (!validationResult.IsValid)
            {
                // Collect errors as a list
                ErrorMessages = validationResult.Errors.Select(e => e.ErrorMessage).ToList();

                // Add errors to ModelState for display in the view (optional)
                foreach (var error in validationResult.Errors)
                {
                    ModelState.AddModelError(string.Empty, error.ErrorMessage);
                }

                return Page();
            }

            var result = await _signInManager.PasswordSignInAsync(Input.Email, Input.Password, false, lockoutOnFailure: false);

            if (result.Succeeded) 
            {
                return RedirectToPage("Index");
            }
            else
            {
                ErrorMessage = "Invalid login attempt.";
                ModelState.AddModelError(string.Empty, "Invalid login attempt.");
                return Page();
            }
        }
    }
}
