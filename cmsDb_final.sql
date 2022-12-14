USE [master]
GO
/****** Object:  Database [cmsDb]    Script Date: 9.04.2022 19:05:24 ******/
CREATE DATABASE [cmsDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cmsDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\cmsDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'cmsDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\cmsDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [cmsDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cmsDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cmsDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cmsDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cmsDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cmsDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cmsDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [cmsDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cmsDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cmsDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cmsDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cmsDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cmsDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cmsDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cmsDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cmsDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cmsDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [cmsDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cmsDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cmsDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cmsDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cmsDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cmsDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cmsDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cmsDb] SET RECOVERY FULL 
GO
ALTER DATABASE [cmsDb] SET  MULTI_USER 
GO
ALTER DATABASE [cmsDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cmsDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cmsDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cmsDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [cmsDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [cmsDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'cmsDb', N'ON'
GO
ALTER DATABASE [cmsDb] SET QUERY_STORE = OFF
GO
USE [cmsDb]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 9.04.2022 19:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [char](2) NOT NULL,
	[ClassGrade] [int] NOT NULL,
	[SchoolID] [int] NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 9.04.2022 19:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Comment] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[PostID] [int] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[File]    Script Date: 9.04.2022 19:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[File](
	[FileID] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](50) NOT NULL,
	[FileType] [char](5) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[PostID] [int] NULL,
	[Path] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED 
(
	[FileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 9.04.2022 19:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[ClassIDs] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[PostTitle] [nvarchar](20) NOT NULL,
	[PostDescription] [nvarchar](100) NOT NULL,
	[SchoolID] [int] NOT NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 9.04.2022 19:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[School]    Script Date: 9.04.2022 19:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[School](
	[SchoolID] [int] IDENTITY(1,1) NOT NULL,
	[SchoolName] [nvarchar](50) NOT NULL,
	[StudentCode] [int] NOT NULL,
	[TeacherCode] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_School] PRIMARY KEY CLUSTERED 
(
	[SchoolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiteMenu]    Script Date: 9.04.2022 19:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteMenu](
	[SiteID] [int] IDENTITY(1,1) NOT NULL,
	[ControllerName] [nvarchar](50) NOT NULL,
	[ActionName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[SiteMenuName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SiteMenu] PRIMARY KEY CLUSTERED 
(
	[SiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiteRolMapping]    Script Date: 9.04.2022 19:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteRolMapping](
	[SiteRolMappingID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[SitemenuID] [int] NOT NULL,
 CONSTRAINT [PK_SiteRolMapping] PRIMARY KEY CLUSTERED 
(
	[SiteRolMappingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 9.04.2022 19:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[UserImgID] [int] NOT NULL,
	[ClassID] [int] NULL,
	[IsEmailValidated] [bit] NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](14) NOT NULL,
	[BirthDate] [datetime] NULL,
	[Gender] [char](2) NULL,
	[IsActive] [bit] NOT NULL,
	[TC] [char](11) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[SchoolID] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoleMapping]    Script Date: 9.04.2022 19:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoleMapping](
	[UserRoleMappingID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_UserRoleMapping] PRIMARY KEY CLUSTERED 
(
	[UserRoleMappingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comment] ADD  CONSTRAINT [DF_Comment_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Comment] ADD  CONSTRAINT [DF_Comment_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Post] ADD  CONSTRAINT [DF_Post_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_School] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[School] ([SchoolID])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_School]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Post] FOREIGN KEY([PostID])
REFERENCES [dbo].[Post] ([PostID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Post]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Users]
GO
ALTER TABLE [dbo].[File]  WITH CHECK ADD  CONSTRAINT [FK_File_Post] FOREIGN KEY([PostID])
REFERENCES [dbo].[Post] ([PostID])
GO
ALTER TABLE [dbo].[File] CHECK CONSTRAINT [FK_File_Post]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_School] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[School] ([SchoolID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_School]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Users]
GO
ALTER TABLE [dbo].[SiteRolMapping]  WITH CHECK ADD  CONSTRAINT [FK_SiteRolMapping_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[SiteRolMapping] CHECK CONSTRAINT [FK_SiteRolMapping_Roles]
GO
ALTER TABLE [dbo].[SiteRolMapping]  WITH CHECK ADD  CONSTRAINT [FK_SiteRolMapping_SiteMenu] FOREIGN KEY([SitemenuID])
REFERENCES [dbo].[SiteMenu] ([SiteID])
GO
ALTER TABLE [dbo].[SiteRolMapping] CHECK CONSTRAINT [FK_SiteRolMapping_SiteMenu]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Class]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_File] FOREIGN KEY([UserImgID])
REFERENCES [dbo].[File] ([FileID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_File]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_School] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[School] ([SchoolID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_School]
GO
ALTER TABLE [dbo].[UserRoleMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleMapping_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[UserRoleMapping] CHECK CONSTRAINT [FK_UserRoleMapping_Roles]
GO
ALTER TABLE [dbo].[UserRoleMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleMapping_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserRoleMapping] CHECK CONSTRAINT [FK_UserRoleMapping_Users]
GO
USE [master]
GO
ALTER DATABASE [cmsDb] SET  READ_WRITE 
GO
