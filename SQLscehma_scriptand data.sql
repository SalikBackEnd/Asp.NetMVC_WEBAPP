USE [master]
GO
/****** Object:  Database [mvcdb]    Script Date: 2/12/2021 12:27:05 PM ******/
CREATE DATABASE [mvcdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mvcdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\mvcdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mvcdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\mvcdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [mvcdb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mvcdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mvcdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mvcdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mvcdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mvcdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mvcdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [mvcdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mvcdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mvcdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mvcdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mvcdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mvcdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mvcdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mvcdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mvcdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mvcdb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [mvcdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mvcdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mvcdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mvcdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mvcdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mvcdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mvcdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mvcdb] SET RECOVERY FULL 
GO
ALTER DATABASE [mvcdb] SET  MULTI_USER 
GO
ALTER DATABASE [mvcdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mvcdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mvcdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mvcdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mvcdb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'mvcdb', N'ON'
GO
ALTER DATABASE [mvcdb] SET QUERY_STORE = OFF
GO
USE [mvcdb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [mvcdb]
GO
/****** Object:  User [sa_admin]    Script Date: 2/12/2021 12:27:06 PM ******/
CREATE USER [sa_admin] FOR LOGIN [sa_admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [sa_admin]
GO
/****** Object:  Table [dbo].[HistoryMark]    Script Date: 2/12/2021 12:27:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryMark](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ActionDate] [date] NOT NULL,
	[ActionTime] [time](7) NOT NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2/12/2021 12:27:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 2/12/2021 12:27:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/12/2021 12:27:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](40) NOT NULL,
	[Email] [nvarchar](40) NOT NULL,
	[Password] [nvarchar](40) NOT NULL,
	[Status] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[HistoryMark] ON 
GO
INSERT [dbo].[HistoryMark] ([Id], [UserId], [ActionDate], [ActionTime], [Active]) VALUES (1, 1, CAST(N'2021-02-10' AS Date), CAST(N'16:07:46.0700000' AS Time), 1)
GO
INSERT [dbo].[HistoryMark] ([Id], [UserId], [ActionDate], [ActionTime], [Active]) VALUES (2, 1, CAST(N'0001-01-01' AS Date), CAST(N'00:00:00' AS Time), 0)
GO
INSERT [dbo].[HistoryMark] ([Id], [UserId], [ActionDate], [ActionTime], [Active]) VALUES (3, 1, CAST(N'2021-02-10' AS Date), CAST(N'16:22:52.3597749' AS Time), 1)
GO
INSERT [dbo].[HistoryMark] ([Id], [UserId], [ActionDate], [ActionTime], [Active]) VALUES (4, 1, CAST(N'2021-02-10' AS Date), CAST(N'16:26:45.9529340' AS Time), 0)
GO
INSERT [dbo].[HistoryMark] ([Id], [UserId], [ActionDate], [ActionTime], [Active]) VALUES (5, 1, CAST(N'2021-02-10' AS Date), CAST(N'16:26:50.1901074' AS Time), 1)
GO
INSERT [dbo].[HistoryMark] ([Id], [UserId], [ActionDate], [ActionTime], [Active]) VALUES (6, 1, CAST(N'2021-02-10' AS Date), CAST(N'16:26:54.3301878' AS Time), 0)
GO
INSERT [dbo].[HistoryMark] ([Id], [UserId], [ActionDate], [ActionTime], [Active]) VALUES (7, 1, CAST(N'2021-02-10' AS Date), CAST(N'16:26:56.4258007' AS Time), 1)
GO
INSERT [dbo].[HistoryMark] ([Id], [UserId], [ActionDate], [ActionTime], [Active]) VALUES (8, 1, CAST(N'2021-02-10' AS Date), CAST(N'16:27:13.3042233' AS Time), 0)
GO
INSERT [dbo].[HistoryMark] ([Id], [UserId], [ActionDate], [ActionTime], [Active]) VALUES (9, 1, CAST(N'2021-02-10' AS Date), CAST(N'16:55:29.4981774' AS Time), 1)
GO
INSERT [dbo].[HistoryMark] ([Id], [UserId], [ActionDate], [ActionTime], [Active]) VALUES (10, 1, CAST(N'2021-02-10' AS Date), CAST(N'16:55:52.0805228' AS Time), 0)
GO
INSERT [dbo].[HistoryMark] ([Id], [UserId], [ActionDate], [ActionTime], [Active]) VALUES (11, 1, CAST(N'2021-02-10' AS Date), CAST(N'16:55:54.2420115' AS Time), 1)
GO
SET IDENTITY_INSERT [dbo].[HistoryMark] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'SuperAdmin')
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'System User')
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (3, N'User')
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (4, N'CanAddUser')
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (5, N'Staff')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRoles] ON 
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (1, 1, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (9, 17, 2)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (10, 18, 5)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (11, 19, 3)
GO
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [Status]) VALUES (1, N'Admin', N'admin@email.com', N'admin123', N'Active')
GO
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [Status]) VALUES (17, N'username1', N'username1@email.com', N'username1', N'InActive')
GO
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [Status]) VALUES (18, N'staff1', N'staff1@email.com', N'staff123', N'InActive')
GO
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [Status]) VALUES (19, N'user1', N'user1@email.com', N'user1234', N'InActive')
GO
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [Status]) VALUES (20, N'na', N'ssda', N'ssdsd', N'InActive')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D10534425268E1]    Script Date: 2/12/2021 12:27:06 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HistoryMark] ADD  DEFAULT (getdate()) FOR [ActionDate]
GO
ALTER TABLE [dbo].[HistoryMark] ADD  DEFAULT (getdate()) FOR [ActionTime]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('InActive') FOR [Status]
GO
ALTER TABLE [dbo].[HistoryMark]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
USE [master]
GO
ALTER DATABASE [mvcdb] SET  READ_WRITE 
GO
