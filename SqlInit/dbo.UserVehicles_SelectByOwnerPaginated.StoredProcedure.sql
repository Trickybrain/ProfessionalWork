USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[UserVehicles_SelectByOwnerPaginated]    Script Date: 1/10/2023 2:27:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Jacob Helton
-- Create date: 1/9/2023
-- Description: Selects a paginated list of UserVehicles by owner
-- Code Reviewer: Liliana Meriweather

-- MODIFIED BY: 
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================

CREATE proc [dbo].[UserVehicles_SelectByOwnerPaginated] @PageIndex int
												  ,@PageSize int
												  ,@OwnerId int

as

/* ----- TEST CODE -----

	Execute dbo.UserVehicles_SelectByOwnerPaginated 0, 5, 1

*/

BEGIN

	Declare @offset int = @PageIndex * @PageSize

	SELECT uv.[Id]
		  ,uv.[VIN]
		  ,uv.[Color]
		  ,uv.[OwnerId]
		  ,uv.[CarModelId]
		  ,uv.[LocationId]
		  ,uv.[RegisteredStateId]
		  ,uv.[LicensePlate]
		  ,uv.[RegistrationExpiration]
		  ,uv.[isArchived]
		  ,uv.[CreatedBy]
		  ,uv.[ModifiedBy]
		  ,uv.[DateCreated]
		  ,uv.[DateModified]
		  ,TotalCount = COUNT(1) OVER()
	FROM dbo.UserVehicles uv inner join dbo.Users u
		on uv.OwnerId = u.Id
	inner join dbo.Locations l
		on uv.LocationId = l.Id
	WHERE uv.OwnerId = @OwnerId and isArchived != 1

	Order by uv.[Id]
	OFFSET @offSet Rows
	Fetch Next @PageSize Rows ONLY

END
GO
