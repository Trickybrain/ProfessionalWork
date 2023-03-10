USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[OrganizationMembers_Delete_ById]    Script Date: 2/3/2023 9:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Lauren Greenwald
-- Create date: 01/30/2023
-- Description:	OrganizationMembers Delete By Id
-- Code Reviewer: 


-- MODIFIED BY: author
-- MODIFIED DATE:
-- Code Reviewer: 
-- Note: 
-- =============================================

CREATE proc [dbo].[OrganizationMembers_Delete_ById]
			@Id int

as

/*
Declare @Id int = 4

Execute dbo.OrganizationMembers_Select_ById @Id

Execute dbo.OrganizationMembers_Delete_ById @Id

Execute dbo.OrganizationMembers_Select_ById @Id
*/

BEGIN

	DELETE from dbo.OrganizationMembers
	WHERE Id = @Id

END
GO
