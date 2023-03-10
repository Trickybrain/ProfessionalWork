USE [ReParrot]
GO
/****** Object:  Table [dbo].[UserVehicles]    Script Date: 1/10/2023 1:11:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserVehicles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VIN] [nvarchar](100) NOT NULL,
	[Color] [nvarchar](100) NOT NULL,
	[OwnerId] [int] NOT NULL,
	[CarModelId] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
	[RegisteredStateId] [int] NULL,
	[LicensePlate] [nvarchar](20) NULL,
	[RegistrationExpiration] [datetime2](7) NULL,
	[isArchived] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_UserVehicles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserVehicles] ADD  CONSTRAINT [DF_UserVehicles_isArchived]  DEFAULT ((0)) FOR [isArchived]
GO
ALTER TABLE [dbo].[UserVehicles] ADD  CONSTRAINT [DF_UserVehicles_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[UserVehicles] ADD  CONSTRAINT [DF_UserVehicles_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[UserVehicles]  WITH CHECK ADD  CONSTRAINT [FK_UserVehicles_CreatedBy_on_Users_Id] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserVehicles] CHECK CONSTRAINT [FK_UserVehicles_CreatedBy_on_Users_Id]
GO
ALTER TABLE [dbo].[UserVehicles]  WITH CHECK ADD  CONSTRAINT [FK_UserVehicles_LocationId_on_Locations_Id] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([Id])
GO
ALTER TABLE [dbo].[UserVehicles] CHECK CONSTRAINT [FK_UserVehicles_LocationId_on_Locations_Id]
GO
ALTER TABLE [dbo].[UserVehicles]  WITH CHECK ADD  CONSTRAINT [FK_UserVehicles_ModifiedBy_on_Users_Id] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserVehicles] CHECK CONSTRAINT [FK_UserVehicles_ModifiedBy_on_Users_Id]
GO
ALTER TABLE [dbo].[UserVehicles]  WITH CHECK ADD  CONSTRAINT [FK_UserVehicles_OwnerId_on_Users_Id] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserVehicles] CHECK CONSTRAINT [FK_UserVehicles_OwnerId_on_Users_Id]
GO
ALTER TABLE [dbo].[UserVehicles]  WITH CHECK ADD  CONSTRAINT [FK_UserVehicles_RegisteredStateId_on_States_Id] FOREIGN KEY([RegisteredStateId])
REFERENCES [dbo].[States] ([Id])
GO
ALTER TABLE [dbo].[UserVehicles] CHECK CONSTRAINT [FK_UserVehicles_RegisteredStateId_on_States_Id]
GO
