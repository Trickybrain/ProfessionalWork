USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[UserVehicles_SelectByOwnerId_NoPagV2]    Script Date: 2/6/2023 4:45:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Seong Gwon
-- Create date: 1/27/2023
-- Description: Selects a un-paginated list of UserVehicles by ownerId
-- Code Reviewer: Liliana Meriweather

-- MODIFIED BY: Jacob Kroft
-- MODIFIED DATE: 2/3/2023
-- Code Reviewer:
-- Note:
-- =============================================

CREATE proc [dbo].[UserVehicles_SelectByOwnerId_NoPagV2] 
			
			@OwnerId int

as

/* ----- TEST CODE -----

	Declare @OwnerId int = 89

	Execute dbo.UserVehicles_SelectByOwnerId_NoPag @OwnerId

*/

BEGIN

	SELECT uv.[Id]
		  ,uv.[VIN]
		  ,uv.[Color]
		  ,uv.[OwnerId]
		  ,uv.[CarModelId]
		  ,uv.[LocationId]
		  ,uv.[RegisteredStateId]
		  ,uv.[LicensePlate]
		  ,uv.[RegistrationExpiration]
		  ,uv.[LastOilChange]
		  ,uv.[isArchived]
		  ,uv.[CreatedBy]
		  ,uv.[ModifiedBy]
		  ,uv.[DateCreated]
		  ,uv.[DateModified]
	FROM dbo.UserVehicles uv inner join dbo.Users u
		on uv.OwnerId = u.Id
	inner join dbo.Locations l
		on uv.LocationId = l.Id
	WHERE uv.OwnerId = @OwnerId and isArchived != 1
	Order by uv.[Id]

END
GO
