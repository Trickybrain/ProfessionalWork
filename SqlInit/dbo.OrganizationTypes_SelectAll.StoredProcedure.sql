USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[OrganizationTypes_SelectAll]    Script Date: 12/21/2022 4:15:01 PM ******/
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

CREATE proc [dbo].[OrganizationTypes_SelectAll]


as


/*
	Execute [dbo].[OrganizationTypes_SelectAll]

*/


BEGIN

		SELECT [Id]
			  ,[Name]
		  FROM [dbo].[OrganizationTypes]

END



GO
