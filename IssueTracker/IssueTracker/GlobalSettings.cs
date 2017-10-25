using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IssueTracker
{
    public static class SeverityLevel
    {
        public static Byte Critical
        {
            get { return 1; }
        }
          public static Byte High
        {
            get { return 2; }
        }
          public static Byte Medium
        {
            get { return 3; }
        }
          public static Byte Low
        {
            get { return 4; }
        }
        
    }

    public static class IssueStatus
    {
        public static Byte New
        {
            get { return 1; }
        }
          public static Byte InProgress
        {
            get { return 2; }
        }
          public static Byte Resolved
        {
            get { return 3; }
        }
          public static Byte Closed
        {
            get { return 4; }
        }
        public static Byte Rejected
        {
            get { return 5; }
        }
        
    }
}