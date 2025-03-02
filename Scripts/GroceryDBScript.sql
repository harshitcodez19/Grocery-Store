USE [master]
GO
/****** Object:  Database [GroceryStoreDB]    Script Date: 19-06-2023 22:59:15 ******/
CREATE DATABASE [GroceryStoreDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GroceryStoreDB', FILENAME = N'C:\Users\harshitsharma01\GroceryStoreDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GroceryStoreDB_log', FILENAME = N'C:\Users\harshitsharma01\GroceryStoreDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GroceryStoreDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GroceryStoreDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GroceryStoreDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GroceryStoreDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GroceryStoreDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GroceryStoreDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GroceryStoreDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [GroceryStoreDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GroceryStoreDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GroceryStoreDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GroceryStoreDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GroceryStoreDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GroceryStoreDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GroceryStoreDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GroceryStoreDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GroceryStoreDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GroceryStoreDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GroceryStoreDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GroceryStoreDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GroceryStoreDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GroceryStoreDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GroceryStoreDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GroceryStoreDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [GroceryStoreDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GroceryStoreDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GroceryStoreDB] SET  MULTI_USER 
GO
ALTER DATABASE [GroceryStoreDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GroceryStoreDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GroceryStoreDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GroceryStoreDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GroceryStoreDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GroceryStoreDB] SET QUERY_STORE = OFF
GO
USE [GroceryStoreDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [GroceryStoreDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 19-06-2023 22:59:15 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 19-06-2023 22:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemOrdered_ProductItemId] [int] NULL,
	[ItemOrdered_ProductName] [nvarchar](max) NULL,
	[ItemOrdered_ImageUrl] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[OrderId] [int] NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 19-06-2023 22:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BuyerEmail] [nvarchar](max) NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[SubTotal] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 19-06-2023 22:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 19-06-2023 22:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[ProductCategoryID] [int] NOT NULL,
	[AvailableQuantity] [int] NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[Specification] [nvarchar](100) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230609054923_InitialCreate', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230614114345_OrderEntityAdded', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230615071233_OrderEntityAdded', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230616065207_OrderEntityAdded', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230616122444_OrderEntityAdded', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230619091716_OrderEntityAddedSecond', N'6.0.0')
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (1, 14, N'Eggs', N'images/products/eggs.jpg', CAST(229.00 AS Decimal(18, 2)), 10, 4)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (2, 14, N'Eggs', N'images/products/eggs.jpg', CAST(229.00 AS Decimal(18, 2)), 10, 5)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (3, 1, N'Tomato Ketchup', N'images/products/ketchup1.jpeg', CAST(98.00 AS Decimal(18, 2)), 3, 6)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (4, 1, N'Tomato Ketchup', N'images/products/ketchup1.jpeg', CAST(98.00 AS Decimal(18, 2)), 1, 7)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (5, 7, N'Tomato - Local, 1 kg', N'images/products/tomato.jpeg', CAST(30.91 AS Decimal(18, 2)), 1, 7)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (6, 2, N'Real Mixed fruit Juice', N'images/products/mixjuice.jpeg', CAST(150.00 AS Decimal(18, 2)), 1, 7)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (7, 1, N'Tomato Ketchup', N'images/products/ketchup1.jpeg', CAST(98.00 AS Decimal(18, 2)), 1, 8)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (8, 7, N'Tomato - Local, 1 kg', N'images/products/tomato.jpeg', CAST(30.91 AS Decimal(18, 2)), 1, 8)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (9, 2, N'Real Mixed fruit Juice', N'images/products/mixjuice.jpeg', CAST(150.00 AS Decimal(18, 2)), 1, 8)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (10, 3, N'Pringles Desi Masala Tadka Chips', N'images/products/pringles.jpg', CAST(60.00 AS Decimal(18, 2)), 1, 8)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (11, 6, N'Lettuce - Green, 100 g (Bunch)', N'images/products/lettuce.jpeg', CAST(12.00 AS Decimal(18, 2)), 1, 8)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (12, 1, N'Tomato Ketchup', N'images/products/ketchup1.jpeg', CAST(98.00 AS Decimal(18, 2)), 1, 9)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (13, 3, N'Pringles Desi Masala Tadka Chips', N'images/products/pringles.jpg', CAST(60.00 AS Decimal(18, 2)), 1, 9)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (14, 6, N'Lettuce - Green, 100 g (Bunch)', N'images/products/lettuce.jpeg', CAST(12.00 AS Decimal(18, 2)), 1, 9)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (15, 2, N'Real Mixed fruit Juice', N'images/products/mixjuice.jpeg', CAST(150.00 AS Decimal(18, 2)), 1, 9)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (16, 4, N'Parle Hide and Seek Chocolate Chip Cookies ', N'images/products/HideSeek.jpeg', CAST(105.00 AS Decimal(18, 2)), 1, 10)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (17, 6, N'Lettuce - Green, 100 g (Bunch)', N'images/products/lettuce.jpeg', CAST(12.00 AS Decimal(18, 2)), 1, 10)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (18, 2, N'Real Mixed fruit Juice', N'images/products/mixjuice.jpeg', CAST(150.00 AS Decimal(18, 2)), 1, 10)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (19, 1, N'Tomato Ketchup', N'images/products/ketchup1.jpeg', CAST(98.00 AS Decimal(18, 2)), 1, 11)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (20, 2, N'Real Mixed fruit Juice', N'images/products/mixjuice.jpeg', CAST(150.00 AS Decimal(18, 2)), 1, 11)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (21, 3, N'Pringles Desi Masala Tadka Chips', N'images/products/pringles.jpg', CAST(60.00 AS Decimal(18, 2)), 1, 11)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (22, 6, N'Lettuce - Green, 100 g (Bunch)', N'images/products/lettuce.jpeg', CAST(12.00 AS Decimal(18, 2)), 1, 11)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (23, 1, N'Tomato Ketchup', N'images/products/ketchup1.jpeg', CAST(98.00 AS Decimal(18, 2)), 1, 12)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (24, 7, N'Tomato - Local, 1 kg', N'images/products/tomato.jpeg', CAST(30.91 AS Decimal(18, 2)), 1, 12)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (25, 2, N'Real Mixed fruit Juice', N'images/products/mixjuice.jpeg', CAST(150.00 AS Decimal(18, 2)), 1, 12)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (26, 3, N'Pringles Desi Masala Tadka Chips', N'images/products/pringles.jpg', CAST(60.00 AS Decimal(18, 2)), 1, 12)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (27, 14, N'Eggs', N'images/products/eggs.jpg', CAST(229.00 AS Decimal(18, 2)), 10, 13)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (28, 1, N'Tomato Ketchup', N'images/products/ketchup1.jpeg', CAST(98.00 AS Decimal(18, 2)), 1, 14)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (29, 7, N'Tomato - Local, 1 kg', N'images/products/tomato.jpeg', CAST(30.91 AS Decimal(18, 2)), 1, 14)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (30, 7, N'Tomato - Local, 1 kg', N'images/products/tomato.jpeg', CAST(30.91 AS Decimal(18, 2)), 1, 15)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (31, 7, N'Tomato - Local, 1 kg', N'images/products/tomato.jpeg', CAST(30.91 AS Decimal(18, 2)), 1, 16)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (32, 2, N'Real Mixed fruit Juice', N'images/products/mixjuice.jpeg', CAST(150.00 AS Decimal(18, 2)), 1, 16)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (33, 7, N'Tomato - Local, 1 kg', N'images/products/tomato.jpeg', CAST(30.91 AS Decimal(18, 2)), 1, 17)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (34, 7, N'Tomato - Local, 1 kg', N'images/products/tomato.jpeg', CAST(30.91 AS Decimal(18, 2)), 1, 18)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (35, 7, N'Tomato - Local, 1 kg', N'images/products/tomato.jpeg', CAST(30.91 AS Decimal(18, 2)), 1, 19)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (36, 2, N'Real Mixed fruit Juice', N'images/products/mixjuice.jpeg', CAST(150.00 AS Decimal(18, 2)), 1, 19)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (37, 7, N'Tomato - Local, 1 kg', N'images/products/tomato.jpeg', CAST(30.91 AS Decimal(18, 2)), 1, 20)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (38, 7, N'Tomato - Local, 1 kg', N'images/products/tomato.jpeg', CAST(30.91 AS Decimal(18, 2)), 1, 21)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (39, 2, N'Real Mixed fruit Juice', N'images/products/mixjuice.jpeg', CAST(150.00 AS Decimal(18, 2)), 1, 21)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (40, 7, N'Tomato - Local, 1 kg', N'images/products/tomato.jpeg', CAST(30.91 AS Decimal(18, 2)), 1, 22)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (41, 7, N'Tomato - Local, 1 kg', N'images/products/tomato.jpeg', CAST(30.91 AS Decimal(18, 2)), 1, 23)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (42, 2, N'Real Mixed fruit Juice', N'images/products/mixjuice.jpeg', CAST(150.00 AS Decimal(18, 2)), 1, 23)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (43, 7, N'Tomato - Local, 1 kg', N'images/products/tomato.jpeg', CAST(30.91 AS Decimal(18, 2)), 1, 24)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (44, 2, N'Real Mixed fruit Juice', N'images/products/mixjuice.jpeg', CAST(150.00 AS Decimal(18, 2)), 1, 24)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (45, 7, N'Tomato - Local, 1 kg', N'images/products/tomato.jpeg', CAST(30.91 AS Decimal(18, 2)), 1, 25)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (46, 7, N'Tomato - Local, 1 kg', N'images/products/tomato.jpeg', CAST(30.91 AS Decimal(18, 2)), 1, 26)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (47, 3, N'Pringles Desi Masala Tadka Chips', N'images/products/pringles.jpg', CAST(60.00 AS Decimal(18, 2)), 1, 26)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (48, 7, N'Tomato - Local, 1 kg', N'images/products/tomato.jpeg', CAST(30.91 AS Decimal(18, 2)), 1, 27)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (49, 7, N'Tomato - Local, 1 kg', N'images/products/tomato.jpeg', CAST(30.91 AS Decimal(18, 2)), 1, 28)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (50, 7, N'Tomato - Local, 1 kg', N'images/products/tomato.jpeg', CAST(30.91 AS Decimal(18, 2)), 1, 29)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (51, 2, N'Real Mixed fruit Juice', N'images/products/mixjuice.jpeg', CAST(150.00 AS Decimal(18, 2)), 1, 29)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (52, 7, N'Tomato - Local, 1 kg', N'images/products/tomato.jpeg', CAST(30.91 AS Decimal(18, 2)), 1, 30)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (53, 2, N'Real Mixed fruit Juice', N'images/products/mixjuice.jpeg', CAST(150.00 AS Decimal(18, 2)), 1, 31)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (54, 2, N'Real Mixed fruit Juice', N'images/products/mixjuice.jpeg', CAST(150.00 AS Decimal(18, 2)), 1, 32)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (55, 7, N'Tomato - Local, 1 kg', N'images/products/tomato.jpeg', CAST(30.91 AS Decimal(18, 2)), 1, 33)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId]) VALUES (56, 11, N'Catch Shikanji Masala', N'images/products/Catch.jpeg', CAST(10.00 AS Decimal(18, 2)), 1, 34)
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (4, N'harshit@test.com', CAST(N'2023-06-15T07:15:27.9056854' AS DateTime2), CAST(2244.20 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (5, N'harshit@test.com', CAST(N'2023-06-15T11:27:22.9978593' AS DateTime2), CAST(2244.20 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (6, N'test@test.com', CAST(N'2023-06-15T12:35:34.0626467' AS DateTime2), CAST(290.18 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (7, N'test@test.com', CAST(N'2023-06-15T12:37:28.1898844' AS DateTime2), CAST(277.64 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (8, N'test@test.com', CAST(N'2023-06-15T12:39:41.0176616' AS DateTime2), CAST(349.64 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (9, N'harshit@test.com', CAST(N'2023-06-15T12:42:20.1821788' AS DateTime2), CAST(318.73 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (10, N'harshit@test.com', CAST(N'2023-06-15T12:43:36.0654035' AS DateTime2), CAST(267.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (11, N'harshit@test.com', CAST(N'2023-06-15T13:00:49.3975399' AS DateTime2), CAST(318.73 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (12, N'harshit@test.com', CAST(N'2023-06-16T06:13:20.3017998' AS DateTime2), CAST(337.64 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (13, N'harshit@test.com', CAST(N'2023-06-16T08:37:22.7508929' AS DateTime2), CAST(2244.20 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (14, N'harshit@test.com', CAST(N'2023-06-18T07:58:07.7279812' AS DateTime2), CAST(127.64 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (15, N'admin@example.com', CAST(N'2023-06-18T15:28:40.3629048' AS DateTime2), CAST(30.91 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (16, N'harshit@test.com', CAST(N'2023-06-18T17:55:26.3247862' AS DateTime2), CAST(180.91 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (17, N'harshit@test.com', CAST(N'2023-06-19T08:14:13.2804410' AS DateTime2), CAST(30.91 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (18, N'harshit@test.com', CAST(N'2023-06-19T08:17:25.8327696' AS DateTime2), CAST(30.91 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (19, N'harshit@test.com', CAST(N'2023-06-19T08:19:42.8938221' AS DateTime2), CAST(180.91 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (20, N'harshit@test.com', CAST(N'2023-06-19T08:20:49.6973286' AS DateTime2), CAST(30.91 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (21, N'harshit@test.com', CAST(N'2023-06-19T08:21:10.7328803' AS DateTime2), CAST(180.91 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (22, N'harshit@test.com', CAST(N'2023-06-19T08:21:41.3470025' AS DateTime2), CAST(30.91 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (23, N'harshit@test.com', CAST(N'2023-06-19T08:22:08.2298168' AS DateTime2), CAST(180.91 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (24, N'harshit@test.com', CAST(N'2023-06-19T08:22:52.2768089' AS DateTime2), CAST(180.91 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (25, N'harshit@test.com', CAST(N'2023-06-19T08:23:23.4568546' AS DateTime2), CAST(30.91 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (26, N'harshit@test.com', CAST(N'2023-06-19T08:24:02.1676588' AS DateTime2), CAST(90.91 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (27, N'harshit@test.com', CAST(N'2023-06-19T08:24:29.4918862' AS DateTime2), CAST(30.91 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (28, N'harshit@test.com', CAST(N'2023-06-19T08:26:17.4134610' AS DateTime2), CAST(30.91 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (29, N'harshit@test.com', CAST(N'2023-06-19T08:27:33.2257846' AS DateTime2), CAST(180.91 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (30, N'harshit@test.com', CAST(N'2023-06-19T08:30:22.1717084' AS DateTime2), CAST(30.91 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (31, N'admin@example.com', CAST(N'2023-06-19T08:50:55.7220452' AS DateTime2), CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (32, N'ketan@test.com', CAST(N'2023-06-19T11:13:55.6214680' AS DateTime2), CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (33, N'ketan@test.com', CAST(N'2023-06-19T11:25:38.7407000' AS DateTime2), CAST(30.91 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [SubTotal]) VALUES (34, N'admin@example.com', CAST(N'2023-06-19T12:53:07.2730169' AS DateTime2), CAST(10.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([Id], [Name]) VALUES (1, N'Snacks')
INSERT [dbo].[ProductCategories] ([Id], [Name]) VALUES (2, N'Dairy')
INSERT [dbo].[ProductCategories] ([Id], [Name]) VALUES (3, N'Beverages')
INSERT [dbo].[ProductCategories] ([Id], [Name]) VALUES (4, N'Bakery')
INSERT [dbo].[ProductCategories] ([Id], [Name]) VALUES (5, N'Fresh Vegetables And Fruits')
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ImageUrl], [ProductCategoryID], [AvailableQuantity], [Discount], [Specification]) VALUES (2, N'Real Mixed fruit Juice', N'1L of Real Mixed Fruit is as rich and flavorful as any other concentrated juice.', CAST(150.00 AS Decimal(18, 2)), N'images/products/mixjuice.jpeg', 3, 15, CAST(0.00 AS Decimal(18, 2)), N'rich and flavorful as any other concentrated juice.')
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ImageUrl], [ProductCategoryID], [AvailableQuantity], [Discount], [Specification]) VALUES (3, N'Pringles Desi Masala Tadka Chips', N'Kellogg''s Pringles Desi Masala Tadka, 107 g', CAST(60.00 AS Decimal(18, 2)), N'images/products/pringles.jpg', 1, 15, CAST(0.00 AS Decimal(18, 2)), N'rich and flavorful as any other concentrated juice.')
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ImageUrl], [ProductCategoryID], [AvailableQuantity], [Discount], [Specification]) VALUES (4, N'Parle Hide and Seek Chocolate Chip Cookies ', N'Classic chocolate chip premium cookies,This is vegetarian product,200g', CAST(105.00 AS Decimal(18, 2)), N'images/products/HideSeek.jpeg', 4, 15, CAST(0.00 AS Decimal(18, 2)), N'rich and flavorful as any other concentrated juice.')
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ImageUrl], [ProductCategoryID], [AvailableQuantity], [Discount], [Specification]) VALUES (5, N'Amul Kool Milk - Kesar Flavour, 180 ml Pet Bottle', N'Amul Kool Kesar is refreshing milk with taste of Saffron (Kesar).', CAST(25.00 AS Decimal(18, 2)), N'images/products/amulkool.jpg', 2, 15, CAST(0.00 AS Decimal(18, 2)), N'It is an easy to use delicious drink that refreshes you immediately with goodness of milk.')
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ImageUrl], [ProductCategoryID], [AvailableQuantity], [Discount], [Specification]) VALUES (8, N'Amul Processed Cheese Chiplets Cubes, 200 g (8 Cubes)', N'Local tomatoes are partly sour and partly sweet and contain many seeds inside which are edible. ', CAST(30.91 AS Decimal(18, 2)), N'images/products/cheese.jpg', 2, 15, CAST(0.00 AS Decimal(18, 2)), N'rich and flavorful as any other concentrated juice.')
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ImageUrl], [ProductCategoryID], [AvailableQuantity], [Discount], [Specification]) VALUES (9, N'Hersheys Kisses', N'Kisses - Milk Chocolate: For over 100 years', CAST(139.91 AS Decimal(18, 2)), N'images/products/hersheys.jpg', 4, 15, CAST(0.00 AS Decimal(18, 2)), N'The iconic Hersheys Kisses chocolates have been spreading happiness across the world.')
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ImageUrl], [ProductCategoryID], [AvailableQuantity], [Discount], [Specification]) VALUES (10, N'Coco-Cola', N'Coca-Cola is the most popular and biggest-selling soft drink in history, as well as the best-known brand in the world.', CAST(95.00 AS Decimal(18, 2)), N'images/products/cocacola.jpg', 3, 15, CAST(5.00 AS Decimal(18, 2)), N'Quantity - 1 l,Expiry - 3 Days after opening')
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ImageUrl], [ProductCategoryID], [AvailableQuantity], [Discount], [Specification]) VALUES (11, N'Catch Shikanji Masala', N'Catch Shikanji masala is made from natural spring water. It is a truly refreshing way to beat the heat. Shikanji /Shikanjavi is an Indian lemonade .', CAST(10.00 AS Decimal(18, 2)), N'images/products/Catch.jpeg', 3, 15, CAST(1.00 AS Decimal(18, 2)), N'Quantity - 200 ml,Expiry - 3 Days after opening')
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ImageUrl], [ProductCategoryID], [AvailableQuantity], [Discount], [Specification]) VALUES (12, N'Lays- Potato Chips', N'When it comes to great taste, simplicity is key and Lays Classic Salted Potato Chips is here to prove it It all starts with the highest quality farm-grown potatoes, cooked to crunchy perfection and sprinkled with microlite salt.', CAST(20.00 AS Decimal(18, 2)), N'images/products/lays.jpg', 4, 30, CAST(1.00 AS Decimal(18, 2)), N'Weight - 40 g,Expiry - 2 Days after opening')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
/****** Object:  Index [IX_OrderItems_OrderId]    Script Date: 19-06-2023 22:59:15 ******/
CREATE NONCLUSTERED INDEX [IX_OrderItems_OrderId] ON [dbo].[OrderItems]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_ProductCategoryID]    Script Date: 19-06-2023 22:59:15 ******/
CREATE NONCLUSTERED INDEX [IX_Products_ProductCategoryID] ON [dbo].[Products]
(
	[ProductCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders_OrderId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductCategories_ProductCategoryID] FOREIGN KEY([ProductCategoryID])
REFERENCES [dbo].[ProductCategories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductCategories_ProductCategoryID]
GO
USE [master]
GO
ALTER DATABASE [GroceryStoreDB] SET  READ_WRITE 
GO
