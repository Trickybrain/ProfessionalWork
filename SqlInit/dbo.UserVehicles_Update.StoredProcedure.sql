USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[UserVehicles_Update]    Script Date: 1/10/2023 1:11:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Jacob Helton
-- Create date: 1/9/2023
-- Description: Updates a UserVehicle
-- Code Reviewer: Liliana Meriweather

-- MODIFIED BY: 
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================

CREATE proc [dbo].[UserVehicles_Update] @Id int
								  ,@VIN nvarchar(100)
								  ,@Color nvarchar(100)
								  ,@OwnerId int
								  ,@CarModelId int
							      ,@LocationId int
							      ,@RegisteredStateId int = null
							      ,@LicensePlate nvarchar(20) = null
							      ,@RegistrationExpiration datetime2(7) = null
							      ,@ModifiedBy int

as

/* ----- TEST CODE -----

	Declare @Id int = 6  
		   ,@VIN nvarchar(100) = '123abc123'
		   ,@Color nvarchar(100) = 'blue'
		   ,@OwnerId int = 1
		   ,@CarModelId int = 1
		   ,@LocationId int = 1
		   ,@RegisteredStateId int = 1
		   ,@LicensePlate nvarchar(20) = null
		   ,@RegistrationExpiration datetime2(7) = '2023-01-09'
		   ,@ModifiedBy int = 1

	Execute dbo.UserVehicles_SelectById @Id

	Execute dbo.UserVehicles_Update @Id 
								   ,@VIN
							       ,@Color
							       ,@OwnerId
							       ,@CarModelId
							       ,@LocationId
							       ,@RegisteredStateId
							       ,@LicensePlate
							       ,@RegistrationExpiration
							       ,@ModifiedBy

	Execute dbo.UserVehicles_SelectById @Id

*/

BEGIN

	DECLARE @dateNow datetime2(7) = GETUTCDATE();

	UPDATE dbo.UserVehicles
	SET [VIN] = @VIN
	   ,[Color] = @Color
	   ,[OwnerId] = @OwnerId
	   ,[CarModelId] = @CarModelId
	   ,[LocationId] = @LocationId
	   ,[RegisteredStateId] = @RegisteredStateId
	   ,[LicensePlate] = @LicensePlate
	   ,[RegistrationExpiration] = @RegistrationExpiration
	   ,[ModifiedBy] = @ModifiedBy
	   ,[DateModified] = @dateNow
	WHERE @Id = Id

END
GO
