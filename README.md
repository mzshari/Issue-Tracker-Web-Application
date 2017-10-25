Issue Tracker System

Issue Tracker is a simple ASP.NET web application to collect and track issues. Used technologies are: AngularJS, Bootstrap, JQuery and Razors.

Deplyment Guide
---------------------------------------------------------------------------------------------
Database setup: 
to setup the database you need SQL Server or SQL Express. You can Restore IssueTrackerDB.mdf file from App_Data folder or run the scripts to set up the database.

Application setup:

To setup ASP.NET application you can either use IIS or Visual Studio to deploy required files. You can follow instructions in: https://docs.microsoft.com/en-us/aspnet/web-forms/overview/deployment/visual-studio-web-deployment/deploying-to-iis

At the end update connection string in Web.Config:

 <add name="ITConnectionString" connectionString="Data Source=YOUR_Server_NAME;Initial Catalog=IssueTrackerDB;Integrated Security=True;" providerName="System.Data.SqlClient" />


Current Technicians Accounts
---------------------------------------------------------------------------------------------
Use folowing accounts to Sign in as technicians and edit issues:

Username: "mike@its.com"		Password: "M!ke123"
Username: "sara@its.com"		Password: "S@ra123"
