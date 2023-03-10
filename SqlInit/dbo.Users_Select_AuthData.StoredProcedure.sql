USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Users_Select_AuthData]    Script Date: 12/26/2022 6:47:49 PM ******/
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
-- MODIFIED DATE: 12/26/2022
-- Code Reviewer: Jacob Helton
-- Note: needed to add the user Id as part of the select for login purposes
-- =============================================
CREATE	proc [dbo].[Users_Select_AuthData]
			@Email nvarchar(255)

as

/*----------------TEST CODE---------------------

	DECLARE	@Email nvarchar(255) = 'testEmail@test.com'
	EXECUTE	dbo.Users_Select_AuthData @Email

*/

BEGIN

	SELECT	UserRoles =	(SELECT r.Name as role
						FROM dbo.Roles as r join dbo.UserRoles as ur
								on r.Id = ur.RoleId AND u.Id = ur.UserId
						FOR JSON AUTO)
			,[Password]
			,Id

	FROM	[dbo].[Users] as u
	WHERE	Email = @Email

END


GO
