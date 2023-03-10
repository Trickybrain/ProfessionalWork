USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Blogs_SelectAll]    Script Date: 12/23/2022 10:16:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Kyle Zarate
-- Create date: 12/19/2022
-- Description:	Blogs Select All (Paginated)
-- Code Reviewer: Jacob Helton


-- MODIFIED BY: author
-- MODIFIED DATE:
-- Code Reviewer: 
-- Note: 
-- =============================================

CREATE proc [dbo].[Blogs_SelectAll]

			 @PageIndex int
		   , @PageSize int

as

/*---------------TEST CODE------------------

	Declare  @PageIndex int = 0
		   , @PageSize  int = 10

	 Execute [Blogs_SelectAll] @PageIndex, @PageSize 

*/

BEGIN

		DECLARE @Offset int = @PageIndex * @PageSize

		SELECT	b.[Id]
				,b.[BlogTypeId]
				,bt.[Name]
				,b.[AuthorId] 
				,u.[FirstName]
				,u.[LastName]
				,u.[AvatarUrl]
				,b.[Title]
				,b.[Subject]
				,b.[Content]
				,b.[IsPublished]
				,b.[ImageUrl]
				,b.[DateCreated]
				,b.[DateModified]
				,b.[DatePublish]
				,TotalCount = COUNT(1) OVER() 
		FROM [dbo].[Blogs] as b 
		inner join dbo.BlogTypes as bt
			on b.BlogTypeId = bt.Id
		inner join dbo.Users as u
			on b.AuthorId = u.Id

		ORDER BY b.[Id]

		OFFSET @offset ROWS
		FETCH NEXT @PageSize ROWS ONLY

END 

GO
