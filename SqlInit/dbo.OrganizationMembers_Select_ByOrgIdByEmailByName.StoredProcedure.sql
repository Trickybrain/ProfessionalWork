USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[OrganizationMembers_Select_ByOrgIdByEmailByName]    Script Date: 2/3/2023 9:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Lauren Greenwald
-- Create date: 01/30/2023
-- Description:	Organization Members Select By Org By Email By Name
-- Code Reviewer: Jason Spoon


-- MODIFIED BY: author
-- MODIFIED DATE:
-- Code Reviewer: 
-- Note: 
-- =============================================

CREATE proc [dbo].[OrganizationMembers_Select_ByOrgIdByEmailByName]
			@PageIndex int
			,@PageSize int
			,@query nvarchar(100)

AS
/*-----------------------TEST CODE-----------------------
	DECLARE @PageIndex int = 0
			,@PageSize int = 2
			,@query nvarchar(100) = 'org'

	EXECUTE dbo.OrganizationMembers_Select_ByOrgIdByEmailByName 
			@PageIndex
			,@PageSize
			,@query
*/

BEGIN

	Declare @offset int = @PageIndex * @PageSize

	SELECT	om.Id
			,om.OrganizationId 
			,o.Name
			,u.Id as UserId
			,u.FirstName
			,u.Mi
			,u.LastName
			,u.Email
			,u.AvatarUrl
			,r.Id as RoleId
			,r.Name
			,p.Id as PositionTypeId
			,p.Name
			,TotalCount = COUNT(1) OVER()

	from dbo.OrganizationMembers as om
		INNER JOIN dbo.Organizations as o
		On om.OrganizationId = o.Id
		INNER JOIN dbo.Users as u
		on om.UserId = u.Id
		INNER JOIN dbo.Roles as r
		on r.Id = om.RoleId
		INNER JOIN dbo.PositionTypes as p
		on om.PositionType = p.Id

	WHERE (u.email LIKE '%' + @query + '%' 
			or u.FirstName LIKE '%' + @query + '%' 
			or u.LastName LIKE '%' + @query + '%')

	ORDER BY om.Id

	OFFSET @offset Rows
		Fetch Next @PageSize Rows ONLY

END
GO
