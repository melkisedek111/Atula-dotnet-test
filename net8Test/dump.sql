USE [AtulaDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 04/09/2024 6:46:49 pm ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 04/09/2024 6:46:49 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 04/09/2024 6:46:49 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[ProductId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 04/09/2024 6:46:49 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Sku] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 04/09/2024 6:46:49 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](450) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[NormalizedUserName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[NormalizedEmail] [nvarchar](max) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240903221515_Initial', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240903222209_InitialCreate', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240903222410_InitialCreate1', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240903222647_AddCategoryTable', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240903223806_AddUserTable', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240904061543_CreateProductsAndCategories', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240904061804_CreateProductsAndCategoriesAddData', N'8.0.8')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Table')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Chair')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Sofa')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[ProductCategories] ([ProductId], [CategoryId]) VALUES (2, 1)
INSERT [dbo].[ProductCategories] ([ProductId], [CategoryId]) VALUES (3, 1)
INSERT [dbo].[ProductCategories] ([ProductId], [CategoryId]) VALUES (10, 1)
INSERT [dbo].[ProductCategories] ([ProductId], [CategoryId]) VALUES (4, 2)
INSERT [dbo].[ProductCategories] ([ProductId], [CategoryId]) VALUES (5, 2)
INSERT [dbo].[ProductCategories] ([ProductId], [CategoryId]) VALUES (6, 2)
INSERT [dbo].[ProductCategories] ([ProductId], [CategoryId]) VALUES (11, 2)
INSERT [dbo].[ProductCategories] ([ProductId], [CategoryId]) VALUES (12, 2)
INSERT [dbo].[ProductCategories] ([ProductId], [CategoryId]) VALUES (1, 3)
INSERT [dbo].[ProductCategories] ([ProductId], [CategoryId]) VALUES (7, 3)
INSERT [dbo].[ProductCategories] ([ProductId], [CategoryId]) VALUES (8, 3)
INSERT [dbo].[ProductCategories] ([ProductId], [CategoryId]) VALUES (9, 3)
INSERT [dbo].[ProductCategories] ([ProductId], [CategoryId]) VALUES (13, 3)
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Sku]) VALUES (1, N'Lorem Table', N'SKUA')
INSERT [dbo].[Products] ([Id], [Name], [Sku]) VALUES (2, N'Ipsum Table', N'SKUB')
INSERT [dbo].[Products] ([Id], [Name], [Sku]) VALUES (3, N'Dolor Table', N'SKUC')
INSERT [dbo].[Products] ([Id], [Name], [Sku]) VALUES (4, N'Sit Chair', N'SKUD')
INSERT [dbo].[Products] ([Id], [Name], [Sku]) VALUES (5, N'Amet Chair', N'SKUE')
INSERT [dbo].[Products] ([Id], [Name], [Sku]) VALUES (6, N'Consectetur Chair', N'SKUF')
INSERT [dbo].[Products] ([Id], [Name], [Sku]) VALUES (7, N'Adipiscing Sofa', N'SKUG')
INSERT [dbo].[Products] ([Id], [Name], [Sku]) VALUES (8, N'Elit Sofa', N'SKUH')
INSERT [dbo].[Products] ([Id], [Name], [Sku]) VALUES (9, N'Mauris Sofa', N'SKUI')
INSERT [dbo].[Products] ([Id], [Name], [Sku]) VALUES (10, N'qwe', N'SKUC')
INSERT [dbo].[Products] ([Id], [Name], [Sku]) VALUES (11, N'Eli Sofa Super', N'SKUZ')
INSERT [dbo].[Products] ([Id], [Name], [Sku]) VALUES (12, N'Eli Sofa Supera', N'SKUZA')
INSERT [dbo].[Products] ([Id], [Name], [Sku]) VALUES (13, N'Eli Sofa Superaa', N'SKUCs')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[ProductCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategories_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductCategories] CHECK CONSTRAINT [FK_ProductCategories_Categories_CategoryId]
GO
ALTER TABLE [dbo].[ProductCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategories_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductCategories] CHECK CONSTRAINT [FK_ProductCategories_Products_ProductId]
GO
