USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Organizations_SelectAll_NoPagV2]    Script Date: 2/6/2023 4:45:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Seong Gwon
-- Create date: 1/27/2023
-- Description:	Selecting a un-paginated list of organizations
-- Code Reviewer: Liliana Meriweather

-- MODIFIED BY: Jacob Kroft
-- MODIFIED DATE: 2/3/2023
-- Code Reviewer:
-- Note:
-- =============================================

CREATE proc [dbo].[Organizations_SelectAll_NoPagV2]

/*-----------------------TEST-----------------------

	Execute [dbo].[Organizations_SelectAll_NoPag]

*/

as

BEGIN

	SELECT	o.[Id]
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

END
GO
