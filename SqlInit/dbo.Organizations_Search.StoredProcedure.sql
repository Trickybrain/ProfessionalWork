USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Organizations_Search]    Script Date: 12/21/2022 4:15:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Kathy Xayasomloth
-- Create date: 12/17/2022
-- Description:	Selecting all Organization types
-- Code Reviewer: Liliana Meriweather


-- MODIFIED BY: author
-- MODIFIED DATE: 12/19/2022
-- Code Reviewer: 
-- Note: Waiting for Location table info
-- =============================================

CREATE proc [dbo].[Organizations_Search]
			 @PageIndex int
		   , @PageSize int
		   , @Query nvarchar(100)

as

/*---------------TEST CODE------------------
		
	Declare  @PageIndex int = 0
			   , @PageSize  int = 2
			   , @Query nvarchar(100) = 'College'
	
	Execute [dbo].[Organizations_Search] @PageIndex, @PageSize, @Query


*/

BEGIN

	DECLARE @Offset int = @PageIndex * @PageSize

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

	WHERE (o.[Name] LIKE '%' + @Query + '%')
		OR (o.[Description] LIKE '%' + @Query + '%')
		OR (o.SiteUrl LIKE '%' + @Query + '%')
		 
		Order BY o.Id
		OFFSET @offSet Rows
		Fetch Next @PageSize Rows ONLY
	
END


GO
