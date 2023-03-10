USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Certifications_Update]    Script Date: 1/26/2023 7:50:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Edwin Ye
-- Create date: 1/25/2023
-- Description:	Update Certifications
-- Code Reviewer: Colin Gibney


-- MODIFIED BY: 
-- MODIFIED DATE: 
-- Code Reviewer: 
-- Note: 
-- =============================================

CREATE Proc [dbo].[Certifications_Update]
				@Name nvarchar (100)
				,@Description nvarchar(500)
				,@OrganizationId int
				,@FileId int
				,@ExpirationDate datetime2(7)
				,@ModifiedBy int
				,@Id int

AS

/*---------------TEST CODE------------------

   DECLARE @Id int = 2;

   DECLARE		 @Name nvarchar (100) = 'name'
				,@Description nvarchar(500) = 'description'
				,@OrganizationId = 8
				,@FileId = 8
				,@ExpirationDate datetime2(7) = '01/25/2023'
				,@ModifiedBy int = 1
	
	Execute [dbo].[Certifications_Select_ById] @Id

	Execute [dbo].[Certifications_Update]
				@Name 
				,@Description 
				,@OrganizationId
				,@FileId
				,@ExpirationDate 
				,@ModifiedBy 
				,@Id 

	Execute [dbo].[Certifications_Select_ById] @Id

*/

BEGIN

DECLARE @DateModified datetime2 = getutcdate();

	UPDATE [dbo].[Certifications]
		SET Name = @Name
			,Description = @Description
			,OrganizationId = @OrganizationId
			,FileId = @FileId
			,ExpirationDate = @ExpirationDate
			,ModifiedBy = @ModifiedBy
			,DateModified = @DateModified
		WHERE Id = @Id

END
GO
