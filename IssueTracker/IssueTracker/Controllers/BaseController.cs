using IssueTracker.Models.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IssueTracker.Controllers
{
 public abstract class BaseController : Controller
    {
        protected  IssueTrackerContext db { get; set; }
        public BaseController()
        {
            db = new IssueTrackerContext();
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
                db.Dispose();
            base.Dispose(disposing);
        }
        protected void Reset()
        {
            db.Dispose();
            db = new IssueTrackerContext();
        }

    }
}