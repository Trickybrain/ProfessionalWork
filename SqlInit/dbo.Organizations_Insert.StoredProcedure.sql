USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Organizations_Insert]    Script Date: 12/21/2022 4:15:01 PM ******/
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
-- MODIFIED DATE:
-- Code Reviewer: 
-- Note: 
-- =============================================



CREATE PROC [dbo].[Organizations_Insert]
			  @OrganizationTypeId int
			, @Name nvarchar(200)
			, @Description nvarchar(200)
			, @LogoUrl nvarchar(255)
			, @BusinessPhone nvarchar(20)
			, @PrimaryLocationId int 
			, @SiteUrl nvarchar(255)
			, @IsDeleted bit
			, @CreatedBy int
			, @ModifiedBy int
			, @Id int OUTPUT

/*---------------TEST CODE------------------

	DECLARE @Id int = 0;
	DECLARE	  @OrganizationTypeId int = '11'
			, @Name nvarchar(200) = 'Test College Insert'
			, @Description nvarchar(200) = 'College/University'
			, @LogoUrl nvarchar(255) = 'https://tinyurl.com/z46zmajs'
			, @BusinessPhone nvarchar(20) = '12345678901'
			, @PrimaryLocationId int = 1
			, @SiteUrl nvarchar(255) = 'https://www.csu.edu/'
			, @IsDeleted bit = 0
			, @CreatedBy int = '1'
			, @ModifiedBy int = '6'
   

	Execute [dbo].[Organizations_Insert]

			 @OrganizationTypeId
			, @Name
			, @Description
			, @LogoUrl
			, @BusinessPhone
			, @PrimaryLocationId
			, @SiteUrl
			, @IsDeleted
			, @CreatedBy
			, @ModifiedBy
			, @Id OUTPUT

	Execute [dbo].[Organizations_SelectById] @Id

*/

as

BEGIN


INSERT INTO [dbo].[Organizations]
			([OrganizationTypeId]
			,[Name]
			,[Description]
			,[LogoUrl]
			,[BusinessPhone]
			,[PrimaryLocationId]
			,[SiteUrl]
			,[IsDeleted]
			,[CreatedBy]
			,[ModifiedBy]
			)
		VALUES
			(@OrganizationTypeId
			, @Name
			, @Description
			, @LogoUrl
			, @BusinessPhone
			, @PrimaryLocationId 
			, @SiteUrl
			, @IsDeleted
			, @CreatedBy
			, @ModifiedBy)

		SET @Id = SCOPE_IDENTITY();


END


GO
