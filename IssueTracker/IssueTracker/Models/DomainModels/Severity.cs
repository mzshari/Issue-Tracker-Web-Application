using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace IssueTracker.Models.DomainModels
{
    public class Severity
    {
        public Byte Id { get; set; }
        [StringLength(50)]
        [Display(Name = "Severity")]
        public string Title { get; set; }
    }
}