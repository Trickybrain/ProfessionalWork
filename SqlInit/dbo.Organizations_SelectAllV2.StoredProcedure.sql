USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Organizations_SelectAllV2]    Script Date: 2/10/2023 10:50:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:	Kathy Xayasomloth
-- Create date: 12/17/2022
-- Description:	Selecting all Organization types
-- Code Reviewer: Liliana Meriweather


-- MODIFIED BY: Jacob Kroft
-- MODIFIED DATE: 2/7/2023
-- Code Reviewer: 
-- Note: 
-- =============================================

CREATE proc [dbo].[Organizations_SelectAllV2]

			 @PageIndex int
		   , @PageSize int

/*-----------------------TEST-----------------------

	Declare  @PageIndex int = 0
		   , @PageSize  int = 200

	 Execute [dbo].[Organizations_SelectAllV2] 
			@PageIndex
		  , @PageSize

*/

as

BEGIN

DECLARE @Offset int = @PageIndex * @PageSize

	SELECT   o.[Id]
			, ot.Id 
			, ot.[Name]
			, o.[Name]
			, o.[Description]
			, o.[LogoUrl]
			, o.[BusinessPhone]
			, o.PrimaryLocationId
			, l.LocationTypeId
			, lt.[Name]
			, l.Id
			, l.LineOne
			, l.LineTwo
			, l.City
			, s.[Id]
			, s.[Name]
			, s.Code
			, l.Zip
			, o.[SiteUrl]
			, o.[IsDeleted]
			, o.[IsValidated]
			, o.[CreatedBy]
			, o.[ModifiedBy]
			, TotalCount = Count(1) OVER()
	FROM [dbo].[Organizations] as o
	inner join dbo.Locations as l 
		on o.PrimaryLocationId = l.Id
	inner join dbo.LocationTypes as lt
		on l.LocationTypeId = lt.Id
	inner join dbo.States as s
		on l.StateId = s.Id
	inner join dbo.OrganizationTypes as ot
		on o.OrganizationTypeId = ot.Id
		ORDER BY o.Id

		OFFSET @offset ROWS
		FETCH NEXT @PageSize ROWS ONLY

END


GO
