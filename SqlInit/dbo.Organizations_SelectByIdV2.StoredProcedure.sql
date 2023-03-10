USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Organizations_SelectByIdV2]    Script Date: 2/9/2023 9:20:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:	Jacob Kroft
-- Create date: 2/9/2023
-- Description:	Select Organization by Id
-- Code Reviewer: Aaron Elliott


-- MODIFIED BY: 
-- MODIFIED DATE:
-- Code Reviewer: 
-- Note: 
-- =============================================

CREATE proc [dbo].[Organizations_SelectByIdV2]
			@Id int 

/*---------------TEST CODE------------------

	Declare @Id int = 1

	Execute [dbo].[Organizations_SelectByIdV2] @Id

*/
as

BEGIN


SELECT		   o.[Id]
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
	WHERE o.Id = @Id
			 	

END

GO
