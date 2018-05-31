using System;
using System.ComponentModel.DataAnnotations;
using Xalag.Properties;

namespace Xalag.Models
{
    public class RegisterUserModel
    {
        [Display(ResourceType = typeof(Resources), Name = "PlaceId")]
        public int PlaceId { get; set; }

        [Display(ResourceType = typeof(Resources), Name = "UserId")]
        public int UserId { get; set; }

        [Required]
        [Display(ResourceType = typeof(Resources), Name = "FirstName")]
        public string FirstName { get; set; }

        [Required]
        [Display(ResourceType = typeof(Resources), Name = "LastName")]
        public string LastName { get; set; }

        [Required]
        [Phone]
        [StringLength(10, ErrorMessageResourceType = typeof(Resources), ErrorMessageResourceName = "MobileNoMustBe_2_Digit", MinimumLength = 10)]
        [Display(ResourceType = typeof(Resources), Name = "MobileNo")]
        public string MobileNo { get; set; }

        [Display(ResourceType = typeof(Resources), Name = "Birthday")]
        public string Birthday { get; set; }

        [Required]
        [StringLength(10, ErrorMessageResourceType = typeof(Resources), ErrorMessageResourceName = "NatrualCodeMustBe_2_Digit", MinimumLength = 10)]
        [Display(ResourceType = typeof(Resources), Name = "NatrualCode")]
        public string NatrualCode { get; set; }

        [Required]
        [EmailAddress]
        [Display(ResourceType = typeof(Resources), Name = "Email")]
        public string Email { get; set; }
    }
}