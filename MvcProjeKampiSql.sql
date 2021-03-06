USE [MvcProjeKampi]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 1.08.2022 22:20:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Abouts]    Script Date: 1.08.2022 22:20:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abouts](
	[AboutId] [int] IDENTITY(1,1) NOT NULL,
	[AboutDetails1] [nvarchar](1000) NULL,
	[AboutDetails2] [nvarchar](1000) NULL,
	[AboutImage1] [nvarchar](200) NULL,
	[AboutImage2] [nvarchar](200) NULL,
 CONSTRAINT [PK_dbo.Abouts] PRIMARY KEY CLUSTERED 
(
	[AboutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 1.08.2022 22:20:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](60) NULL,
	[CategoryDescription] [nvarchar](300) NULL,
	[CategoryStatus] [bit] NOT NULL,
	[CategoryColor] [nvarchar](15) NULL,
 CONSTRAINT [PK_dbo.Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 1.08.2022 22:20:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](60) NULL,
	[UserMail] [nvarchar](70) NULL,
	[Subject] [nvarchar](100) NULL,
	[Message] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Contacts] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contents]    Script Date: 1.08.2022 22:20:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contents](
	[ContentId] [int] IDENTITY(1,1) NOT NULL,
	[ContentValue] [nvarchar](1000) NULL,
	[ContentDate] [datetime] NOT NULL,
	[HeadingId] [int] NOT NULL,
	[WriterId] [int] NULL,
	[ContentStatus] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Contents] PRIMARY KEY CLUSTERED 
(
	[ContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Headings]    Script Date: 1.08.2022 22:20:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Headings](
	[HeadingId] [int] IDENTITY(1,1) NOT NULL,
	[HeadingName] [nvarchar](60) NULL,
	[HeadingDate] [datetime] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[WriterId] [int] NOT NULL,
	[HeadingStatus] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Headings] PRIMARY KEY CLUSTERED 
(
	[HeadingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Writers]    Script Date: 1.08.2022 22:20:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Writers](
	[WriterId] [int] IDENTITY(1,1) NOT NULL,
	[WriterName] [nvarchar](60) NULL,
	[WriterSurname] [nvarchar](60) NULL,
	[WriterImage] [nvarchar](400) NULL,
	[WriterMail] [nvarchar](200) NULL,
	[WriterPassword] [nvarchar](200) NULL,
	[WriterAbout] [nvarchar](250) NULL,
	[WriterTitle] [nvarchar](50) NULL,
	[WriterStatus] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Writers] PRIMARY KEY CLUSTERED 
(
	[WriterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contents] ADD  DEFAULT ((0)) FOR [ContentStatus]
GO
ALTER TABLE [dbo].[Headings] ADD  DEFAULT ((0)) FOR [HeadingStatus]
GO
ALTER TABLE [dbo].[Writers] ADD  DEFAULT ((0)) FOR [WriterStatus]
GO
ALTER TABLE [dbo].[Contents]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Contents_dbo.Headings_HeadingId] FOREIGN KEY([HeadingId])
REFERENCES [dbo].[Headings] ([HeadingId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Contents] CHECK CONSTRAINT [FK_dbo.Contents_dbo.Headings_HeadingId]
GO
ALTER TABLE [dbo].[Contents]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Contents_dbo.Writers_WriterId] FOREIGN KEY([WriterId])
REFERENCES [dbo].[Writers] ([WriterId])
GO
ALTER TABLE [dbo].[Contents] CHECK CONSTRAINT [FK_dbo.Contents_dbo.Writers_WriterId]
GO
ALTER TABLE [dbo].[Headings]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Headings_dbo.Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Headings] CHECK CONSTRAINT [FK_dbo.Headings_dbo.Categories_CategoryId]
GO
ALTER TABLE [dbo].[Headings]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Headings_dbo.Writers_WriterId] FOREIGN KEY([WriterId])
REFERENCES [dbo].[Writers] ([WriterId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Headings] CHECK CONSTRAINT [FK_dbo.Headings_dbo.Writers_WriterId]
GO
