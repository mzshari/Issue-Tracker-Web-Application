using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace IssueTracker.Models.DomainModels
{
    //This class aims to keep history of an issue
    //Every time an issue is updated a new history record is created
    public class IssueHistory 
    {
        public int Id { get; set; }
        public int IssueId { get; set; }
        public System.DateTime ChangeDate { get; set; }
        public System.DateTime DueDate { get; set; }
        [StringLength(500)]
        public string Comments { get; set; }
        public short? StatusId { get; set; }
        public short? SeverityId { get; set; }
        public int? TechnicianId { get; set; }

        public virtual Technician Technician{ get; set; }
        public virtual Status Status{ get; set; }
        public virtual Severity Severity{ get; set; }

    }
}