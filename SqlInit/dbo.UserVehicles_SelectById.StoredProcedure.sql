USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[UserVehicles_SelectById]    Script Date: 1/10/2023 2:27:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Jacob Helton
-- Create date: 1/9/2023
-- Description: Selects UserVehicle by id
-- Code Reviewer: Liliana Meriweather

-- MODIFIED BY: 
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================

CREATE proc [dbo].[UserVehicles_SelectById] @Id int

as

/* ----- TEST CODE -----

	Execute dbo.UserVehicles_SelectById 1

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
		  ,uv.[isArchived]
		  ,uv.[CreatedBy]
		  ,uv.[ModifiedBy]
		  ,uv.[DateCreated]
		  ,uv.[DateModified]
	FROM dbo.UserVehicles uv inner join dbo.Users u
		on uv.OwnerId = u.Id
	inner join dbo.Locations l
		on uv.LocationId = l.Id
	Where @Id = uv.[Id]

END
GO
