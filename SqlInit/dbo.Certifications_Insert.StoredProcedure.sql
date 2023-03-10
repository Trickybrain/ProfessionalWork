USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Certifications_Insert]    Script Date: 1/31/2023 5:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Edwin Ye
-- Create date: 1/25/2023
-- Description:	Insert Certifications
-- Code Reviewer: Colin Gibney
 

-- MODIFIED BY: 
-- MODIFIED DATE: 
-- Code Reviewer: 
-- Note: 
-- =============================================


CREATE PROC [dbo].[Certifications_Insert]
				@Name nvarchar (100)
				,@Description nvarchar(500)
				,@OrganizationId int
				,@FileId int
				,@ExpirationDate datetime2(7)
				,@CreatedBy int
				,@ModifiedBy int
				,@Id int OUTPUT

AS

/*---------------TEST CODE------------------

	DECLARE @Id int = 0;
	DECLARE		@Name nvarchar (100) = 'name test'
				,@Description nvarchar(500) = 'description test'
				,@OrganizationId int = 8
				,@FileId int = 8
				,@ExpirationDate datetime2(7) = '01/25/2023'
				,@CreatedBy int = 1
				,@ModifiedBy int = 1
   

	Execute [dbo].[Certifications_Insert]

			 @Name
			, @Description
			, @OrganizationId
			, @FileId 
			, @ExpirationDate
			, @CreatedBy
			, @ModifiedBy
			, @Id OUTPUT

	Execute [dbo].[Certifications_Select_ById] @Id
	select * from [dbo].[Certifications]

*/

BEGIN

INSERT INTO [dbo].[Certifications]
			(Name
			,Description
			,OrganizationId
			,FileId
			,ExpirationDate
			,CreatedBy
			,ModifiedBy)

		VALUES
			(@Name
			,@Description
			,@OrganizationId
			,@FileId
			,@ExpirationDate
			,@CreatedBy
			,@ModifiedBy)
		
		SET @Id = SCOPE_IDENTITY();
		
END
GO
