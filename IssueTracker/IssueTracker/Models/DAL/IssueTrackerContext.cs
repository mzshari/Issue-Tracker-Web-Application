using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using IssueTracker.Models.DomainModels;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.ComponentModel.DataAnnotations.Schema;

namespace IssueTracker.Models.DAL
{
    public class IssueTrackerContext : DbContext
    {
        public IssueTrackerContext()
            : base("ITConnectionString")
        {
            //this.Configuration.LazyLoadingEnabled = false;
        }
        public DbSet<Technician> Technicians { get; set; }
        public DbSet<Issue> Issues { get; set; }
        public DbSet<IssueHistory> IssueHistories { get; set; }
        public DbSet<Severity> Severities { get; set; }
       public DbSet<Status> Statuses { get; set; }

    }
}