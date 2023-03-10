USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[UserTokens_Delete_ByToken]    Script Date: 12/16/2022 12:52:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Darryl Yeargin
-- Create date: 12/15/2022
-- Description:	deletes token by token value
-- Code Reviewer: Jacob Helton


-- MODIFIED BY: author
-- MODIFIED DATE:12/1/2020
-- Code Reviewer: 
-- Note: 
-- =============================================
CREATE	proc [dbo].[UserTokens_Delete_ByToken]
				@Token varchar(200)

as

/*----------------TEST CODE--------------------
	DECLARE @Token varchar(200) = 'randomTokenString'
	EXECUTE dbo.UserTokens_Delete_ByToken
				@Token

*/

BEGIN

	DELETE FROM [dbo].[UserTokens]
    WHERE		Token = @Token

END

GO
