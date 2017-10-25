using IssueTracker.Models.DomainModels;
using IssueTracker.Models.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;

namespace IssueTracker.Controllers
{

    [RequireHttps]
    public class IssueController : BaseController
    {
        public ActionResult Details(int? TrackingNumber)
        {
            if (TrackingNumber == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            return View(new IssueBLL(db).GetIssue(TrackingNumber.Value));
        }

        [Authorize]
          public ActionResult IssueDetails(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            return View(new IssueBLL(db).GetIssue(id.Value));
        }

        public ActionResult Create()
        {
            return PartialView();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public int Create(Issue issue)
        {
            if (ModelState.IsValid)
            {
                return (new IssueBLL(db).NewIssue(issue));
            }
            return 0;
        }

        [Authorize]
          public ActionResult Edit(int? id)
        {
             if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
             Issue issue = new IssueBLL(db,User.Identity.GetUserId()).GetIssue(id.Value);
            ViewBag.TechnicianId = new SelectList(new TechnicianBLL(db).GetAllTechnicians(), "Id", "FirstName", issue.TechnicianId);
            return PartialView(issue);
        }

        [Authorize]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public bool Edit(Issue issue)
        {
            if (ModelState.IsValid)
            {
                return (new IssueBLL(db,User.Identity.GetUserId()).EditIssue(issue));
            }
            return false;
        }


        [Authorize]
        public ActionResult ListIssues()
        {
            return View();
        }
        [Authorize]
        public string SelectIssues(string SortOrder, string SearchString, int? Page,
                    Byte? SeverityId, Byte? StatusId,
                    Nullable<DateTime> DueDateFrom, Nullable<DateTime> DueDateTo
                    )
        {
            return new IssueBLL(db,User.Identity.GetUserId()).SelectIssues(SortOrder, SearchString, Page, SeverityId, StatusId, DueDateFrom, DueDateTo);
        }
        
    }
}