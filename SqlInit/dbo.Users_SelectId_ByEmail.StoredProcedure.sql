USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectId_ByEmail]    Script Date: 1/12/2023 6:23:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Darryl Yeargin
-- Create date: 1/12/2023
-- Description:	select userId by Email for password reset
-- Code Reviewer: Bao Hana Phung

-- MODIFIED BY: 
-- MODIFIED DATE: 
-- Code Reviewer: 
-- Note:
-- =============================================
CREATE	proc [dbo].[Users_SelectId_ByEmail]
			@Email nvarchar(255)

as

/*----------------TEST CODE---------------------

	EXECUTE	[dbo].[Users_SelectId_ByEmail] '123TestUserSuperUser@reparrot.com';

*/

BEGIN

	SELECT	Id

	FROM	[dbo].[Users]
	WHERE	Email = @Email

END


GO
