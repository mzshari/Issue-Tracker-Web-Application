using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace IssueTracker.Models.DomainModels
{
    [Table("Statuses")]
    public class Status
    {
       public Byte Id { get; set; }
        [StringLength(50)]
        [Display(Name = "Status")]
        public string Title { get; set; }
    }
}