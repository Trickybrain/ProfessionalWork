USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[UserVehicles_UpdateV2]    Script Date: 2/6/2023 4:45:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Jacob Helton
-- Create date: 1/9/2023
-- Description: Updates a UserVehicle
-- Code Reviewer: Liliana Meriweather

-- MODIFIED BY: Jacob Kroft
-- MODIFIED DATE: 2/3/2023
-- Code Reviewer:
-- Note:
-- =============================================

CREATE proc [dbo].[UserVehicles_UpdateV2] @Id int
								  ,@VIN nvarchar(100)
								  ,@Color nvarchar(100)
								  ,@OwnerId int
								  ,@CarModelId int
							      ,@LocationId int
							      ,@RegisteredStateId int = null
							      ,@LicensePlate nvarchar(20) = null
							      ,@RegistrationExpiration datetime2(7) = null
								  ,@LastOilChange datetime2(7) = null
							      ,@ModifiedBy int

as

/* ----- TEST CODE -----

	Declare @Id int = 24
		   ,@VIN nvarchar(100) = '6Q2DA22U13456788'
		   ,@Color nvarchar(100) = 'Silver'
		   ,@OwnerId int = 87
		   ,@CarModelId int = 1
		   ,@LocationId int = 1
		   ,@RegisteredStateId int = 5
		   ,@LicensePlate nvarchar(20) = '8CAZ234'
		   ,@RegistrationExpiration datetime2(7) = '2023-08-08'
		   ,@LastOilChange datetime2(7) = '2022-10-12'
		   ,@ModifiedBy int = 87

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
								   ,@LastOilChange
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
	   ,[LastOilChange] = @LastOilChange
	   ,[ModifiedBy] = @ModifiedBy
	   ,[DateModified] = @dateNow
	WHERE @Id = Id

END
GO
