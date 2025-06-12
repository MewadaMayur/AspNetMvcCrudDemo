using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;

namespace crud_framework_four_eight.Models
{
    public class Employee
    {
        [Key]
        public int? Id { get; set; }

        [MaxLength(10, ErrorMessage = "Maximum length is 10")]
        [Required]
        public string Name { get; set; }

        [EmailAddress]
        [Required]
        public string Email { get; set; }

        [Phone]
        [Required(ErrorMessage = "Phone is required")]
        [MaxLength(10, ErrorMessage = "Maximum length is 10")]
        public string Phone { get; set; }

        
        [Required(ErrorMessage = "Address required")]
        [MaxLength(200, ErrorMessage = "Maximum length is 200")]
        public string Address { get; set; }
        
        [Required]
        public DateTime JoiningDate { get; set; }
        [Required]
        public string Department { get; set; }
        [Required]
        public string Position { get; set; }
        [Required]
        [Range(0,100000,ErrorMessage ="Minimum 0 and maximum 100000")  ]
        public decimal Salary { get; set; }
    }
}