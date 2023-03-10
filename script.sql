USE [TestTask]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 20.02.2023 21:38:57 ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 20.02.2023 21:38:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Count] [int] NOT NULL,
	[Date_Order] [datetime] NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 20.02.2023 21:38:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Count] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 20.02.2023 21:38:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230220173952_first', N'7.0.3')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Count], [Date_Order], [UserId], [ProductId]) VALUES (2, 2, CAST(N'2022-01-10T00:00:00.000' AS DateTime), 2, 3)
INSERT [dbo].[Order] ([Id], [Count], [Date_Order], [UserId], [ProductId]) VALUES (6, 4, CAST(N'2023-02-20T00:00:00.000' AS DateTime), 5, 10)
INSERT [dbo].[Order] ([Id], [Count], [Date_Order], [UserId], [ProductId]) VALUES (9, 25, CAST(N'2023-02-12T00:00:00.000' AS DateTime), 2, 3)
INSERT [dbo].[Order] ([Id], [Count], [Date_Order], [UserId], [ProductId]) VALUES (10, 23, CAST(N'2023-02-13T00:00:00.000' AS DateTime), 3, 4)
INSERT [dbo].[Order] ([Id], [Count], [Date_Order], [UserId], [ProductId]) VALUES (11, 10, CAST(N'2023-02-14T00:00:00.000' AS DateTime), 4, 5)
INSERT [dbo].[Order] ([Id], [Count], [Date_Order], [UserId], [ProductId]) VALUES (12, 13, CAST(N'2023-02-15T00:00:00.000' AS DateTime), 5, 6)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Count], [Price]) VALUES (1, N'Апельсины', 100, 35)
INSERT [dbo].[Product] ([Id], [Name], [Count], [Price]) VALUES (3, N'Огурцы', 130, 68)
INSERT [dbo].[Product] ([Id], [Name], [Count], [Price]) VALUES (4, N'Базилик', 137, 66)
INSERT [dbo].[Product] ([Id], [Name], [Count], [Price]) VALUES (5, N'Яблоки', 41, 79)
INSERT [dbo].[Product] ([Id], [Name], [Count], [Price]) VALUES (6, N'Томатный сок', 113, 87)
INSERT [dbo].[Product] ([Id], [Name], [Count], [Price]) VALUES (7, N'Морковка', 135, 73)
INSERT [dbo].[Product] ([Id], [Name], [Count], [Price]) VALUES (8, N'Редис', 137, 38)
INSERT [dbo].[Product] ([Id], [Name], [Count], [Price]) VALUES (9, N'Помидоры свежие ', 127, 31)
INSERT [dbo].[Product] ([Id], [Name], [Count], [Price]) VALUES (10, N'Шампиньоны', 73, 82)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Name]) VALUES (1, N'Амина')
INSERT [dbo].[User] ([Id], [Name]) VALUES (2, N'Дарья')
INSERT [dbo].[User] ([Id], [Name]) VALUES (3, N'Анна')
INSERT [dbo].[User] ([Id], [Name]) VALUES (4, N'Даниил')
INSERT [dbo].[User] ([Id], [Name]) VALUES (5, N'Степан')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Date_Order]  DEFAULT (getdate()) FOR [Date_Order]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product_productId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product_productId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User_userId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User_userId]
GO
