USE [master]
GO
/****** Object:  Database [IssueTrackerDB]    Script Date: 10/24/2017 3:31:56 PM ******/
CREATE DATABASE [IssueTrackerDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IssueTrackerDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\IssueTrackerDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'IssueTrackerDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\IssueTrackerDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [IssueTrackerDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IssueTrackerDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IssueTrackerDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IssueTrackerDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IssueTrackerDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IssueTrackerDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IssueTrackerDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [IssueTrackerDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IssueTrackerDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IssueTrackerDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IssueTrackerDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IssueTrackerDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IssueTrackerDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IssueTrackerDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IssueTrackerDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IssueTrackerDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IssueTrackerDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IssueTrackerDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IssueTrackerDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IssueTrackerDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IssueTrackerDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IssueTrackerDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IssueTrackerDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IssueTrackerDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IssueTrackerDB] SET RECOVERY FULL 
GO
ALTER DATABASE [IssueTrackerDB] SET  MULTI_USER 
GO
ALTER DATABASE [IssueTrackerDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IssueTrackerDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IssueTrackerDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IssueTrackerDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [IssueTrackerDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'IssueTrackerDB', N'ON'
GO
USE [IssueTrackerDB]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/24/2017 3:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/24/2017 3:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/24/2017 3:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/24/2017 3:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/24/2017 3:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IssueHistories]    Script Date: 10/24/2017 3:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IssueHistories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IssueId] [int] NOT NULL,
	[ChangeDate] [datetime2](7) NOT NULL,
	[Comments] [nvarchar](500) NULL,
	[TechnicianId] [int] NULL,
	[StatusId] [tinyint] NOT NULL,
	[SeverityId] [tinyint] NOT NULL,
	[DueDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_IssueHistories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Issues]    Script Date: 10/24/2017 3:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Issues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[StatusId] [tinyint] NOT NULL,
	[SeverityId] [tinyint] NOT NULL,
	[DueDate] [datetime2](7) NOT NULL,
	[TechnicianId] [int] NULL,
	[Comments] [nvarchar](500) NULL,
 CONSTRAINT [PK_Issues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Severities]    Script Date: 10/24/2017 3:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Severities](
	[Id] [tinyint] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Severities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 10/24/2017 3:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[Id] [tinyint] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Technicians]    Script Date: 10/24/2017 3:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Technicians](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Technician] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'05192432-b597-46a9-a186-8ff841850bb6', N'mike@its.com', 0, N'ACpEJLni+gY5CEvVPRL58b3MN4MuY8+KzsDzrbhxzy1GSWdlxUW/uuzhmMiCMia/zQ==', N'fce3e278-ca12-4fe9-bf31-c0b5b97c1a6e', NULL, 0, 0, NULL, 1, 0, N'mike@its.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'32239851-7288-48d6-afe7-6ad0028be230', N'sara@its.com', 0, N'ANndkIC81cZHCMM8dRRyLiOUvncV1j1QNoJSNdEiOLh/SswJKcMLmQaCJXLWs5z63w==', N'2cb10d62-e18b-4247-98eb-259b18e86751', NULL, 0, 0, NULL, 1, 0, N'sara@its.com')
SET IDENTITY_INSERT [dbo].[Issues] ON 

INSERT [dbo].[Issues] ([Id], [Title], [Description], [StatusId], [SeverityId], [DueDate], [TechnicianId], [Comments]) VALUES (4, N'ITS Software Login Failure', N'When trying to login from multiple platforms the system automatically log off previous sessions.', 5, 2, CAST(N'2017-10-25T20:33:56.1756823' AS DateTime2), 2, N'Sorry it is a security requirment.')
INSERT [dbo].[Issues] ([Id], [Title], [Description], [StatusId], [SeverityId], [DueDate], [TechnicianId], [Comments]) VALUES (5, N'Difficulties while browsing in a cell phone', N'The website UI has problem while navigating with a cell phone or tablet.', 3, 1, CAST(N'2017-10-22T20:11:16.8585974' AS DateTime2), 2, N'resolved in newer versions')
INSERT [dbo].[Issues] ([Id], [Title], [Description], [StatusId], [SeverityId], [DueDate], [TechnicianId], [Comments]) VALUES (1004, N'ITS Hangs', N'While updating issue 1004 the website freezes.', 1, 4, CAST(N'2017-10-26T09:37:31.5110453' AS DateTime2), 1, NULL)
INSERT [dbo].[Issues] ([Id], [Title], [Description], [StatusId], [SeverityId], [DueDate], [TechnicianId], [Comments]) VALUES (1005, N'Invalid Tracking Number', N'When I track issue number 1005 the system says "Invalid Tracking Number"', 3, 1, CAST(N'2017-10-26T10:38:25.5959430' AS DateTime2), 1, N'already resolved')
SET IDENTITY_INSERT [dbo].[Issues] OFF
INSERT [dbo].[Severities] ([Id], [Title]) VALUES (1, N'Critical')
INSERT [dbo].[Severities] ([Id], [Title]) VALUES (2, N'High')
INSERT [dbo].[Severities] ([Id], [Title]) VALUES (3, N'Medium')
INSERT [dbo].[Severities] ([Id], [Title]) VALUES (4, N'Low')
INSERT [dbo].[Statuses] ([Id], [Title]) VALUES (1, N'New')
INSERT [dbo].[Statuses] ([Id], [Title]) VALUES (2, N'InProgress')
INSERT [dbo].[Statuses] ([Id], [Title]) VALUES (3, N'Resolved')
INSERT [dbo].[Statuses] ([Id], [Title]) VALUES (4, N'Closed')
INSERT [dbo].[Statuses] ([Id], [Title]) VALUES (5, N'Rejected')
SET IDENTITY_INSERT [dbo].[Technicians] ON 

INSERT [dbo].[Technicians] ([Id], [UserId], [FirstName], [LastName]) VALUES (1, N'32239851-7288-48d6-afe7-6ad0028be230', N'Sara', N'Keller')
INSERT [dbo].[Technicians] ([Id], [UserId], [FirstName], [LastName]) VALUES (2, N'05192432-b597-46a9-a186-8ff841850bb6', N'Mike', N'Turner')
SET IDENTITY_INSERT [dbo].[Technicians] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 10/24/2017 3:31:56 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 10/24/2017 3:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 10/24/2017 3:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 10/24/2017 3:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 10/24/2017 3:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 10/24/2017 3:31:56 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[IssueHistories]  WITH CHECK ADD  CONSTRAINT [FK_IssueHistories_Issues] FOREIGN KEY([IssueId])
REFERENCES [dbo].[Issues] ([Id])
GO
ALTER TABLE [dbo].[IssueHistories] CHECK CONSTRAINT [FK_IssueHistories_Issues]
GO
ALTER TABLE [dbo].[IssueHistories]  WITH CHECK ADD  CONSTRAINT [FK_IssueHistories_Severities] FOREIGN KEY([SeverityId])
REFERENCES [dbo].[Severities] ([Id])
GO
ALTER TABLE [dbo].[IssueHistories] CHECK CONSTRAINT [FK_IssueHistories_Severities]
GO
ALTER TABLE [dbo].[IssueHistories]  WITH CHECK ADD  CONSTRAINT [FK_IssueHistories_Statuses] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Statuses] ([Id])
GO
ALTER TABLE [dbo].[IssueHistories] CHECK CONSTRAINT [FK_IssueHistories_Statuses]
GO
ALTER TABLE [dbo].[IssueHistories]  WITH CHECK ADD  CONSTRAINT [FK_IssueHistories_Technician] FOREIGN KEY([TechnicianId])
REFERENCES [dbo].[Technicians] ([Id])
GO
ALTER TABLE [dbo].[IssueHistories] CHECK CONSTRAINT [FK_IssueHistories_Technician]
GO
ALTER TABLE [dbo].[Issues]  WITH CHECK ADD  CONSTRAINT [FK_Issues_Severities] FOREIGN KEY([SeverityId])
REFERENCES [dbo].[Severities] ([Id])
GO
ALTER TABLE [dbo].[Issues] CHECK CONSTRAINT [FK_Issues_Severities]
GO
ALTER TABLE [dbo].[Issues]  WITH CHECK ADD  CONSTRAINT [FK_Issues_Statuses] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Statuses] ([Id])
GO
ALTER TABLE [dbo].[Issues] CHECK CONSTRAINT [FK_Issues_Statuses]
GO
ALTER TABLE [dbo].[Issues]  WITH CHECK ADD  CONSTRAINT [FK_Issues_Technician] FOREIGN KEY([TechnicianId])
REFERENCES [dbo].[Technicians] ([Id])
GO
ALTER TABLE [dbo].[Issues] CHECK CONSTRAINT [FK_Issues_Technician]
GO
ALTER TABLE [dbo].[Technicians]  WITH CHECK ADD  CONSTRAINT [FK_Technician_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Technicians] CHECK CONSTRAINT [FK_Technician_AspNetUsers]
GO
USE [master]
GO
ALTER DATABASE [IssueTrackerDB] SET  READ_WRITE 
GO
