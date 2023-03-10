USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Certifications_Select_ByOrgId_Paginated]    Script Date: 1/26/2023 7:50:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:	Edwin Ye
-- Create date: 1/25/2023
-- Description:	Select_ByOrgId (Paginated) Certifications joins on Orgainzation Basic
-- Code Reviewer: Colin Gibney


-- MODIFIED BY: 
-- MODIFIED DATE: 
-- Code Reviewer: 
-- Note: 
-- =============================================

CREATE Proc [dbo].[Certifications_Select_ByOrgId_Paginated]
		@OrgId int
		,@PageIndex int
		,@PageSize int

as

/*---------------TEST CODE------------------


	Execute [dbo].[Certifications_Select_ByOrgId_Paginated] 8,0,3

	Select *
	From dbo.Certifications

*/

Begin

		Declare @offset int = @PageIndex * @PageSize

		Select  c.Id
				,c.Name as CertificationsName
				,c.Description as CertDescription
				,c.FileId
				,c.ExpirationDate as CertExpirationDate
				,c.CreatedBy as CertCreatedBy
				,c.ModifiedBy as CertModifiedBy
				,c.DateCreated as CertDateCreated
				,c.DateModified as CertDateModified
				,o.Id as OrganizationId
				,o.OrganizationTypeId
				,o.Name as OrganizationName
				,o.Description as OrgDescription
				,o.LogoUrl as OrgLogoUrl
				,o.BusinessPhone as OrgBusinessPhone
				,o.PrimaryLocationId as OrgPrimaryLocationId
				,o.SiteUrl as OrgSiteUrl
				,o.IsDeleted as OrgIsDeleted
				,o.CreatedBy as OrgCreatedBy
				,o.ModifiedBy as OrgModifiedBy

				,TotalCount = COUNT(1) Over()

		From [dbo].[Certifications] as c
		inner join [dbo].[Organizations] as o
				on c.OrganizationId = o.Id
		Where @OrgId = o.Id
		Order By o.Id
		Offset @offset Rows
		Fetch Next @PageSize Rows Only

End
GO
