USE [ReParrot]
GO
/****** Object:  Table [dbo].[Certifications]    Script Date: 1/26/2023 7:50:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certifications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[OrganizationId] [int] NOT NULL,
	[FileId] [int] NULL,
	[ExpirationDate] [datetime2](7) NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_certificationTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Certifications] ADD  CONSTRAINT [DF_certificationTable_ExpirationDate]  DEFAULT (getutcdate()) FOR [ExpirationDate]
GO
ALTER TABLE [dbo].[Certifications] ADD  CONSTRAINT [DF_certificationTable_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Certifications] ADD  CONSTRAINT [DF_certificationTable_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Certifications]  WITH CHECK ADD  CONSTRAINT [FK_Certifications_Files1] FOREIGN KEY([FileId])
REFERENCES [dbo].[Files] ([Id])
GO
ALTER TABLE [dbo].[Certifications] CHECK CONSTRAINT [FK_Certifications_Files1]
GO
ALTER TABLE [dbo].[Certifications]  WITH CHECK ADD  CONSTRAINT [FK_Certifications_Organizations1] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organizations] ([Id])
GO
ALTER TABLE [dbo].[Certifications] CHECK CONSTRAINT [FK_Certifications_Organizations1]
GO
