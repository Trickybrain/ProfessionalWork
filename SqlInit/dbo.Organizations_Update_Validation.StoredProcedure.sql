USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Organizations_Update_Validation]    Script Date: 2/9/2023 9:20:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:	Jacob Kroft
-- Create date: 2/9/2023
-- Description:	Updating an Organizations Validation
-- Code Reviewer: 


-- MODIFIED BY: 
-- MODIFIED DATE: 
-- Code Reviewer: 
-- Note: 
-- =============================================

CREATE proc [dbo].[Organizations_Update_Validation]
			@ModifiedBy int
			, @isValidated bit
			, @Id int 

as

/*---------------TEST CODE------------------

	DECLARE @Id int = 2;

	DECLARE		@ModifiedBy int = 86
				, @isValidated int = 0
	
	SELECT	*
	FROM	dbo.Organizations
	WHERE	Id = @Id

	Execute [dbo].[Organizations_Update_Validation]
				@ModifiedBy
				, @isValidated
				, @Id

	SELECT	*
	FROM	dbo.Organizations
	WHERE	Id = @Id

*/


BEGIN

DECLARE @DateModified DATETIME2 = getutcdate();

	 UPDATE [dbo].[Organizations]
		SET [DateModified] = @DateModified 
			,[ModifiedBy] = @ModifiedBy
			,[isValidated] = @isValidated
		WHERE Id = @Id


 END



GO
