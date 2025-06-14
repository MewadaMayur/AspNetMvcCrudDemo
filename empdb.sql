USE [master]
GO
/****** Object:  Database [empdb]    Script Date: 13-06-2025 00:56:41 ******/
CREATE DATABASE [empdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'empdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MAYURMEWADA\MSSQL\DATA\empdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'empdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MAYURMEWADA\MSSQL\DATA\empdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [empdb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [empdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [empdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [empdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [empdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [empdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [empdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [empdb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [empdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [empdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [empdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [empdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [empdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [empdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [empdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [empdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [empdb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [empdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [empdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [empdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [empdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [empdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [empdb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [empdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [empdb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [empdb] SET  MULTI_USER 
GO
ALTER DATABASE [empdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [empdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [empdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [empdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [empdb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [empdb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [empdb] SET QUERY_STORE = ON
GO
ALTER DATABASE [empdb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [empdb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 13-06-2025 00:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 13-06-2025 00:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Position] [nvarchar](max) NOT NULL,
	[Salary] [decimal](18, 2) NOT NULL,
	[DateOfJoining] [datetime2](7) NOT NULL,
	[Department] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [Name], [Position], [Salary], [DateOfJoining], [Department], [Email], [PhoneNumber], [Address]) VALUES (1, N'Mayur', N'Asp.net ', CAST(100000.00 AS Decimal(18, 2)), CAST(N'2025-08-27T00:00:00.0000000' AS DateTime2), N'Development', N'mayur@gmail.com', N'81282741015', N'68, umiyanagar society')
INSERT [dbo].[Employees] ([Id], [Name], [Position], [Salary], [DateOfJoining], [Department], [Email], [PhoneNumber], [Address]) VALUES (2, N'Mayur', N'Asp.net ', CAST(100000.00 AS Decimal(18, 2)), CAST(N'2025-08-27T00:00:00.0000000' AS DateTime2), N'Development', N'mayur@gmail.com', N'81282741015', N'68, umiyanagar society')
INSERT [dbo].[Employees] ([Id], [Name], [Position], [Salary], [DateOfJoining], [Department], [Email], [PhoneNumber], [Address]) VALUES (3, N'Mayur', N'Asp.net ', CAST(100000.00 AS Decimal(18, 2)), CAST(N'2025-08-27T00:00:00.0000000' AS DateTime2), N'Development', N'mayur@gmail.com', N'81282741015', N'68, umiyanagar society')
INSERT [dbo].[Employees] ([Id], [Name], [Position], [Salary], [DateOfJoining], [Department], [Email], [PhoneNumber], [Address]) VALUES (6, N'Mayur', N'Asp.net ', CAST(100000.00 AS Decimal(18, 2)), CAST(N'2025-08-27T00:00:00.0000000' AS DateTime2), N'Development', N'mayur@gmail.com', N'81282741015', N'68, umiyanagar society')
INSERT [dbo].[Employees] ([Id], [Name], [Position], [Salary], [DateOfJoining], [Department], [Email], [PhoneNumber], [Address]) VALUES (7, N'Mayur', N'Asp.net ', CAST(100000.00 AS Decimal(18, 2)), CAST(N'2025-08-27T00:00:00.0000000' AS DateTime2), N'Development', N'mayur@gmail.com', N'81282741015', N'68, umiyanagar society')
INSERT [dbo].[Employees] ([Id], [Name], [Position], [Salary], [DateOfJoining], [Department], [Email], [PhoneNumber], [Address]) VALUES (15, N'Mayur', N'Asp.net ', CAST(100000.00 AS Decimal(18, 2)), CAST(N'2025-07-28T00:00:00.0000000' AS DateTime2), N'Development', N'mayur@gmail.com', N'81282741015', N'68, umiyanagar society')
INSERT [dbo].[Employees] ([Id], [Name], [Position], [Salary], [DateOfJoining], [Department], [Email], [PhoneNumber], [Address]) VALUES (25, N'Mewada', N'CEO', CAST(14000.00 AS Decimal(18, 2)), CAST(N'2025-06-13T00:00:00.0000000' AS DateTime2), N'Photography', N'mayur@gmail.com', N'14526336', N'testing')
INSERT [dbo].[Employees] ([Id], [Name], [Position], [Salary], [DateOfJoining], [Department], [Email], [PhoneNumber], [Address]) VALUES (27, N'Priyanshu', N'CTO', CAST(14000.00 AS Decimal(18, 2)), CAST(N'2012-10-25T00:00:00.0000000' AS DateTime2), N'Sales', N'mayur@gmail.com', N'1234567890', N'tests')
INSERT [dbo].[Employees] ([Id], [Name], [Position], [Salary], [DateOfJoining], [Department], [Email], [PhoneNumber], [Address]) VALUES (28, N'Vipul', N'Account', CAST(12000.00 AS Decimal(18, 2)), CAST(N'2025-06-13T00:00:00.0000000' AS DateTime2), N'Sales', N'mayur@gmail.com', N'123456', N'atedced')
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
/****** Object:  StoredProcedure [dbo].[Employee_Add_SP]    Script Date: 13-06-2025 00:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Employee_Add_SP]
@Name  nvarchar(30) =null,
@Position nvarchar(30)=null,
@Salary decimal(18,2)=null,
@DateOfJoining  datetime2=null,
@Department nvarchar(30)=null,
@Email nvarchar(30)=null,
@PhoneNumber nvarchar(30)=null,
@Address nvarchar(200)=null
AS
BEGIN

INSERT INTO [dbo].[Employees]
           ([Name],[Position],[Salary],[DateOfJoining]
           ,[Department],[Email],[PhoneNumber],[Address])
     VALUES
           (@Name,@Position,@Salary,@DateOfJoining,@Department,
		   @Email,@PhoneNumber,@Address)
END
GO
/****** Object:  StoredProcedure [dbo].[Employee_Delete_SP]    Script Date: 13-06-2025 00:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Employee_Delete_SP] 
	@Id int =0
AS
BEGIN
	
	Delete from Employees where id = @Id;
    
END
GO
/****** Object:  StoredProcedure [dbo].[Employee_Get_All_SP]    Script Date: 13-06-2025 00:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Employee_Get_All_SP]
	
AS
BEGIN
	

	SELECT *,CONVERT(VARCHAR(10),DateOfJoining,103) as DateOfJoining1 FROM Employees 
	ORDER BY Id DESC


END
GO
/****** Object:  StoredProcedure [dbo].[Employee_Get_By_Id_SP]    Script Date: 13-06-2025 00:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Employee_Get_By_Id_SP]
	@Id int =0
AS
BEGIN
	SET NOCOUNT ON;

	SELECT *,CONVERT(VARCHAR(10),DateOfJoining,103) as DateOfJoining1 FROM Employees 
	where Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[Employee_Update_SP]    Script Date: 13-06-2025 00:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Employee_Update_SP]
@Id int =null,
	@Name  nvarchar(30) =null,
@Position nvarchar(30)=null,
@Salary decimal(18,2)=null,
@DateOfJoining  datetime2=null,
@Department nvarchar(30)=null,
@Email nvarchar(30)=null,
@PhoneNumber nvarchar(30)=null,
@Address nvarchar(200)=null
AS
BEGIN
	
		UPDATE [dbo].[Employees]
		SET [Name] = @Name
      ,[Position] = @Position
      ,[Salary] = @Salary
      ,[DateOfJoining] = @DateOfJoining
      ,[Department] = @Department
      ,[Email] = @Email
      ,[PhoneNumber] =@PhoneNumber,
      [Address] = @Address
		WHERE Id = @Id



END
GO
USE [master]
GO
ALTER DATABASE [empdb] SET  READ_WRITE 
GO
