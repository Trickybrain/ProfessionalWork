USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Certifications_Delete_ById]    Script Date: 1/26/2023 7:50:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Edwin Ye
-- Create date: 1/25/2023
-- Description:	Certifications Delete by Id 
-- Code Reviewer:  Colin Gibney


-- MODIFIED BY: author
-- MODIFIED DATE:
-- Code Reviewer: 
-- Note: 
-- =============================================

CREATE proc [dbo].[Certifications_Delete_ById] 

			@Id int

as

/*---------------TEST CODE------------------

	Declare  @Id int = 5

	Select *
	From [dbo].[Certifications]
	Where Id = @Id

	Execute [dbo].[Certifications_Delete_ById]  @Id

	Select *
	From [dbo].[Certifications]
	Where Id = @Id

*/

BEGIN

	Delete From	 [dbo].[Certifications]

	WHERE Id = @Id

END
GO
