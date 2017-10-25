using IssueTracker.Models.DAL;
using IssueTracker.Models.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IssueTracker.Models.BLL
{
    public class TechnicianBLL
    {
        private IssueTrackerContext _db;
        public TechnicianBLL(IssueTrackerContext db)
        {
            _db = db;
        }

         public  List<Technician> GetAllTechnicians()
        {
            List<Technician> technicians  = _db.Technicians.ToList();
            return technicians;
        }
    }
}