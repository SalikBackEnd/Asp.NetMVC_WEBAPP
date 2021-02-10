using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
namespace WebApp.Models
{
    public class UserStateModel
    {
        public int Id { get; set; }

        [Required]
        public int UserId { get; set; }
        [Required]
        public bool Active { get; set; }
        
    }
}