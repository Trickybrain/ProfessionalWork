USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Users_Confirm]    Script Date: 1/12/2023 6:23:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Darryl Yeargin
-- Create date: 12/15/2022
-- Description:	updates user IsConfirmed status for email confirmation
-- Code Reviewer: Jacob Helton


-- MODIFIED BY: Darryl Yeargin
-- MODIFIED DATE: 1/12/2023
-- Code Reviewer: Bao Hana Phung
-- Note: added delete token upon confirmation
-- =============================================
CREATE	proc [dbo].[Users_Confirm]
			@Id int
			,@Token nvarchar(200)

as

/*-----------------TEST CODE---------------------

	DECLARE @Id int = 98;
	DECLARE @Token nvarchar(200) = '1747aa63-6052-47ac-a7f4-5b9cb786a65f';

	EXECUTE dbo.Users_Confirm
				@Id
				,@Token

	EXECUTE dbo.Users_SelectById @Id


*/

BEGIN

	DECLARE	@datNow datetime2(7) = getutcdate();

	UPDATE	[dbo].[Users]
	SET		[IsConfirmed] = 1
			,[DateModified] = @datNow
	WHERE	Id = @Id

	EXECUTE [dbo].[UserTokens_Delete_ByToken] @Token

END


GO
