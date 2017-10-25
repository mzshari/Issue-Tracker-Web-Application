using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace IssueTracker.Models.DomainModels
{
    //Technicians are Issue Tracker staffs who are responsible for issues to be solved
    public class Technician
    {
        public int Id { get; set; }
        [ScaffoldColumn(false)]
        public string UserId { get; set; }
        [StringLength(50)]
        [Display(Name = "Assignee")]
        public string FirstName { get; set; }
        [StringLength(50)]
        public string LastName { get; set; }
    }
}