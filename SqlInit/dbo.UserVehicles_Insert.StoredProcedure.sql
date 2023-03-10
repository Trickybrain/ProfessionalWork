USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[UserVehicles_Insert]    Script Date: 1/10/2023 1:11:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Jacob Helton
-- Create date: 1/9/2023
-- Description: Inserts a UserVehicle
-- Code Reviewer: Liliana Meriweather

-- MODIFIED BY: 
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================

CREATE proc [dbo].[UserVehicles_Insert] @VIN nvarchar(100)
								  ,@Color nvarchar(100)
								  ,@OwnerId int
								  ,@CarModelId int
							      ,@LocationId int
							      ,@RegisteredStateId int = null
							      ,@LicensePlate nvarchar(20) = null
							      ,@RegistrationExpiration datetime2(7) = null
							      ,@CreatedBy int
								  ,@Id int OUTPUT

as

/* ----- TEST CODE -----

	Declare @Id int = 0;

	Declare @VIN nvarchar(100) = '123abc'
		   ,@Color nvarchar(100) = 'blue'
		   ,@OwnerId int = 1
		   ,@CarModelId int = 1
		   ,@LocationId int = 1
		   ,@RegisteredStateId int = 1
		   ,@LicensePlate nvarchar(20) = null
		   ,@RegistrationExpiration datetime2(7) = null
		   ,@CreatedBy int = 1

	Execute dbo.UserVehicles_Insert @VIN
							      ,@Color
							      ,@OwnerId
							      ,@CarModelId
							      ,@LocationId
							      ,@RegisteredStateId
							      ,@LicensePlate
							      ,@RegistrationExpiration
							      ,@CreatedBy
								  ,@Id OUTPUT

	Execute dbo.UserVehicles_SelectById @Id

*/

BEGIN

	INSERT INTO dbo.UserVehicles ([VIN]
								 ,[Color]
								 ,[OwnerId]
								 ,[CarModelId]
								 ,[LocationId]
								 ,[RegisteredStateId]
								 ,[LicensePlate]
								 ,[RegistrationExpiration]
								 ,[CreatedBy]
								 ,[ModifiedBy])

	VALUES (@VIN
		   ,@Color
		   ,@OwnerId
		   ,@CarModelId
		   ,@LocationId
		   ,@RegisteredStateId
		   ,@LicensePlate
		   ,@RegistrationExpiration
		   ,@CreatedBy
		   ,@CreatedBy)

	SET @Id = SCOPE_IDENTITY();


END
GO
