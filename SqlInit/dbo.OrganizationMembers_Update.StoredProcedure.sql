USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[OrganizationMembers_Update]    Script Date: 2/3/2023 9:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Lauren Greenwald
-- Create date: 01/30/2023
-- Description:	Organization Members Update
-- Code Reviewer: Jason Spoon


-- MODIFIED BY: author
-- MODIFIED DATE:
-- Code Reviewer: 
-- Note: 
-- =============================================

CREATE proc [dbo].[OrganizationMembers_Update]
			@OrganizationId int
			,@UserId int
			,@RoleId int
			,@PositionType int
			,@OrganizationEmail nvarchar(100)
			,@Id int

AS

---------------TEST CODE------------------

/*
	Declare @Id int = 1
			,@OrganizationId int = 161
			,@UserId int = 118
			,@RoleId int = 2
			,@PositionType int = 2
			,@OrganizationEmail nvarchar(100) = 'someoneElse@test.com'

	SELECT *
	FROM dbo.OrganizationMembers
	WHERE Id = @Id

	EXECUTE dbo.OrganizationMembers_Update
			@OrganizationId
			,@UserId
			,@RoleId
			,@PositionType
			,@OrganizationEmail
			,@Id

	SELECT *
	FROM dbo.OrganizationMembers
	WHERE Id = @Id
*/

BEGIN

	Declare @DateNow datetime2(7) = getutcdate()

	UPDATE dbo.OrganizationMembers
		SET [OrganizationId] = @OrganizationId
			,[UserId] = @UserId
			,[RoleId] = @RoleId
			,[PositionType] = @PositionType
			,[OrganizationEmail] = @OrganizationEmail
			,[DateModified] = @DateNow

	WHERE Id = @Id

END
GO
