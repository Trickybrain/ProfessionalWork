USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[BlogTypes_SelectAll]    Script Date: 12/23/2022 10:16:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Kyle Zarate
-- Create date: 12/19/2022
-- Description:	Select All BlogTypes (No Pagination)
-- Code Reviewer: Jacob Helton 


-- MODIFIED BY: author
-- MODIFIED DATE:
-- Code Reviewer: 
-- Note: 
-- =============================================

CREATE proc [dbo].[BlogTypes_SelectAll]

as

/*

	Execute [dbo].[BlogTypes_SelectAll]

*/

BEGIN

		SELECT	[Id]
				,[Name]
		  FROM	[dbo].[BlogTypes] 

END
GO
