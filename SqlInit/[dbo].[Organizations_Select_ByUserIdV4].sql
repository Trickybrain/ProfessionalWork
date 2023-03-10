USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Organizations_Select_ByUserIdV4]    Script Date: 2/9/2023 4:30:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE proc [dbo].[Organizations_Select_ByUserIdV4]

	@UserId int 

as

/*---------------TEST CODE------------------

	Declare @UserId int = 85

	Execute [dbo].[Organizations_Select_ByUserIdV4] @UserId

	select * from dbo.Users

*/


BEGIN

SELECT         o.[Id]
			, o.[Name]
			,o.[Description]
			, o.[BusinessPhone]
			, o.[SiteUrl]
			, o.[IsDeleted]

FROM dbo.Organizations as o
	left outer join [dbo].OrganizationMembers as om
		on om.OrganizationId = o.id
	
WHERE om.UserId = @UserId


END
GO
