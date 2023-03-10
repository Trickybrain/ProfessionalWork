USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Organizations_Delete]    Script Date: 12/21/2022 4:15:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Kathy Xayasomloth
-- Create date: 12/17/2022
-- Description:	Updating IsDeleted from 0 to 1
-- Code Reviewer: Darryl Yeargin


-- MODIFIED BY: author
-- MODIFIED DATE: 12/20/2022
-- Code Reviewer: Liliana Meriweather
-- Note: 
-- =============================================

CREATE proc [dbo].[Organizations_Delete]
		 @ModifiedBy int
		, @Id int
		 
as

/*----------------- TEST CODE --------------------


DECLARE @Id int = 2;
DECLARE @ModifiedBy int = 7

Execute [dbo].[Organizations_SelectById] @Id

Execute [dbo].[Organizations_Delete] @ModifiedBy, @Id

Execute [dbo].[Organizations_SelectById] @Id
	

*/

BEGIN

		DECLARE @DateModified DATETIME2 = GETUTCDATE();

		UPDATE [dbo].[Organizations]
		   SET [IsDeleted] = 1
			  ,[ModifiedBy] = @ModifiedBy
			  ,[DateModified] = @DateModified
		 WHERE Id = @Id;

END


GO
