USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Organizations_Select_ByUserId]    Script Date: 12/21/2022 4:15:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Kathy Xayasomloth
-- Create date: 12/17/2022
-- Description:	Selecting all Organization types
-- Code Reviewer: Darryl Yeargin


-- MODIFIED BY: author
-- MODIFIED DATE:
-- Code Reviewer: 
-- Note: 
-- =============================================



CREATE proc [dbo].[Organizations_Select_ByUserId]

	@UserId int 

as

/*---------------TEST CODE------------------

	Declare @UserId int = 8

	Execute [dbo].[Organizations_Select_ByUserId] @UserId


*/


BEGIN

SELECT         o.[Id]
			, ot.Id as OrgId
			, ot.[Name] as OrgType
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
			, s.[Id] as [State]
			, s.[Name]
			, s.Code
			, l.Zip
			, o.[SiteUrl]
			, o.[IsDeleted]
			, o.[CreatedBy]
			, o.[ModifiedBy]

FROM [dbo].[Organizations] as o join dbo.Users as u
		on o.CreatedBy = u.Id 
	inner join dbo.Locations as l 
		on o.PrimaryLocationId = l.Id
	inner join dbo.LocationTypes as lt
		on l.LocationTypeId = lt.Id
	inner join dbo.States as s
		on l.StateId = s.Id
	inner join dbo.OrganizationTypes as ot
		on o.OrganizationTypeId = ot.Id
WHERE u.Id = @UserId


END

GO
