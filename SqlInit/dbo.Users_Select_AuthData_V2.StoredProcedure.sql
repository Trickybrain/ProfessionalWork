USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Users_Select_AuthData_V2]    Script Date: 1/5/2023 5:48:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Darryl Yeargin
-- Create date: 12/15/2022
-- Description:	select by email to get all 
--				UserRoles and Password for given
--				UserId to be put inside Auth Cookie
-- Code Reviewer: Jacob Helton

-- MODIFIED BY: Darryl Yeargin
-- MODIFIED DATE: 1/5/2023
-- Code Reviewer: 
-- Note: refactored roles select
-- =============================================
CREATE	proc [dbo].[Users_Select_AuthData_V2]
			@Email nvarchar(255)

as

/*----------------TEST CODE---------------------

	DECLARE	@Email nvarchar(255) = '123TestUserSuperUser@reparrot.com'
	EXECUTE	dbo.Users_Select_AuthData_V2 @Email

*/

BEGIN

	SELECT	[Password]
			,Id
			,FirstName
			,LastName
			,AvatarUrl
			,Mi
			,IsConfirmed

	FROM	[dbo].[Users]
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
