USE [ReParrot]
GO
/****** Object:  Table [dbo].[OrganizationMembers]    Script Date: 2/3/2023 9:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganizationMembers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[PositionType] [int] NOT NULL,
	[OrganizationEmail] [nvarchar](100) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrganizationMembers_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_OrganizationMembers] UNIQUE NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrganizationMembers] ADD  CONSTRAINT [DF_OrganizationMembers_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[OrganizationMembers] ADD  CONSTRAINT [DF_OrganizationMembers_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[OrganizationMembers]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationMembers_Organizations] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organizations] ([Id])
GO
ALTER TABLE [dbo].[OrganizationMembers] CHECK CONSTRAINT [FK_OrganizationMembers_Organizations]
GO
ALTER TABLE [dbo].[OrganizationMembers]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationMembers_PositionTypes] FOREIGN KEY([PositionType])
REFERENCES [dbo].[PositionTypes] ([Id])
GO
ALTER TABLE [dbo].[OrganizationMembers] CHECK CONSTRAINT [FK_OrganizationMembers_PositionTypes]
GO
ALTER TABLE [dbo].[OrganizationMembers]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationMembers_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[OrganizationMembers] CHECK CONSTRAINT [FK_OrganizationMembers_Roles]
GO
ALTER TABLE [dbo].[OrganizationMembers]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationMembers_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[OrganizationMembers] CHECK CONSTRAINT [FK_OrganizationMembers_Users]
GO
