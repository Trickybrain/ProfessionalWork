USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Users_Select_AuthData_V3]    Script Date: 2/3/2023 9:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Lauren Greenwald
-- Create date: 1/31/2022
-- Description:	Users Select AuthData V3
-- Code Reviewer: Jason Spoon

-- MODIFIED BY: 
-- MODIFIED DATE: 
-- Code Reviewer: 
-- Note: 
-- =============================================
CREATE proc [dbo].[Users_Select_AuthData_V3]
			@Email nvarchar(255)

as

/*----------------TEST CODE---------------------

	DECLARE	@Email nvarchar(255) = 'orgMembers@test.com'
	EXECUTE	dbo.Users_Select_AuthData_V3 @Email

	select * 
	from dbo.Users

*/

BEGIN

	SELECT	Password
			,u.Id
			,FirstName
			,Mi
			,LastName
			,AvatarUrl
			,Email
			,IsConfirmed
			,o.OrganizationId

	FROM	[dbo].[Users] as u
			LEFT OUTER JOIN dbo.OrganizationMembers as o
			on u.Id = o.UserId
	WHERE	Email = @Email

	SELECT	r.[Name]

	FROM	[dbo].[Users] as u
			join dbo.UserRoles as ur
			on ur.UserId = u.Id
			join dbo.Roles as r
			on r.Id = ur.RoleId
		
	WHERE	Email = @Email
	
END
GO
