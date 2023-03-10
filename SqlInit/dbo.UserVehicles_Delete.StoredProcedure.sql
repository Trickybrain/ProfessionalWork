USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[UserVehicles_Delete]    Script Date: 1/10/2023 1:11:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Jacob Helton
-- Create date: 1/9/2023
-- Description: Archives UserVehicle by id
-- Code Reviewer: Liliana Meriweather

-- MODIFIED BY: 
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================

CREATE proc [dbo].[UserVehicles_Delete] @Id int

as

/* ----- TEST CODE -----

	Execute dbo.UserVehicles_SelectById 3

	Execute dbo.UserVehicles_Delete 3

	Execute dbo.UserVehicles_SelectById 3

*/

BEGIN

	UPDATE dbo.UserVehicles
	SET isArchived = 1
	WHERE Id = @Id

END
GO
