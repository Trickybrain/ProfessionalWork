USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[UserDashboard_Select_ByUserId]    Script Date: 2/6/2023 4:45:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:	Jacob Kroft
-- Create date: 1/31/2023
-- Description:	Selecting all data needed for the User Dashboard
-- Code Reviewer: Colin Gibney


-- MODIFIED BY: author
-- MODIFIED DATE:
-- Code Reviewer: 
-- Note: 
-- =============================================



CREATE proc [dbo].[UserDashboard_Select_ByUserId]

	@UserId int
	,@PageIndex int
	,@PageSize int

as



/*---------------TEST CODE------------------

DECLARE	@UserId int = 87
		,@PageIndex int = 0
		,@PageSize int = 10


EXECUTE	dbo.UserDashBoard_Select_ByUserId	@UserId
											,@PageIndex
											,@PageSize



*/

BEGIN

	EXECUTE [dbo].[Appointments_Select_ByCustomerId] 
											@PageIndex
											,@PageSize
											,@UserId
	
	EXECUTE [Blogs_SelectAll] 
						@PageIndex
						,@PageSize
	 
	EXECUTE [dbo].[followers_Select_ByUser]
										@UserId
	
	EXECUTE	[dbo].[UserVehicles_SelectByOwnerId_NoPagV2]
													@UserId

END
GO
