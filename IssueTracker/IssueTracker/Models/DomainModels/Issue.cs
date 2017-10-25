using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace IssueTracker.Models.DomainModels
{
    public class Issue
    {
        [Display(Name = "Tracking Number")]
        public int Id { get; set; }
        [StringLength(100)]
        public string Title { get; set; }
        [StringLength(500)]
        public string Description { get; set; }
        //Due date is automatically set for 2 days after receiving an issue. 
        //Each time the issue is updated due date extends for 2 days.
        public System.DateTime DueDate { get; set; }
        [StringLength(500)]
        //Comments from technician regarding the issue to provide more information for the person who tracks the issue
        public string Comments { get; set; }
        [StringLength(10)]
        //To Do:
        //For future use. It is not safe to use id as tracking number. Tracking number is a unique alpha-numeric 10 character string just used to track an issue
        public string TrackingNumber;
        //Valid statuses are New (1), InProgress (2), Resolved (3), Closed (4), Rejected (5)
        public Byte StatusId { get; set; }
        //Valid severity levels are Critical (1), High (2), Medium (3), Low (4)
        public Byte SeverityId { get; set; }
        //Id os assignee technician who is responsible for the issue
        public int? TechnicianId { get; set; }

        public virtual Technician Technician { get; set; }
        [ForeignKey("StatusId")]
        public virtual Status Status { get; set; }
        [ForeignKey("SeverityId")]
        public virtual Severity Severity { get; set; }

    }
}