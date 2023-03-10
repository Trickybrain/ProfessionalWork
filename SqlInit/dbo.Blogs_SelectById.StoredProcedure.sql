USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Blogs_SelectById]    Script Date: 12/23/2022 10:16:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Kyle Zarate
-- Create date: 12/19/2022
-- Description:	Blogs Select By Id
-- Code Reviewer: Jacob Helton


-- MODIFIED BY: author
-- MODIFIED DATE:
-- Code Reviewer: 
-- Note: 
-- =============================================

CREATE proc [dbo].[Blogs_SelectById]

			@Id int 

as

/*---------------TEST CODE------------------

	Declare @Id int = 1

	Execute [dbo].[Blogs_SelectById] @Id 

*/

BEGIN

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
			FROM [dbo].[Blogs] as b 
			inner join dbo.BlogTypes as bt
				on b.BlogTypeId = bt.Id
			inner join dbo.Users as u
				on b.AuthorId = u.Id
			WHERE b.Id = @Id

END
GO
