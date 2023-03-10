USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[UserTokens_Insert]    Script Date: 12/16/2022 12:52:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Darryl Yeargin
-- Create date: 12/15/2022
-- Description:	insert proc for UserTokens
-- Code Reviewer: Jacob Helton


-- MODIFIED BY: author
-- MODIFIED DATE:12/1/2020
-- Code Reviewer: 
-- Note: 
-- =============================================
CREATE	proc [dbo].[UserTokens_Insert]
			@Token varchar(200)
			,@UserId int
			,@TokenTypeId int


as

/*---------------TEST CODE------------------------

	DECLARE	@Token varchar(200) = 'randomTokenString'
			,@UserId int = 1
			,@TokenTypeId int = 1

	EXECUTE	dbo.UserTokens_Insert
				@Token
				,@UserId
				,@TokenTypeId

	EXECUTE	dbo.UserTokens_Select_ByTokenTypeId
				@TokenTypeId

	EXECUTE dbo.UserTokens_Delete_ByToken
				@Token

	EXECUTE	dbo.UserTokens_Select_ByTokenTypeId
				@TokenTypeId

*/

BEGIN

	INSERT INTO [dbo].[UserTokens]
			([Token]
			,[UserId]
			,[TokenTypeId])
	VALUES
			(@Token
			,@UserId
			,@TokenTypeId)

END		   


GO
