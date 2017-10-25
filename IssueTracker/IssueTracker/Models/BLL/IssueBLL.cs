using IssueTracker.Models.DAL;
using IssueTracker.Models.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Web;
using PagedList;
using System.Web.Script.Serialization;

namespace IssueTracker.Models.BLL
{
    public class IssueBLL
    {
        private IssueTrackerContext _db;
        private Technician _technician ;
    
        public IssueBLL(IssueTrackerContext db)
        {
            _db = db;
        }

        public IssueBLL(IssueTrackerContext db, string userId)
        {
            _db = db;
           _technician = _db.Technicians.Single(x => x.UserId == userId);
        }

         public int NewIssue(Issue issue)
        {
           //Automatically every issue's DueDate is 2 days after recieving the issue.
           //Each time an issue is updated the DueDate extend 2 days.
            issue.DueDate = DateTime.Now.AddDays(2) ;
            issue.StatusId = IssueStatus.New;
            //choosing a randon technician to assign the issue:
            //To Do: it is better to use a better algorithm for assigning issues to the technicians
            //A good solution is to think of this problem as a "Single Queue Multiple Servers" problem and assign issues in real time.
            List<Technician> technicians = new TechnicianBLL(_db).GetAllTechnicians();
            Random rnd = new Random();
            int r = rnd.Next(technicians.Count);
            Technician technician = technicians[r];
            issue.TechnicianId = technician.Id;
            _db.Issues.Add(issue);
            _db.SaveChanges();
            return issue.Id;
        }

         public Issue GetIssue(int id)
        {
            Issue issue = _db.Issues.Find(id);
            return issue;
        }

           public string SelectIssues(string SortOrder, string SearchString, int? Page,
                    Byte? SeverityId, Byte? StatusId,
                    Nullable<DateTime> DueDateFrom, Nullable<DateTime> DueDateTo
                    )
        {
            _db.Configuration.LazyLoadingEnabled = false;
            _db.Configuration.ProxyCreationEnabled = false;

            var issues = _db.Issues.Include(i => i.Technician).Include(i => i.Status).Include(i => i.Severity);
            
             issues = issues.Where(i => i.TechnicianId == _technician.Id );
            if (DueDateFrom.HasValue)
                if (DueDateTo.HasValue)
                    issues = issues.Where(i => i.DueDate >= DueDateFrom && i.DueDate <= DueDateTo);
                else
                    issues = issues.Where(i => i.DueDate >= DueDateFrom);

            else if (DueDateTo.HasValue)
                issues = issues.Where(i => i.DueDate <= DueDateTo);

           
            if (SeverityId.HasValue)
                issues = issues.Where(i => i.SeverityId == SeverityId.Value);
            if (StatusId.HasValue)
                issues = issues.Where(i => i.StatusId == StatusId.Value);


            if (!String.IsNullOrEmpty(SearchString))
                issues = issues.Where(i =>
                i.Description.Contains(SearchString) || i.Title.Contains(SearchString) ||
                i.Technician.FirstName.Contains(SearchString));
            
            int count = issues.Count();

            switch (SortOrder)
            {
                case "dueDate":
                    issues = issues.OrderBy(i => i.DueDate);
                    break;
                case "title":
                    issues = issues.OrderBy(i => i.Title);
                    break;
                default:
                    issues = issues.OrderBy(i => i.SeverityId);
                    break;
            }
            int pageSize = 20;
            int pageNumber = (Page ?? 1);
            IPagedList<Issue> finalissues = issues.ToPagedList(pageNumber, pageSize);

            var collection = finalissues.Select(i => new
            {
                Id = i.Id,
                Description = i.Description,
                Title = i.Title,
                Severity = i.Severity.Title,
                Status = i.Status.Title,
                Assignee = i.Technician.FirstName,
                Comments = i.Comments,
                DueDate = i.DueDate
            });

            dynamic collectionWrapper = new
            {
                SortOrder = SortOrder,
                Page = Page,
                SearchString = SearchString,
                StatusId = StatusId,
                SeverityId = SeverityId,
                DueDateFrom = DueDateFrom,
                DueDateTo = DueDateTo,
                TotalCount = count,
                IssuesList = collection
            };
            var json = new JavaScriptSerializer().Serialize(collectionWrapper);
            return json;

        }

             public bool EditIssue(Issue issue)
        {
            Issue originalIssue = _db.Issues.Find(issue.Id);
            _db.Issues.Attach(originalIssue);
            originalIssue.Title = issue.Title;
            originalIssue.Description = issue.Description;
            originalIssue.Comments = issue.Comments;
            originalIssue.SeverityId = issue.SeverityId;
            originalIssue.StatusId = issue.StatusId;
            originalIssue.TechnicianId = issue.TechnicianId;
           //Each time an issue is updated the DueDate extend 2 days.
            originalIssue.DueDate = DateTime.Now.AddDays(2);
            _db.SaveChanges();
            return true;
        }
    }
}