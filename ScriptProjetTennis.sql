USE [master]
GO
/****** Object:  Database [TennisProjet]    Script Date: 29/11/2023 16:12:08 ******/
CREATE DATABASE [TennisProjet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TennisProjet', FILENAME = N'C:\Users\noaht\TennisProjet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TennisProjet_log', FILENAME = N'C:\Users\noaht\TennisProjet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TennisProjet] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TennisProjet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TennisProjet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TennisProjet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TennisProjet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TennisProjet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TennisProjet] SET ARITHABORT OFF 
GO
ALTER DATABASE [TennisProjet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TennisProjet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TennisProjet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TennisProjet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TennisProjet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TennisProjet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TennisProjet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TennisProjet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TennisProjet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TennisProjet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TennisProjet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TennisProjet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TennisProjet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TennisProjet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TennisProjet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TennisProjet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TennisProjet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TennisProjet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TennisProjet] SET  MULTI_USER 
GO
ALTER DATABASE [TennisProjet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TennisProjet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TennisProjet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TennisProjet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TennisProjet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TennisProjet] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TennisProjet] SET QUERY_STORE = OFF
GO
USE [TennisProjet]
GO
/****** Object:  Table [dbo].[Court]    Script Date: 29/11/2023 16:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Court](
	[Id_Court] [int] IDENTITY(1,1) NOT NULL,
	[nbSpectators] [int] NULL,
	[covered] [bit] NULL,
	[Id_Tournament] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Court] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[matchs]    Script Date: 29/11/2023 16:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[matchs](
	[Id_Match] [int] IDENTITY(1,1) NOT NULL,
	[date_match] [date] NULL,
	[duration] [time](7) NULL,
	[round] [int] NULL,
	[Id_Person] [int] NULL,
	[Id_Court] [int] NULL,
	[Id_Schedule] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Match] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opponent]    Script Date: 29/11/2023 16:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opponent](
	[Id_Opponent] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Opponent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 29/11/2023 16:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id_Person] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](50) NULL,
	[lastname] [varchar](50) NULL,
	[nationality] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Person] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Play]    Script Date: 29/11/2023 16:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Play](
	[Id_Match] [int] NOT NULL,
	[Id_Opponent] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Match] ASC,
	[Id_Opponent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Player]    Script Date: 29/11/2023 16:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Player](
	[Id_Person] [int] NOT NULL,
	[ranking] [int] NULL,
	[gender] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Person] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Referee]    Script Date: 29/11/2023 16:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Referee](
	[Id_Person] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Person] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefereeTournament]    Script Date: 29/11/2023 16:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefereeTournament](
	[Id_Tournament] [int] NOT NULL,
	[Id_Person] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Tournament] ASC,
	[Id_Person] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 29/11/2023 16:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[Id_Schedule] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NULL,
	[actualRound] [int] NULL,
	[Id_Tournament] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Schedule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sets]    Script Date: 29/11/2023 16:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sets](
	[Id_Set] [int] IDENTITY(1,1) NOT NULL,
	[ScoreOp1] [int] NULL,
	[ScoreOp2] [int] NULL,
	[winner] [int] NULL,
	[Id_Match] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Set] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuperTieBreak]    Script Date: 29/11/2023 16:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuperTieBreak](
	[Id_Set] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Set] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 29/11/2023 16:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[Id_Opponent] [int] NOT NULL,
	[Id_Person] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Opponent] ASC,
	[Id_Person] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tournament]    Script Date: 29/11/2023 16:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tournament](
	[Id_Tournament] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Tournament] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Court] ON 

INSERT [dbo].[Court] ([Id_Court], [nbSpectators], [covered], [Id_Tournament]) VALUES (1, 5000, 1, 1)
INSERT [dbo].[Court] ([Id_Court], [nbSpectators], [covered], [Id_Tournament]) VALUES (2, 7000, 0, 1)
INSERT [dbo].[Court] ([Id_Court], [nbSpectators], [covered], [Id_Tournament]) VALUES (3, 6000, 1, 1)
INSERT [dbo].[Court] ([Id_Court], [nbSpectators], [covered], [Id_Tournament]) VALUES (4, 8000, 0, 1)
INSERT [dbo].[Court] ([Id_Court], [nbSpectators], [covered], [Id_Tournament]) VALUES (5, 5500, 1, 1)
INSERT [dbo].[Court] ([Id_Court], [nbSpectators], [covered], [Id_Tournament]) VALUES (6, 7200, 0, 1)
INSERT [dbo].[Court] ([Id_Court], [nbSpectators], [covered], [Id_Tournament]) VALUES (7, 6800, 1, 1)
SET IDENTITY_INSERT [dbo].[Court] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (81, N'John', N'Doe', N'American')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (82, N'Robert', N'Smith', N'Canadian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (83, N'Michael', N'Johnson', N'British')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (84, N'William', N'Brown', N'Australian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (85, N'David', N'Davis', N'Irish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (86, N'Richard', N'Miller', N'French')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (87, N'Joseph', N'Jones', N'German')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (88, N'Thomas', N'Wilson', N'Italian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (89, N'Charles', N'Moore', N'Spanish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (90, N'Christopher', N'Taylor', N'Japanese')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (91, N'Daniel', N'Anderson', N'Chinese')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (92, N'Matthew', N'White', N'Russian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (93, N'Anthony', N'Martin', N'Brazilian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (94, N'Mark', N'Thompson', N'Mexican')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (95, N'Paul', N'Harris', N'Indian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (96, N'Steven', N'Young', N'South African')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (97, N'Andrew', N'Allen', N'Swedish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (98, N'Kenneth', N'Scott', N'Norwegian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (99, N'Joshua', N'Walker', N'Danish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (100, N'Brian', N'King', N'Dutch')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (101, N'James', N'Evans', N'Canadian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (102, N'Ryan', N'Murphy', N'Australian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (103, N'Eric', N'Clark', N'Irish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (104, N'George', N'Turner', N'French')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (105, N'Benjamin', N'Cooper', N'German')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (106, N'Jack', N'Ward', N'Italian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (107, N'Samuel', N'Barnes', N'Spanish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (108, N'Nathan', N'Fisher', N'Japanese')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (109, N'Edward', N'Perry', N'Chinese')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (110, N'Harry', N'Murray', N'Russian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (111, N'Frank', N'Simmons', N'Brazilian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (112, N'Raymond', N'Lopez', N'Mexican')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (113, N'Joseph', N'Carter', N'Indian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (114, N'Jonathan', N'Baker', N'South African')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (115, N'Alex', N'Bryant', N'Swedish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (116, N'Peter', N'Reed', N'Norwegian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (117, N'Kevin', N'Wood', N'Danish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (118, N'Dylan', N'Taylor', N'Dutch')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (119, N'Oscar', N'Hill', N'Scottish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (120, N'Victor', N'Gordon', N'New Zealander')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (121, N'Leo', N'Hudson', N'Australian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (122, N'Mason', N'Wells', N'Irish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (123, N'Caleb', N'Fletcher', N'French')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (124, N'Harrison', N'Sullivan', N'German')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (125, N'Max', N'Barrett', N'Italian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (126, N'Logan', N'Lloyd', N'Spanish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (127, N'Elijah', N'Russell', N'Japanese')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (128, N'Gavin', N'Porter', N'Chinese')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (129, N'Leo', N'Watts', N'Russian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (130, N'Eli', N'Bowen', N'Brazilian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (131, N'Carter', N'Hammond', N'Mexican')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (132, N'Luke', N'Black', N'Indian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (133, N'Liam', N'Fleming', N'South African')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (134, N'Owen', N'Floyd', N'Swedish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (135, N'Wyatt', N'Webster', N'Norwegian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (136, N'Isaac', N'Tate', N'Danish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (137, N'Ezra', N'Lambert', N'Dutch')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (138, N'Jaxon', N'Ferguson', N'Scottish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (139, N'Landon', N'Morton', N'New Zealander')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (140, N'Sebastian', N'Howe', N'Swiss')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (141, N'Ethan', N'Adams', N'Canadian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (142, N'Oliver', N'Murray', N'Australian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (143, N'Dylan', N'Gibson', N'Irish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (144, N'Hunter', N'Howell', N'French')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (145, N'Aaron', N'Gardner', N'German')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (146, N'Bentley', N'Hart', N'Italian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (147, N'Colton', N'Newton', N'Spanish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (148, N'Dominic', N'Wallace', N'Japanese')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (149, N'Elias', N'Warren', N'Chinese')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (150, N'Finn', N'Crawford', N'Russian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (151, N'Grayson', N'Dixon', N'Brazilian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (152, N'Hudson', N'Hayes', N'Mexican')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (153, N'Isaiah', N'Fisher', N'Indian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (154, N'Jaxson', N'Holland', N'South African')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (155, N'Kai', N'Nash', N'Swedish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (156, N'Miles', N'Barker', N'Norwegian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (157, N'Nolan', N'Vaughn', N'Danish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (158, N'Parker', N'Hendrix', N'Dutch')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (159, N'Quinn', N'York', N'Scottish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (160, N'Ryder', N'Kane', N'New Zealander')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (161, N'Sawyer', N'Huffman', N'Canadian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (162, N'Damian', N'Gilbert', N'Australian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (163, N'Arthur', N'Wilder', N'Irish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (164, N'Bryson', N'Blevins', N'French')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (165, N'Louis', N'Sears', N'German')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (166, N'Silas', N'Parrish', N'Italian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (167, N'Taylor', N'Burris', N'Spanish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (168, N'Wesley', N'Sellers', N'Japanese')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (169, N'Zane', N'Morse', N'Chinese')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (170, N'Austin', N'Rangel', N'Russian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (171, N'Elliott', N'Byrd', N'Brazilian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (172, N'Micah', N'Cordova', N'Mexican')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (173, N'Ronin', N'Baird', N'Indian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (174, N'Tobias', N'Santiago', N'South African')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (175, N'Abel', N'Jennings', N'Swedish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (176, N'Beckett', N'Faulkner', N'Norwegian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (177, N'Cohen', N'Beard', N'Danish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (178, N'Dawson', N'Mcguire', N'Dutch')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (179, N'Emmett', N'Dickson', N'Scottish')
GO
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (180, N'Gideon', N'Graves', N'New Zealander')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (181, N'Hugo', N'Floyd', N'Canadian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (182, N'Ezekiel', N'Hodge', N'Australian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (183, N'Kieran', N'Noble', N'Irish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (184, N'Luka', N'Holman', N'French')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (185, N'Maximus', N'Valentine', N'German')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (186, N'Noel', N'Madden', N'Italian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (187, N'Omar', N'Baxter', N'Spanish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (188, N'Pierce', N'Kaiser', N'Japanese')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (189, N'Quincy', N'Meadows', N'Chinese')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (190, N'Rory', N'Mullen', N'Russian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (191, N'Sullivan', N'Frost', N'Brazilian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (192, N'Tristan', N'Potts', N'Mexican')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (193, N'Uriah', N'Velasquez', N'Indian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (194, N'Vance', N'Nash', N'South African')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (195, N'Weston', N'Bowman', N'Swedish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (196, N'Xander', N'Gentry', N'Norwegian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (197, N'Yusuf', N'Lindsay', N'Danish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (198, N'Zayn', N'Mcpherson', N'Dutch')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (199, N'Caspian', N'Wolfe', N'Canadian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (200, N'Atlas', N'Hendrix', N'Australian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (201, N'Jensen', N'Bentley', N'Irish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (202, N'Cameron', N'Dixon', N'French')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (203, N'Knox', N'Mercer', N'German')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (204, N'Kaius', N'Whittaker', N'Italian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (205, N'Lachlan', N'Burgess', N'Spanish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (206, N'Orion', N'Hancock', N'Japanese')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (207, N'Ryker', N'Mccormick', N'Chinese')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (208, N'Soren', N'Dickinson', N'Russian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (209, N'Emma', N'Smith', N'American')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (210, N'Sophia', N'Johnson', N'Canadian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (211, N'Olivia', N'Williams', N'British')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (212, N'Ava', N'Jones', N'Australian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (213, N'Isabella', N'Brown', N'Irish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (214, N'Mia', N'Miller', N'French')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (215, N'Amelia', N'Davis', N'German')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (216, N'Harper', N'Moore', N'Italian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (217, N'Evelyn', N'Taylor', N'Spanish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (218, N'Abigail', N'Anderson', N'Japanese')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (219, N'Ella', N'White', N'Chinese')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (220, N'Scarlett', N'Martin', N'Russian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (221, N'Grace', N'Thompson', N'Brazilian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (222, N'Lily', N'Harris', N'Mexican')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (223, N'Chloe', N'Young', N'Indian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (224, N'Zoe', N'Allen', N'South African')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (225, N'Aria', N'Scott', N'Swedish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (226, N'Leah', N'Baker', N'Norwegian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (227, N'Mila', N'Bryant', N'Danish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (228, N'Eleanor', N'Reed', N'Dutch')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (229, N'Hannah', N'King', N'Scottish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (230, N'Addison', N'Evans', N'New Zealander')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (231, N'Brooklyn', N'Murphy', N'Swiss')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (232, N'Victoria', N'Clark', N'Canadian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (233, N'Sofia', N'Turner', N'Australian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (234, N'Aubrey', N'Cooper', N'Irish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (235, N'Lily', N'Ward', N'French')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (236, N'Zoey', N'Barnes', N'German')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (237, N'Hazel', N'Fisher', N'Italian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (238, N'Nora', N'Perry', N'Spanish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (239, N'Scarlet', N'Murray', N'Japanese')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (240, N'Penelope', N'Simmons', N'Chinese')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (241, N'Aurora', N'Lopez', N'Russian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (242, N'Stella', N'Carter', N'Brazilian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (243, N'Nova', N'Thompson', N'Mexican')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (244, N'Emilia', N'Harris', N'Indian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (245, N'Everly', N'Young', N'South African')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (246, N'Aaliyah', N'Allen', N'Swedish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (247, N'Madison', N'Scott', N'Norwegian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (248, N'Elena', N'Taylor', N'Danish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (249, N'Skylar', N'Walker', N'Dutch')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (250, N'Taylor', N'Hill', N'Scottish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (251, N'Aubree', N'Gordon', N'New Zealander')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (252, N'Ariana', N'Hudson', N'Australian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (253, N'Kaylee', N'Wells', N'Irish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (254, N'Aaliyah', N'Fletcher', N'French')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (255, N'Natalie', N'Sullivan', N'German')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (256, N'Luna', N'Barrett', N'Italian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (257, N'Savannah', N'Lloyd', N'Spanish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (258, N'Ellie', N'Russell', N'Japanese')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (259, N'Arianna', N'Porter', N'Chinese')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (260, N'Cora', N'Watts', N'Russian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (261, N'Madeline', N'Bowen', N'Brazilian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (262, N'Kinsley', N'Hammond', N'Mexican')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (263, N'Ruby', N'Black', N'Indian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (264, N'Ariella', N'Fleming', N'South African')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (265, N'Eva', N'Floyd', N'Swedish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (266, N'Autumn', N'Webster', N'Norwegian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (267, N'Piper', N'Tate', N'Danish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (268, N'Gianna', N'Lambert', N'Dutch')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (269, N'Isabelle', N'Ferguson', N'Scottish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (270, N'Zara', N'Morton', N'New Zealander')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (271, N'Charlie', N'Howe', N'Swiss')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (272, N'Sadie', N'Adams', N'Canadian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (273, N'Lucy', N'Murray', N'Australian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (274, N'Eleanor', N'Gilbert', N'Irish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (275, N'Penelope', N'Howell', N'French')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (276, N'Lillian', N'Gardner', N'German')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (277, N'Sophie', N'Hart', N'Italian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (278, N'Willow', N'Newton', N'Spanish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (279, N'Hannah', N'Wallace', N'Japanese')
GO
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (280, N'Nevaeh', N'Warren', N'Chinese')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (281, N'Leilani', N'Crawford', N'Russian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (282, N'Mackenzie', N'Dixon', N'Brazilian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (283, N'Paisley', N'Hayes', N'Mexican')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (284, N'Aria', N'Fisher', N'Indian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (285, N'Elliana', N'Holland', N'South African')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (286, N'Kylie', N'Nash', N'Swedish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (287, N'Aubrey', N'Barker', N'Norwegian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (288, N'Stella', N'Vaughn', N'Danish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (289, N'Clara', N'Hendrix', N'Dutch')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (290, N'Violet', N'York', N'Scottish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (291, N'Avery', N'Kane', N'New Zealander')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (292, N'Leah', N'Huffman', N'Canadian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (293, N'Scarlett', N'Murray', N'Australian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (294, N'Peyton', N'Gilbert', N'Irish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (295, N'Haley', N'Howell', N'French')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (296, N'Eva', N'Gardner', N'German')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (297, N'Madelyn', N'Hart', N'Italian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (298, N'Brielle', N'Newton', N'Spanish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (299, N'Samantha', N'Wallace', N'Japanese')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (300, N'Aaliyah', N'Warren', N'Chinese')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (301, N'Adeline', N'Crawford', N'Russian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (302, N'Sophia', N'Dixon', N'Brazilian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (303, N'Lily', N'Hayes', N'Mexican')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (304, N'Everleigh', N'Fisher', N'Indian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (305, N'Lyla', N'Holland', N'South African')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (306, N'Ariana', N'Nash', N'Swedish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (307, N'Addison', N'Barker', N'Norwegian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (308, N'Elena', N'Vaughn', N'Danish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (309, N'Mia', N'Hendrix', N'Dutch')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (310, N'Hazel', N'York', N'Scottish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (311, N'Aurora', N'Kane', N'New Zealander')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (312, N'Emma', N'Wolfe', N'Canadian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (313, N'Sophia', N'Hendrix', N'Australian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (314, N'Olivia', N'Bentley', N'Irish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (315, N'Ava', N'Dixon', N'French')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (316, N'Isabella', N'Mercer', N'German')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (317, N'Mia', N'Whittaker', N'Italian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (318, N'Amelia', N'Burgess', N'Spanish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (319, N'Harper', N'Hancock', N'Japanese')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (320, N'Evelyn', N'Mccormick', N'Chinese')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (321, N'Abigail', N'Fleming', N'Russian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (322, N'Emma', N'Hodge', N'Brazilian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (323, N'Sophia', N'Noble', N'Mexican')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (324, N'Olivia', N'Holman', N'Indian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (325, N'Ava', N'Valentine', N'South African')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (326, N'Isabella', N'Madden', N'Swedish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (327, N'Mia', N'Parrish', N'Norwegian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (328, N'Amelia', N'Burris', N'Danish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (329, N'Harper', N'Sellers', N'Dutch')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (330, N'Evelyn', N'Morse', N'Scottish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (331, N'Abigail', N'Rangel', N'New Zealander')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (332, N'Ella', N'Byrd', N'Swiss')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (333, N'Scarlett', N'Cordova', N'Canadian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (334, N'Grace', N'Baird', N'Australian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (335, N'Lily', N'Santiago', N'Irish')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (336, N'Chloe', N'Jennings', N'French')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (337, N'Emily', N'Johnson', N'American')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (338, N'Alexander', N'Smith', N'Canadian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (339, N'Grace', N'Williams', N'British')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (340, N'Daniel', N'Brown', N'Australian')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (341, N'Sophie', N'Miller', N'French')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (342, N'William', N'Davis', N'German')
INSERT [dbo].[Person] ([Id_Person], [firstname], [lastname], [nationality]) VALUES (343, N'Olivia', N'Moore', N'Italian')
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (81, 1, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (82, 2, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (83, 3, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (84, 4, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (85, 5, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (86, 6, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (87, 7, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (88, 8, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (89, 9, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (90, 10, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (91, 11, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (92, 12, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (93, 13, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (94, 14, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (95, 15, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (96, 16, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (97, 17, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (98, 18, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (99, 19, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (100, 20, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (101, 21, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (102, 22, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (103, 23, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (104, 24, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (105, 25, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (106, 26, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (107, 27, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (108, 28, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (109, 29, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (110, 30, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (111, 31, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (112, 32, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (113, 33, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (114, 34, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (115, 35, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (116, 36, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (117, 37, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (118, 38, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (119, 39, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (120, 40, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (121, 41, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (122, 42, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (123, 43, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (124, 44, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (125, 45, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (126, 46, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (127, 47, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (128, 48, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (129, 49, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (130, 50, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (131, 51, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (132, 52, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (133, 53, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (134, 54, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (135, 55, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (136, 56, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (137, 57, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (138, 58, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (139, 59, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (140, 60, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (141, 61, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (142, 62, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (143, 63, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (144, 64, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (145, 65, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (146, 66, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (147, 67, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (148, 68, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (149, 69, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (150, 70, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (151, 71, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (152, 72, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (153, 73, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (154, 74, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (155, 75, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (156, 76, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (157, 77, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (158, 78, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (159, 79, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (160, 80, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (161, 81, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (162, 82, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (163, 83, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (164, 84, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (165, 85, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (166, 86, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (167, 87, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (168, 88, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (169, 89, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (170, 90, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (171, 91, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (172, 92, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (173, 93, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (174, 94, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (175, 95, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (176, 96, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (177, 97, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (178, 98, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (179, 99, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (180, 100, N'Male')
GO
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (181, 101, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (182, 102, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (183, 103, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (184, 104, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (185, 105, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (186, 106, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (187, 107, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (188, 108, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (189, 109, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (190, 110, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (191, 111, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (192, 112, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (193, 113, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (194, 114, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (195, 115, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (196, 116, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (197, 117, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (198, 118, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (199, 119, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (200, 120, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (201, 121, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (202, 122, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (203, 123, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (204, 124, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (205, 125, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (206, 126, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (207, 127, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (208, 128, N'Male')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (209, 1, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (210, 2, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (211, 3, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (212, 4, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (213, 5, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (214, 6, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (215, 7, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (216, 8, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (217, 9, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (218, 10, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (219, 11, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (220, 12, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (221, 13, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (222, 14, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (223, 15, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (224, 16, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (225, 17, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (226, 18, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (227, 19, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (228, 20, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (229, 21, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (230, 22, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (231, 23, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (232, 24, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (233, 25, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (234, 26, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (235, 27, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (236, 28, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (237, 29, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (238, 30, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (239, 31, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (240, 32, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (241, 33, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (242, 34, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (243, 35, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (244, 36, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (245, 37, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (246, 38, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (247, 39, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (248, 40, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (249, 41, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (250, 42, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (251, 43, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (252, 44, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (253, 45, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (254, 46, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (255, 47, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (256, 48, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (257, 49, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (258, 50, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (259, 51, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (260, 52, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (261, 53, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (262, 54, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (263, 55, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (264, 56, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (265, 57, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (266, 58, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (267, 59, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (268, 60, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (269, 61, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (270, 62, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (271, 63, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (272, 64, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (273, 65, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (274, 66, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (275, 67, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (276, 68, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (277, 69, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (278, 70, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (279, 71, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (280, 72, N'Female')
GO
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (281, 73, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (282, 74, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (283, 75, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (284, 76, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (285, 77, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (286, 78, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (287, 79, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (288, 80, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (289, 81, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (290, 82, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (291, 83, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (292, 84, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (293, 85, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (294, 86, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (295, 87, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (296, 88, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (297, 89, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (298, 90, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (299, 91, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (300, 92, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (301, 93, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (302, 94, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (303, 95, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (304, 96, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (305, 97, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (306, 98, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (307, 99, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (308, 100, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (309, 101, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (310, 102, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (311, 103, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (312, 104, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (313, 105, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (314, 106, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (315, 107, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (316, 108, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (317, 109, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (318, 110, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (319, 111, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (320, 112, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (321, 113, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (322, 114, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (323, 115, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (324, 116, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (325, 117, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (326, 118, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (327, 119, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (328, 120, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (329, 121, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (330, 122, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (331, 123, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (332, 124, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (333, 125, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (334, 126, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (335, 127, N'Female')
INSERT [dbo].[Player] ([Id_Person], [ranking], [gender]) VALUES (336, 128, N'Female')
GO
INSERT [dbo].[Referee] ([Id_Person]) VALUES (337)
INSERT [dbo].[Referee] ([Id_Person]) VALUES (338)
INSERT [dbo].[Referee] ([Id_Person]) VALUES (339)
INSERT [dbo].[Referee] ([Id_Person]) VALUES (340)
INSERT [dbo].[Referee] ([Id_Person]) VALUES (341)
INSERT [dbo].[Referee] ([Id_Person]) VALUES (342)
INSERT [dbo].[Referee] ([Id_Person]) VALUES (343)
GO
SET IDENTITY_INSERT [dbo].[Tournament] ON 

INSERT [dbo].[Tournament] ([Id_Tournament], [name]) VALUES (1, N'Roland Garos')
SET IDENTITY_INSERT [dbo].[Tournament] OFF
GO
/****** Object:  Index [UQ__matchs__3DA6187319C6ABC8]    Script Date: 29/11/2023 16:12:09 ******/
ALTER TABLE [dbo].[matchs] ADD UNIQUE NONCLUSTERED 
(
	[Id_Person] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__matchs__F19C50AE959AD829]    Script Date: 29/11/2023 16:12:09 ******/
ALTER TABLE [dbo].[matchs] ADD UNIQUE NONCLUSTERED 
(
	[Id_Court] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Court]  WITH CHECK ADD FOREIGN KEY([Id_Tournament])
REFERENCES [dbo].[Tournament] ([Id_Tournament])
GO
ALTER TABLE [dbo].[matchs]  WITH CHECK ADD FOREIGN KEY([Id_Court])
REFERENCES [dbo].[Court] ([Id_Court])
GO
ALTER TABLE [dbo].[matchs]  WITH CHECK ADD FOREIGN KEY([Id_Person])
REFERENCES [dbo].[Referee] ([Id_Person])
GO
ALTER TABLE [dbo].[matchs]  WITH CHECK ADD FOREIGN KEY([Id_Schedule])
REFERENCES [dbo].[Schedule] ([Id_Schedule])
GO
ALTER TABLE [dbo].[Play]  WITH CHECK ADD FOREIGN KEY([Id_Match])
REFERENCES [dbo].[matchs] ([Id_Match])
GO
ALTER TABLE [dbo].[Play]  WITH CHECK ADD FOREIGN KEY([Id_Opponent])
REFERENCES [dbo].[Opponent] ([Id_Opponent])
GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD FOREIGN KEY([Id_Person])
REFERENCES [dbo].[Person] ([Id_Person])
GO
ALTER TABLE [dbo].[Referee]  WITH CHECK ADD FOREIGN KEY([Id_Person])
REFERENCES [dbo].[Person] ([Id_Person])
GO
ALTER TABLE [dbo].[RefereeTournament]  WITH CHECK ADD FOREIGN KEY([Id_Person])
REFERENCES [dbo].[Referee] ([Id_Person])
GO
ALTER TABLE [dbo].[RefereeTournament]  WITH CHECK ADD FOREIGN KEY([Id_Tournament])
REFERENCES [dbo].[Tournament] ([Id_Tournament])
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD FOREIGN KEY([Id_Tournament])
REFERENCES [dbo].[Tournament] ([Id_Tournament])
GO
ALTER TABLE [dbo].[Sets]  WITH CHECK ADD FOREIGN KEY([Id_Match])
REFERENCES [dbo].[matchs] ([Id_Match])
GO
ALTER TABLE [dbo].[Sets]  WITH CHECK ADD FOREIGN KEY([winner])
REFERENCES [dbo].[Opponent] ([Id_Opponent])
GO
ALTER TABLE [dbo].[SuperTieBreak]  WITH CHECK ADD FOREIGN KEY([Id_Set])
REFERENCES [dbo].[Sets] ([Id_Set])
GO
ALTER TABLE [dbo].[Team]  WITH CHECK ADD FOREIGN KEY([Id_Opponent])
REFERENCES [dbo].[Opponent] ([Id_Opponent])
GO
ALTER TABLE [dbo].[Team]  WITH CHECK ADD FOREIGN KEY([Id_Person])
REFERENCES [dbo].[Player] ([Id_Person])
GO
USE [master]
GO
ALTER DATABASE [TennisProjet] SET  READ_WRITE 
GO
