using System.ComponentModel.DataAnnotations;
using FluentValidation;

namespace net8Test.Validators
{
    public class SignInInputModel
    {
        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }

    public class SignInInputModelValidator : AbstractValidator<SignInInputModel>
    {
        public SignInInputModelValidator() 
        {
            RuleFor(x => x.Email).NotEmpty().EmailAddress();
            RuleFor(x => x.Password).NotEmpty().MinimumLength(6);
        }
    }
}
