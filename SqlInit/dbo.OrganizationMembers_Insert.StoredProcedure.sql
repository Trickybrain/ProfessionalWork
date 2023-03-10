USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[OrganizationMembers_Insert]    Script Date: 2/3/2023 9:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Lauren Greenwald
-- Create date: 01/30/2023
-- Description:	Organization Members Insert
-- Code Reviewer: Jason Spoon


-- MODIFIED BY: author
-- MODIFIED DATE:
-- Code Reviewer: 
-- Note: 
-- =============================================

CREATE proc [dbo].[OrganizationMembers_Insert]
			@OrganizationId int
			,@UserId int
			,@RoleId int
			,@PositionType int
			,@OrganizationEmail nvarchar(100)
			,@Id int OUTPUT

as

/*---------------TEST CODE------------------

	Declare @Id int = 0

	Declare @OrganizationId int = 161
			,@UserId int = 119
			,@RoleId int = 2
			,@PositionType int = 2
			,@OrganizationEmail nvarchar(100) = 'BlankSomeone@test.com'

	Execute dbo.OrganizationMembers_Insert
			@OrganizationId
			,@UserId
			,@RoleId
			,@PositionType
			,@OrganizationEmail
			,@Id

	Select *
	From dbo.OrganizationMembers

			select * from dbo.Users

			select * from dbo.Organizations

*/

BEGIN

		INSERT INTO dbo.OrganizationMembers
					([OrganizationId]
					,[UserId]
					,[RoleId]
					,[PositionType]
					,[OrganizationEmail])
			VALUES 
					(@OrganizationId
					,@UserId
					,@RoleId
					,@PositionType
					,@OrganizationEmail)

			SET @Id = SCOPE_IDENTITY();

END
GO
