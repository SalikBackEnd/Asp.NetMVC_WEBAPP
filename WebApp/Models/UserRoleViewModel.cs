using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApp.Models
{
    public class UserRoleViewModel
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "Username is Required!")]
        [DataType(DataType.Text)]
        [MinLength(3, ErrorMessage = "Username should be more than 2 charactrs!")]
        [MaxLength(40, ErrorMessage = "Username characters limit exceed! Only 40 characters allowed.")]
        public string Username { get; set; }
        [Required(ErrorMessage = "Email is Required!")]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        [Required(ErrorMessage = "Password is Required!")]
        [DataType(DataType.Password)]
        [MinLength(8, ErrorMessage = "Password should 8 charactrs long!")]
        [MaxLength(40, ErrorMessage = "Password characters limit exceed! Only 40 characters allowed.")]
        public string Password { get; set; }

        public string Status = "InActive";
        [Required(ErrorMessage = "Select a User Role!")]
        public int Roleid { get; set; }
        public SelectList Role { get; set; }
    }
}