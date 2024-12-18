USE [DressIt]
GO
/****** Object:  User [DressIt]    Script Date: 29/11/2024 10:49:23 ******/
CREATE USER [DressIt] FOR LOGIN [DressIt] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [DressIt]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 29/11/2024 10:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ColorTag]    Script Date: 29/11/2024 10:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ColorTag](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPost] [int] NOT NULL,
	[idColor] [nchar](10) NOT NULL,
 CONSTRAINT [PK_ColorTag] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FollowXUser]    Script Date: 29/11/2024 10:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FollowXUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUsuarioSeguidor] [int] NOT NULL,
	[idUsuarioSeguido] [int] NOT NULL,
 CONSTRAINT [PK_Seguidores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genders]    Script Date: 29/11/2024 10:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_Genders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History]    Script Date: 29/11/2024 10:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[idBrand] [int] NULL,
	[search] [varchar](max) NULL,
	[blocked] [bit] NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 29/11/2024 10:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCreator] [int] NOT NULL,
	[description] [varchar](100) NOT NULL,
	[price] [float] NOT NULL,
	[creationDate] [date] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[wearType] [int] NOT NULL,
	[gender] [int] NOT NULL,
	[imgPath] [varchar](max) NOT NULL,
	[link] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostsXUser]    Script Date: 29/11/2024 10:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostsXUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[idPost] [int] NOT NULL,
 CONSTRAINT [PK_PostsXUser] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 29/11/2024 10:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagXPost]    Script Date: 29/11/2024 10:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagXPost](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPost] [int] NOT NULL,
	[idTag] [int] NOT NULL,
 CONSTRAINT [PK_TagXPost] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 29/11/2024 10:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](max) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[pfp] [varchar](max) NULL,
	[googleId] [varchar](50) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WearTypes]    Script Date: 29/11/2024 10:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WearTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_WearTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([id], [nombre]) VALUES (1, N'azul')
INSERT [dbo].[Colors] ([id], [nombre]) VALUES (2, N'amarillo')
INSERT [dbo].[Colors] ([id], [nombre]) VALUES (3, N'rojo')
INSERT [dbo].[Colors] ([id], [nombre]) VALUES (4, N'naranja')
INSERT [dbo].[Colors] ([id], [nombre]) VALUES (5, N'verde')
INSERT [dbo].[Colors] ([id], [nombre]) VALUES (6, N'blanco')
INSERT [dbo].[Colors] ([id], [nombre]) VALUES (7, N'negro')
INSERT [dbo].[Colors] ([id], [nombre]) VALUES (8, N'violeta')
INSERT [dbo].[Colors] ([id], [nombre]) VALUES (9, N'marron')
INSERT [dbo].[Colors] ([id], [nombre]) VALUES (10, N'gris')
INSERT [dbo].[Colors] ([id], [nombre]) VALUES (11, N'rosa')
INSERT [dbo].[Colors] ([id], [nombre]) VALUES (12, N'celeste')
SET IDENTITY_INSERT [dbo].[Colors] OFF
GO
SET IDENTITY_INSERT [dbo].[ColorTag] ON 

INSERT [dbo].[ColorTag] ([id], [idPost], [idColor]) VALUES (1, 7, N'9         ')
SET IDENTITY_INSERT [dbo].[ColorTag] OFF
GO
SET IDENTITY_INSERT [dbo].[Genders] ON 

INSERT [dbo].[Genders] ([id], [name]) VALUES (1, N'masculino')
INSERT [dbo].[Genders] ([id], [name]) VALUES (2, N'femenino')
SET IDENTITY_INSERT [dbo].[Genders] OFF
GO
SET IDENTITY_INSERT [dbo].[History] ON 

INSERT [dbo].[History] ([id], [idUser], [idBrand], [search], [blocked]) VALUES (1, 1, NULL, N'jordan', 1)
INSERT [dbo].[History] ([id], [idUser], [idBrand], [search], [blocked]) VALUES (2, 1, 1, NULL, 0)
INSERT [dbo].[History] ([id], [idUser], [idBrand], [search], [blocked]) VALUES (28, 2, NULL, N'jordan', 0)
INSERT [dbo].[History] ([id], [idUser], [idBrand], [search], [blocked]) VALUES (29, 2, NULL, N'san', 0)
INSERT [dbo].[History] ([id], [idUser], [idBrand], [search], [blocked]) VALUES (30, 2, NULL, N'san lorenzo', 0)
INSERT [dbo].[History] ([id], [idUser], [idBrand], [search], [blocked]) VALUES (31, 1, 3, NULL, 0)
INSERT [dbo].[History] ([id], [idUser], [idBrand], [search], [blocked]) VALUES (32, 1, 3, NULL, 0)
INSERT [dbo].[History] ([id], [idUser], [idBrand], [search], [blocked]) VALUES (33, 1, 3, NULL, 0)
INSERT [dbo].[History] ([id], [idUser], [idBrand], [search], [blocked]) VALUES (34, 1, 3, NULL, 0)
INSERT [dbo].[History] ([id], [idUser], [idBrand], [search], [blocked]) VALUES (35, 1, 3, NULL, 0)
INSERT [dbo].[History] ([id], [idUser], [idBrand], [search], [blocked]) VALUES (36, 1, 3, NULL, 0)
INSERT [dbo].[History] ([id], [idUser], [idBrand], [search], [blocked]) VALUES (37, 1, 1, NULL, 0)
INSERT [dbo].[History] ([id], [idUser], [idBrand], [search], [blocked]) VALUES (38, 1, 1, NULL, 0)
INSERT [dbo].[History] ([id], [idUser], [idBrand], [search], [blocked]) VALUES (39, 3, NULL, N'san', 0)
INSERT [dbo].[History] ([id], [idUser], [idBrand], [search], [blocked]) VALUES (40, 3, NULL, N'san lorenzo', 0)
INSERT [dbo].[History] ([id], [idUser], [idBrand], [search], [blocked]) VALUES (41, 3, NULL, N'nike', 0)
INSERT [dbo].[History] ([id], [idUser], [idBrand], [search], [blocked]) VALUES (42, 5, NULL, N'jordan', 0)
INSERT [dbo].[History] ([id], [idUser], [idBrand], [search], [blocked]) VALUES (43, 5, NULL, N'san lorenzo', 0)
INSERT [dbo].[History] ([id], [idUser], [idBrand], [search], [blocked]) VALUES (44, 5, NULL, N'barcelona', 0)
INSERT [dbo].[History] ([id], [idUser], [idBrand], [search], [blocked]) VALUES (45, 6, NULL, N'san lore', 1)
INSERT [dbo].[History] ([id], [idUser], [idBrand], [search], [blocked]) VALUES (46, 6, NULL, N'barcelona', 1)
INSERT [dbo].[History] ([id], [idUser], [idBrand], [search], [blocked]) VALUES (47, 6, NULL, N'nike', NULL)
SET IDENTITY_INSERT [dbo].[History] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (1, 1, N'Buzo de Fútbol para Hombre', 93499, CAST(N'2024-07-10' AS Date), N'San Lorenzo 2024 Buzo Entrenamiento ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/907044-1400-1400?v=638471394894500000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/san-lorenzo-2024-stadium-dr2294-451/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (2, 1, N'Camiseta de Fútbol para Hombre', 74999, CAST(N'2024-07-10' AS Date), N'San Lorenzo 2024 Stadium ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/912764-1400-1400?v=638530173147070000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/san-lorenzo-2024-stadium-cw3826-464/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (3, 1, N'Remera Jordan para Hombre', 60999, CAST(N'2024-07-10' AS Date), N'Paris Saint-Germain ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/810158-1400-1400?v=638382422444570000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/paris-saintgermain-dz2940-274/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (4, 1, N'Camiseta de Fútbol para Hombre', 74999, CAST(N'2024-07-10' AS Date), N'San Lorenzo 2024 Camiseta Local ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/888706-1400-1400?v=638469756274500000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/san-lorenzo-local-2024-stadium-dr2696-414/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (5, 1, N'Camiseta de Fútbol para Hombre', 74999, CAST(N'2024-07-10' AS Date), N'San Lorenzo 2024 Camiseta visitante ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/889555-1400-1400?v=638469782494300000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/san-lorenzo-alternativa-2024-stadium-dh8440-103/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (6, 1, N'Remera de Moda para Hombre', 58499, CAST(N'2024-07-10' AS Date), N'Nike Sportswear ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/723609-1400-1400?v=638301471083630000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-sportswear-fd1320-113/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (7, 1, N'Remera Jordan para Hombre', 51499, CAST(N'2024-07-10' AS Date), N'Jordan Flight MVP ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/723287-1400-1400?v=638301464333230000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/jordan-flight-mvp-fb7365-010/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (8, 1, N'Remera de Moda para Hombre', 35499, CAST(N'2024-07-10' AS Date), N'Nike Sportswear Club ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/441074-1400-1400?v=638145727512900000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/remera-nike-sportswear-club-ar4997-013/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (9, 1, N'Remera de Moda para Hombre', 29249, CAST(N'2024-07-10' AS Date), N'Nike Sportswear ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/846020-1400-1400?v=638388498841830000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-sportswear-fd1244-100/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (10, 1, N'Remera de Running para Hombre', 50999, CAST(N'2024-07-10' AS Date), N'Nike Miler ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/600773-1400-1400?v=638194209193000000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-miler-dv9315-480/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (11, 1, N'Musculosa de Running para Hombre', 61999, CAST(N'2024-07-10' AS Date), N'Nike Dri-FIT ADV AeroSwift ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/311439-1400-1400?v=638122459586870000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/musculosa-nike-dri-fit-adv-aeroswift-dm4624-010/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (12, 1, N'Camiseta de Fútbol para Hombre', 65499, CAST(N'2024-07-10' AS Date), N'San Lorenzo 2024 Pre-calentamiento ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/889112-1400-1400?v=638469763441430000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/san-lorenzo-pre-calentamiento-2024-stadium-dr0944-547/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (13, 1, N'Remera Jordan para Hombre', 69999, CAST(N'2024-07-10' AS Date), N'Jordan Sport ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/723319-1400-1400?v=638301465062230000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/jordan-sport-fb7427-010/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (14, 1, N'Remera Jordan para Hombre', 51499, CAST(N'2024-07-10' AS Date), N'Jordan Flight MVP ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/723294-1400-1400?v=638301464490430000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/jordan-flight-mvp-fb7365-200/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (15, 1, N'Remera Jordan para Hombre', 51499, CAST(N'2024-07-10' AS Date), N'Jordan Sport 85 ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/723335-1400-1400?v=638301465379730000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/jordan-sport-85-fb7445-010/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (16, 1, N'Camiseta de Fútbol para Hombre', 74999, CAST(N'2024-07-10' AS Date), N'FC Barcelona local 2023/24 Stadium ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/714960-1400-1400?v=638236632204330000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/fc-barcelona-local-202324-stadium-dx2687-456/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (17, 1, N'Musculosa de Basquet para Hombre', 149999, CAST(N'2024-07-10' AS Date), N'Lebron James "Los Angeles Lakers City Edition" ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/810060-1400-1400?v=638382420507600000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/lebron-james-los-angeles-lakers-city-edition-202324-dx8506-012/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (18, 1, N'Camiseta de Fútbol para Hombre', 37499, CAST(N'2024-07-10' AS Date), N'Paris Saint-Germain local 2023/24 Stadium ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/714970-1400-1400?v=638236632350900000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/paris-saintgermain-local-202324-stadium-dx2694-411/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (19, 1, N'Remera Jordan para Hombre', 51499, CAST(N'2024-07-10' AS Date), N'Jordan Flight Essentials ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/723311-1400-1400?v=638301464879300000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/jordan-flight-essentials-fb7394-100/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (20, 1, N'Musculosa de Basquet para Hombre', 149999, CAST(N'2024-07-10' AS Date), N'Jayson Tatum Boston Celtics 2023/24 City Edition ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/810053-1400-1400?v=638382420384900000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/jayson-tatum-boston-celtics-202324-city-edition-dx8488-133/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (21, 1, N'Remera Jordan para Hombre', 69999, CAST(N'2024-07-10' AS Date), N'Jordan Flight Heritage 85 ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/723300-1400-1400?v=638301464618600000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/jordan-flight-heritage-85-fb7384-010/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (22, 1, N'Remera de Moda para Hombre', 58499, CAST(N'2024-07-10' AS Date), N'Nike Sportswear ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/811945-1400-1400?v=638382454656430000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-sportswear-fd1244-010/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (23, 1, N'Remera de Moda para Hombre', 63999, CAST(N'2024-07-10' AS Date), N'Nike SB "Team Dunk" ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/723669-1400-1400?v=638301472264930000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-sb-fj1137-100/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (24, 1, N'Remera de Entrenamiento para Hombre', 44499, CAST(N'2024-07-10' AS Date), N'Nike Pro ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/723445-1400-1400?v=638301467632300000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-pro-fb7932-084/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (25, 1, N'Remera de Moda para Hombre', 63999, CAST(N'2024-07-10' AS Date), N'Nike SB "Team Dunk" ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/723663-1400-1400?v=638301472117800000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-sb-fj1137-010/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (26, 1, N'Camiseta de Fútbol para Hombre', 74999, CAST(N'2024-07-10' AS Date), N'Liverpool FC local 2023/24 Stadium ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/680809-1400-1400?v=638224559295900000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/liverpool-fc-local-202324-stadium-dx2692-688/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (27, 1, N'Musculosa de Basquet para Hombre', 149999, CAST(N'2024-07-10' AS Date), N'Stephen Curry "Golden State Warriors City Edition"', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/844888-1400-1400?v=638388480178700000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/stephen-curry-golden-state-warriors-city-edition-202324-dx8502-011/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (28, 1, N'Remera de Running para Hombre', 56999, CAST(N'2024-07-10' AS Date), N'Nike DriFIT UV Miler Studio 72 ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/723451-1400-1400?v=638301467766670000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-drifit-uv-miler-studio-72-fb7946-010/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (29, 1, N'Remera de Moda Unisex', 57499, CAST(N'2024-07-10' AS Date), N'Nike SB ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/722752-1400-1400?v=638301453208130000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-sb-cv7539-010/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (30, 1, N'Musculosa de Basquet para Hombre', 149999, CAST(N'2024-07-10' AS Date), N'Kevin Durant "PHX Suns City Edition" ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/844902-1400-1400?v=638388480429630000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/kevin-durant-phoenix-suns-city-edition-202324-dx8516-539/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (31, 1, N'Remera de Moda para Hombre', 38399, CAST(N'2024-07-10' AS Date), N'Nike Sportswear ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/811974-1400-1400?v=638382455161770000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-sportswear-fd1296-100/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (32, 1, N'Musculosa de Basquet para Hombre', 74999, CAST(N'2024-07-10' AS Date), N'Giannis Antetokounmpo Milwaukee Bucks City Edition', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/600644-1400-1400?v=638193267694430000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/musculosa-giannis-antetokounmpo-milwaukee-bucks-city-edition-do9600-480/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (33, 1, N'Camiseta de Fútbol para Hombre', 74999, CAST(N'2024-07-10' AS Date), N'FC Barcelona 2023/24 Stadium Third ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/762382-1400-1400?v=638316089906400000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/fcbarcelona202324stadiumthird-dx9820-487/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (34, 1, N'Remera de Entrenamiento para Hombre', 63999, CAST(N'2024-07-10' AS Date), N'Nike DriFIT UV Hyverse ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/732102-1400-1400?v=638308292677630000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-drifit-uv-hyverse-fb6894-455/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (35, 1, N'Remera de Running para Hombre', 69999, CAST(N'2024-07-10' AS Date), N'Nike Track Club ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/723172-1400-1400?v=638301460889730000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-track-club-fb5512-410/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (36, 1, N'Remera de Moda para Hombre', 40949, CAST(N'2024-07-10' AS Date), N'Nike Sportswear ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/811952-1400-1400?v=638382454793030000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-sportswear-fd1244-410/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (37, 1, N'Musculosa de Basquet para Hombre', 92999, CAST(N'2024-07-10' AS Date), N'Kevin Durant ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/680654-1400-1400?v=638224556757500000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/kevin-durant-dx0333-442/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (38, 1, N'Camiseta de Futbol para Hombre', 74999, CAST(N'2024-07-10' AS Date), N'FC Barcelona complementario 2023/24 Stadium ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/531311-1400-1400?v=638161377383100000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/fc-barcelona-complementario-202324-stadium-dr5079-729/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (39, 1, N'Musculosa de Running para Hombre', 61999, CAST(N'2024-07-10' AS Date), N'Nike Dri-FIT ADV Run Division ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/212507-1400-1400?v=638098240053730000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/musculosa-nike-dri-fit-adv-run-division-dq4774-100/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (40, 1, N'Camiseta de Fútbol para Hombre', 74999, CAST(N'2024-07-10' AS Date), N'Atletico Madrid 2023/24 Stadium Third ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/786070-1400-1400?v=638336831485430000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/atletico-madrid-2023-24-stadium-third-dx9818-364/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (41, 1, N'Remera de Moda para Hombre', 38399, CAST(N'2024-07-10' AS Date), N'Nike Sportswear ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/811959-1400-1400?v=638382454908570000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-sportswear-fd1296-063/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (42, 1, N'Camiseta de Fútbol para Hombre', 74999, CAST(N'2024-07-10' AS Date), N'Chelsea FC alternativo 2023/24 Stadium ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/907600-1400-1400?v=638483678240500000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/chelsea-fc-alternativo-202324-stadium-dx9819-354/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (43, 1, N'Remera de Running para Hombre', 53999, CAST(N'2024-07-10' AS Date), N'Nike DriFIT Run Division Rise 365 ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/723187-1400-1400?v=638301461375500000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-drifit-run-division-rise-365-fb6879-012/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (44, 1, N'Remera Manga Larga de Fútbol para Hombre', 107999, CAST(N'2024-07-10' AS Date), N'FC Barcelona Strike ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/723012-1400-1400?v=638301457682630000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/fc-barcelona-strike-dx3102-358/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (45, 1, N'Remera de Fútbol para Hombre', 68499, CAST(N'2024-07-10' AS Date), N'FC Barcelona Strike alternativo ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/844908-1400-1400?v=638388480535130000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/fc-barcelona-strike-alternativo-dz0783-438/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (46, 1, N'Remera Jordan para Hombre', 50999, CAST(N'2024-07-10' AS Date), N'Jordan Dri-FIT Sport ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/679866-1400-1400?v=638224545061930000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/jordan-drifit-sport-dh8920-687/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (47, 1, N'Musculosa de Basquet Unisex', 86499, CAST(N'2024-07-10' AS Date), N'Giannis "Giannis App" ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/732112-1400-1400?v=638308292870700000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/giannis-fb7025-110/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (48, 1, N'Musculosa de Basquet para Hombre', 149999, CAST(N'2024-07-10' AS Date), N'Giannis Antetokounmpo Milwaukee Bucks City Edition', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/844895-1400-1400?v=638388480310870000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/giannis-antetokounmpo-milwaukee-bucks-city-edition-202324-dx8509-407/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (49, 1, N'Remera de Fútbol para Hombre', 65499, CAST(N'2024-07-10' AS Date), N'Nike Dri-FIT Strike ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/809889-1400-1400?v=638382417657300000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-drifit-strike-dv9237-349/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (50, 1, N'Remera de Entrenamiento para Hombre', 44499, CAST(N'2024-07-10' AS Date), N'Nike Pro ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/723440-1400-1400?v=638301467528730000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-pro-fb7932-010/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (51, 1, N'Remera de Moda para Hombre', 31999, CAST(N'2024-07-10' AS Date), N'Nike Sportswear ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/723587-1400-1400?v=638301470658930000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-sportswear-fd1242-100/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (52, 1, N'Remera de Moda para Hombre', 40949, CAST(N'2024-07-10' AS Date), N'Nike Sportswear ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/723598-1400-1400?v=638301470874800000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-sportswear-fd1313-801/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (53, 1, N'Remera de Moda para Hombre', 31999, CAST(N'2024-07-10' AS Date), N'Nike Sportswear ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/723581-1400-1400?v=638301470532630000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-sportswear-fd1242-010/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (54, 1, N'Camiseta de Fútbol para Hombre', 32749, CAST(N'2024-07-10' AS Date), N'Nike DriFIT Strike ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/659974-1400-1400?v=638221828716400000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-drifit-strike-dv9237-043/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (55, 1, N'Remera de Básquet para Hombre', 74499, CAST(N'2024-07-10' AS Date), N'LeBron ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/812697-1400-1400?v=638382468268800000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/lebron-fn0805-010/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (56, 1, N'Remera de Moda para Hombre', 35499, CAST(N'2024-07-10' AS Date), N'Nike Sportswear Club ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/792311-1400-1400?v=638379201287570000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-sportswear-club-ar4997-085/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (57, 1, N'Remera de Entrenamiento para Hombre', 39999, CAST(N'2024-07-10' AS Date), N'Nike Dri-FIT Primary ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/533428-1400-1400?v=638161409348970000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-dri-fit-primary-dv9831-010/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (58, 1, N'Remera de Moda para Hombre', 45999, CAST(N'2024-07-10' AS Date), N'Nike SB ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/722759-1400-1400?v=638301453329530000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-sb-cv7539-222/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (59, 1, N'Remera de Moda para Hombre', 58499, CAST(N'2024-07-10' AS Date), N'Nike Sportswear ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/812474-1400-1400?v=638382464211400000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-sportswear-fj1099-133/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (60, 1, N'Remera de Moda para Hombre', 63999, CAST(N'2024-07-10' AS Date), N'Nike Sportswear ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/838291-1400-1400?v=638386773856200000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-sportswear-fd1296-412/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (61, 1, N'Remera de Moda para Hombre', 58499, CAST(N'2024-07-10' AS Date), N'Nike Sportswear ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/812429-1400-1400?v=638382463419000000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-sportswear-fj1079-084/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (62, 1, N'Remera de Moda para Hombre', 29249, CAST(N'2024-07-10' AS Date), N'Nike Sportswear ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/812460-1400-1400?v=638382463992470000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-sportswear-fj1099-060/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (63, 1, N'Remera de Moda para Hombre', 34999, CAST(N'2024-07-10' AS Date), N'Nike ACG ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/658823-1400-1400?v=638221812410270000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-acg-dj3642-885/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (64, 1, N'Camiseta Jordan para Hombre', 74999, CAST(N'2024-07-10' AS Date), N'Paris Saint-Germain complementario 2023/24 Stadium', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/531281-1400-1400?v=638161376911770000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/paris-saint-germain-complementario-202324-stadium-dr3969-011/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (65, 1, N'Remera de Running para Hombre', 44999, CAST(N'2024-07-10' AS Date), N'Nike Trail Solar Chase ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/648018-1400-1400?v=638212461523670000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-trail-solar-chase-dv9305-034/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (66, 1, N'Remera de Moda para Hombre', 35499, CAST(N'2024-07-10' AS Date), N'Nike Sportswear Club ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/438980-1400-1400?v=638145695815130000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/remera-nike-sportswear-club-ar4997-101/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (67, 1, N'Remera de Running para Hombre', 45999, CAST(N'2024-07-10' AS Date), N'Nike Dri-FIT Trail ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/628931-1400-1400?v=638210589906630000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-sportswear-dz2727-010/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (68, 1, N'Remera Jordan para Hombre', 45999, CAST(N'2024-07-10' AS Date), N'Jordan Jumpman ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/912585-1400-1400?v=638514030027770000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/remera-jordan-jumpman-cj0921-011/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (69, 1, N'Remera Jordan para Hombre', 45999, CAST(N'2024-07-10' AS Date), N'Jordan Jumpman ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/208937-1400-1400?v=638098182377170000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/remera-jordan-jumpman-cj0921-100/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (70, 1, N'Remera de Moda para Hombre', 69999, CAST(N'2024-07-10' AS Date), N'Nike ACG ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/246073-1400-1400?v=638109568251700000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/remera-nike-acg-dv9636-040/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (71, 1, N'Remera Jordan para Hombre', 51499, CAST(N'2024-07-10' AS Date), N'Jordan Flight Essentials ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/795090-1400-1400?v=638379242688500000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/jordan-flight-essentials-fb7394-011/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (72, 1, N'Remera Manga Larga de Fútbol para Hombre', 93499, CAST(N'2024-07-10' AS Date), N'Nike Dri-FIT Strike ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/794262-1400-1400?v=638379229242100000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-drifit-strike-dv9225-349/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (73, 1, N'Camiseta de Fútbol para Hombre', 37499, CAST(N'2024-07-10' AS Date), N'Tottenham Hotspur visitante 2023/24 Stadium ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/722987-1400-1400?v=638301457260570000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/tottenham-hotspur-visitante-202324-stadium-dx2700-460/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (74, 1, N'Musculosa de Basquet para Hombre', 149999, CAST(N'2024-07-10' AS Date), N'Los Angeles Lakers Association Edition 202223 ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/720866-1400-1400?v=638254823933600000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/los-angeles-lakers-association-edition-202223-dn2081-103/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (75, 1, N'Musculosa de Basquet para Hombre', 149999, CAST(N'2024-07-10' AS Date), N'Chicago Bulls Association Edition 202223 ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/722853-1400-1400?v=638301454994230000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/chicago-bulls-association-edition-202223-dn2072-100/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (76, 1, N'Remera Manga Larga de Running para Hombre', 101499, CAST(N'2024-07-10' AS Date), N'Nike Element ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/792961-1400-1400?v=638379210527970000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-element-dd4756-451/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (77, 1, N'Remera Manga Larga de Running para Hombre', 101499, CAST(N'2024-07-10' AS Date), N'Nike Element ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/792977-1400-1400?v=638379210776600000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-element-dd4756-681/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (78, 1, N'Remera de Running para Hombre', 50999, CAST(N'2024-07-10' AS Date), N'Nike Miler ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/794292-1400-1400?v=638379229680400000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-miler-dv9315-681/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (79, 1, N'Remera Jordan para Hombre', 69999, CAST(N'2024-07-10' AS Date), N'Jordan Artist Series by Jammie Holmes ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/810850-1400-1400?v=638382435247900000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/jordan-artist-series-by-jammie-holmes-fb7408-010/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (80, 1, N'Remera Manga Larga de Entrenamiento para Hombre', 51499, CAST(N'2024-07-10' AS Date), N'Nike Pro ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/811118-1400-1400?v=638382440392000000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/nike-pro-fb7919-010/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (81, 1, N'Remera de Moda para Hombre', 29249, CAST(N'2024-07-10' AS Date), N'Nike Solo Swoosh ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/720768-1400-1400?v=638248667833600000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/remera-nike-solo-swoosh-cv0559-063/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (82, 1, N'Remera de Moda para Hombre', 22999, CAST(N'2024-07-10' AS Date), N'Nike Sportswear ', 1, 1, N'https://nikearprod.vtexassets.com/arquivos/ids/597049-1400-1400?v=638180272240830000&width=1400&height=1400&aspect=true', N'https://www.nike.com.ar/remera-nike-sportswear-dr8066-100/p')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (83, 3, N'', 27000, CAST(N'2024-09-24' AS Date), N'REMERA UNISEX BOXY T-BASICS CHER MIX', 1, 1, N'https://topperio.vtexassets.com/arquivos/ids/413966-200-0?v=638588206246370000&width=200&height=0&aspect=true', N'Sin enlace')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (84, 3, N'', 27000, CAST(N'2024-09-24' AS Date), N'REMERA UNISEX BOXY T-BASICS CHER MIX', 1, 1, N'https://topperio.vtexassets.com/arquivos/ids/413984-200-0?v=638588206382630000&width=200&height=0&aspect=true', N'Sin enlace')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (85, 3, N'', 27000, CAST(N'2024-09-24' AS Date), N'REMERA UNISEX BOXY T-BASICS CHER MIX', 1, 1, N'https://topperio.vtexassets.com/arquivos/ids/303178-200-0?v=638269623935930000&width=200&height=0&aspect=true', N'Sin enlace')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (86, 3, N'', 29000, CAST(N'2024-09-24' AS Date), N'REMERA UNISEX BOXY T-MIX CHER MIX', 1, 1, N'https://topperio.vtexassets.com/arquivos/ids/325158-200-0?v=638447398292330000&width=200&height=0&aspect=true', N'Sin enlace')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (87, 3, N'', 20000, CAST(N'2024-09-24' AS Date), N'REMERA BASICA', 1, 1, N'https://topperio.vtexassets.com/arquivos/ids/324770-200-0?v=638435389087700000&width=200&height=0&aspect=true', N'Sin enlace')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (88, 3, N'', 23000, CAST(N'2024-09-24' AS Date), N'REMERA TRAINING BASICA', 1, 1, N'https://topperio.vtexassets.com/arquivos/ids/269474-200-0?v=637897990991800000&width=200&height=0&aspect=true', N'Sin enlace')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (89, 3, N'', 20000, CAST(N'2024-09-24' AS Date), N'MUSCULOSA BASICA', 1, 1, N'https://topperio.vtexassets.com/arquivos/ids/242144-200-0?v=637493434593630000&width=200&height=0&aspect=true', N'Sin enlace')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (90, 3, N'', 21000, CAST(N'2024-09-24' AS Date), N'REMERA MC MEN ESSENTIALS', 1, 1, N'https://topperio.vtexassets.com/arquivos/ids/304622-200-0?v=638279761196230000&width=200&height=0&aspect=true', N'Sin enlace')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (91, 3, N'', 21000, CAST(N'2024-09-24' AS Date), N'REMERA HOMBRE BASICA', 1, 1, N'https://topperio.vtexassets.com/arquivos/ids/311771-200-0?v=638337624286730000&width=200&height=0&aspect=true', N'Sin enlace')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (92, 3, N'', 21000, CAST(N'2024-09-24' AS Date), N'REMERA HOMBRE ESTAMPADA - BRAND TEE', 1, 1, N'https://topperio.vtexassets.com/arquivos/ids/324791-200-0?v=638437099432430000&width=200&height=0&aspect=true', N'Sin enlace')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (93, 3, N'', 27000, CAST(N'2024-09-24' AS Date), N'REMERA UNISEX BOXY T-BASICS CHER MIX', 1, 1, N'https://topperio.vtexassets.com/arquivos/ids/413966-200-0?v=638588206246370000&width=200&height=0&aspect=true', N'Sin enlace')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (94, 3, N'', 27000, CAST(N'2024-09-24' AS Date), N'REMERA UNISEX BOXY T-BASICS CHER MIX', 1, 1, N'https://topperio.vtexassets.com/arquivos/ids/413984-200-0?v=638588206382630000&width=200&height=0&aspect=true', N'Sin enlace')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (95, 3, N'', 27000, CAST(N'2024-09-24' AS Date), N'REMERA UNISEX BOXY T-BASICS CHER MIX', 1, 1, N'https://topperio.vtexassets.com/arquivos/ids/303178-200-0?v=638269623935930000&width=200&height=0&aspect=true', N'Sin enlace')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (96, 3, N'', 29000, CAST(N'2024-09-24' AS Date), N'REMERA UNISEX BOXY T-MIX CHER MIX', 1, 1, N'https://topperio.vtexassets.com/arquivos/ids/325158-200-0?v=638447398292330000&width=200&height=0&aspect=true', N'Sin enlace')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (97, 3, N'', 20000, CAST(N'2024-09-24' AS Date), N'REMERA BASICA', 1, 1, N'https://topperio.vtexassets.com/arquivos/ids/324770-200-0?v=638435389087700000&width=200&height=0&aspect=true', N'Sin enlace')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (98, 3, N'', 23000, CAST(N'2024-09-24' AS Date), N'REMERA TRAINING BASICA', 1, 1, N'https://topperio.vtexassets.com/arquivos/ids/269474-200-0?v=637897990991800000&width=200&height=0&aspect=true', N'Sin enlace')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (99, 3, N'', 20000, CAST(N'2024-09-24' AS Date), N'MUSCULOSA BASICA', 1, 1, N'https://topperio.vtexassets.com/arquivos/ids/242144-200-0?v=637493434593630000&width=200&height=0&aspect=true', N'Sin enlace')
GO
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (100, 3, N'', 21000, CAST(N'2024-09-24' AS Date), N'REMERA MC MEN ESSENTIALS', 1, 1, N'https://topperio.vtexassets.com/arquivos/ids/304622-200-0?v=638279761196230000&width=200&height=0&aspect=true', N'Sin enlace')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (101, 3, N'', 21000, CAST(N'2024-09-24' AS Date), N'REMERA HOMBRE BASICA', 1, 1, N'https://topperio.vtexassets.com/arquivos/ids/311771-200-0?v=638337624286730000&width=200&height=0&aspect=true', N'Sin enlace')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (102, 3, N'', 21000, CAST(N'2024-09-24' AS Date), N'REMERA HOMBRE ESTAMPADA - BRAND TEE', 1, 1, N'https://topperio.vtexassets.com/arquivos/ids/324791-200-0?v=638437099432430000&width=200&height=0&aspect=true', N'Sin enlace')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (103, 3, N'', 21000, CAST(N'2024-09-24' AS Date), N'REMERA HOMBRE ESTAMPADA - BRAND TEE', 1, 1, N'Sin imagen', N'Sin enlace')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (104, 3, N'', 21000, CAST(N'2024-09-24' AS Date), N'REMERA MC MEN ESSENTIALS', 1, 1, N'https://topperio.vtexassets.com/arquivos/ids/298182-200-0?v=638175236686570000&width=200&height=0&aspect=true', N'Sin enlace')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (105, 3, N'', 21000, CAST(N'2024-09-24' AS Date), N'REMERA MC MEN ESSENTIALS', 1, 1, N'https://topperio.vtexassets.com/arquivos/ids/298392-200-0?v=638175240277800000&width=200&height=0&aspect=true', N'Sin enlace')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (106, 3, N'', 21000, CAST(N'2024-09-24' AS Date), N'REMERA MC MEN ESSENTIALS', 1, 1, N'https://topperio.vtexassets.com/arquivos/ids/298330-200-0?v=638175239673230000&width=200&height=0&aspect=true', N'Sin enlace')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (107, 3, N'', 21000, CAST(N'2024-09-24' AS Date), N'REMERA HOMBRE BASICA', 1, 1, N'https://topperio.vtexassets.com/arquivos/ids/344079-200-0?v=638566611743700000&width=200&height=0&aspect=true', N'Sin enlace')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (108, 3, N'', 27000, CAST(N'2024-09-24' AS Date), N'REMERA HOMBRE ESTAMPADA - SPORTY DAYS', 1, 1, N'https://topperio.vtexassets.com/arquivos/ids/312849-200-0?v=638363598881100000&width=200&height=0&aspect=true', N'Sin enlace')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (109, 3, N'', 24000, CAST(N'2024-09-24' AS Date), N'REMERA HOMBRE TRAINING BÁSICA', 1, 1, N'https://topperio.vtexassets.com/arquivos/ids/344396-200-0?v=638566615114070000&width=200&height=0&aspect=true', N'Sin enlace')
INSERT [dbo].[Posts] ([id], [idCreator], [description], [price], [creationDate], [name], [wearType], [gender], [imgPath], [link]) VALUES (110, 3, N'', 24000, CAST(N'2024-09-24' AS Date), N'REMERA HOMBRE TRAINING BÁSICA', 1, 1, N'Sin imagen', N'Sin enlace')
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [username], [password], [email], [pfp], [googleId]) VALUES (1, N'nike', N'Nike123Hola', N'nike@gmail.com', N'https://www.brandemia.org/wp-content/uploads/2011/09/logo_nike_principal.jpg', N'1')
INSERT [dbo].[Users] ([id], [username], [password], [email], [pfp], [googleId]) VALUES (2, N'ianlevin', N'ce8cd36fc5b57fc6ecbead0e1644265ea44eb4b3', N'ianlev1234567@gmail.com', N'https://lh3.googleusercontent.com/a/ACg8ocK34Oq6elb_ffqfHjpMHuSV4m59et4c_Em1OCsqgIOk8-AZ7g5c=s96-c', N'106514768530535593404')
INSERT [dbo].[Users] ([id], [username], [password], [email], [pfp], [googleId]) VALUES (3, N'topper', N'dwad', N'dwa', N'adw', N'dw')
INSERT [dbo].[Users] ([id], [username], [password], [email], [pfp], [googleId]) VALUES (4, N'marcoambricca', N'46d8fe4b27b22ea0c7a3d82e514cc2c053b9bbdc', N'47490408@est.ort.edu.ar', N'https://lh3.googleusercontent.com/a/ACg8ocKH8-dHGac47Hps9IH1OIDq0EhPenqsN4kTQyTTe-ujLXvcMsSn=s96-c', N'105914477740497291170')
INSERT [dbo].[Users] ([id], [username], [password], [email], [pfp], [googleId]) VALUES (5, N'matiasivanszabo', N'e973578f2ea5be2bbabe00ad2240c75a3312b5e3', N'47805194@est.ort.edu.ar', N'https://lh3.googleusercontent.com/a/ACg8ocKTqoFo1Lg_zeEJllUi87ZwabsA1wawNNUXmFq-TyYhGFV6jw=s96-c', N'107300486908014122525')
INSERT [dbo].[Users] ([id], [username], [password], [email], [pfp], [googleId]) VALUES (6, N'thiagolewin13', N'aefd843245aacf390df832f2d491dc0c199d20aef0cf53572ed106ff5082dd8e', N'thiagolewin07@gmail.com', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[WearTypes] ON 

INSERT [dbo].[WearTypes] ([id], [name]) VALUES (1, N'remero')
INSERT [dbo].[WearTypes] ([id], [name]) VALUES (2, N'pant')
SET IDENTITY_INSERT [dbo].[WearTypes] OFF
GO
ALTER TABLE [dbo].[FollowXUser]  WITH CHECK ADD  CONSTRAINT [FK_Seguidores_Usuarios] FOREIGN KEY([idUsuarioSeguidor])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[FollowXUser] CHECK CONSTRAINT [FK_Seguidores_Usuarios]
GO
ALTER TABLE [dbo].[FollowXUser]  WITH CHECK ADD  CONSTRAINT [FK_Seguidores_Usuarios1] FOREIGN KEY([idUsuarioSeguido])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[FollowXUser] CHECK CONSTRAINT [FK_Seguidores_Usuarios1]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Post_User] FOREIGN KEY([idCreator])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Post_User]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Genders] FOREIGN KEY([gender])
REFERENCES [dbo].[Genders] ([id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Genders]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users] FOREIGN KEY([idCreator])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_WearTypes] FOREIGN KEY([wearType])
REFERENCES [dbo].[WearTypes] ([id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_WearTypes]
GO
ALTER TABLE [dbo].[PostsXUser]  WITH CHECK ADD  CONSTRAINT [FK_PostsXUser_Posts] FOREIGN KEY([idPost])
REFERENCES [dbo].[Posts] ([id])
GO
ALTER TABLE [dbo].[PostsXUser] CHECK CONSTRAINT [FK_PostsXUser_Posts]
GO
ALTER TABLE [dbo].[PostsXUser]  WITH CHECK ADD  CONSTRAINT [FK_PostsXUser_Users] FOREIGN KEY([idUser])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[PostsXUser] CHECK CONSTRAINT [FK_PostsXUser_Users]
GO
ALTER TABLE [dbo].[TagXPost]  WITH CHECK ADD  CONSTRAINT [FK_TagXPost_Posts] FOREIGN KEY([idPost])
REFERENCES [dbo].[Posts] ([id])
GO
ALTER TABLE [dbo].[TagXPost] CHECK CONSTRAINT [FK_TagXPost_Posts]
GO
ALTER TABLE [dbo].[TagXPost]  WITH CHECK ADD  CONSTRAINT [FK_TagXPost_Tags] FOREIGN KEY([idTag])
REFERENCES [dbo].[Tags] ([id])
GO
ALTER TABLE [dbo].[TagXPost] CHECK CONSTRAINT [FK_TagXPost_Tags]
GO
