USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Organizations_Update]    Script Date: 12/21/2022 4:15:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:	Kathy Xayasomloth
-- Create date: 12/17/2022
-- Description:	Selecting all Organization types
-- Code Reviewer: Darryl Yeargin


-- MODIFIED BY: author
-- MODIFIED DATE: 12/19/2022
-- Code Reviewer: 
-- Note: 
-- =============================================

CREATE proc [dbo].[Organizations_Update]
			  @OrganizationTypeId int
			, @Name nvarchar(200)
			, @Description nvarchar(200)
			, @LogoUrl nvarchar(255)
			, @BusinessPhone nvarchar(20)
			, @PrimaryLocationId int
			, @SiteUrl nvarchar(255)
			, @IsDeleted bit
			, @ModifiedBy int
			, @Id int 

as

/*---------------TEST CODE------------------

   DECLARE @Id int = 2;

   DECLARE		  @OrganizationTypeId int = 9
				, @Name nvarchar(200) = 'Long beach state peer review'
				, @Description nvarchar(200) = 'College/University'
				, @LogoUrl nvarchar(255) = 'https://tinyurl.com/bdzc2hmz'
				, @BusinessPhone nvarchar(20) = '1-123-4567'
				, @PrimaryLocationId int = 1
				, @SiteUrl nvarchar(255) = 'https://www.csulb.edu/'
				, @IsDeleted bit = 0
				, @ModifiedBy int = 6
	
	Execute [dbo].[Organizations_SelectById] @Id

	Execute [dbo].[Organizations_Update]
				@OrganizationTypeId
				, @Name
				, @Description
				, @LogoUrl
				, @BusinessPhone
				, @PrimaryLocationId
				, @SiteUrl
				, @IsDeleted
				, @ModifiedBy
				, @Id

	Execute [dbo].[Organizations_SelectById] @Id

*/


BEGIN

DECLARE @DateModified DATETIME2 = getutcdate();

	 UPDATE [dbo].[Organizations]
		SET [OrganizationTypeId] = @OrganizationTypeId
			,[Name]= @Name
			,[Description] = @Description
			,[LogoUrl] = @LogoUrl
			,[BusinessPhone] = @BusinessPhone
			,[PrimaryLocationId] = @PrimaryLocationId
			,[SiteUrl] = @SiteUrl
			,[IsDeleted] = @IsDeleted
			,[DateModified] = @DateModified 
			,[ModifiedBy] = @ModifiedBy
		WHERE Id = @Id


 END



GO
