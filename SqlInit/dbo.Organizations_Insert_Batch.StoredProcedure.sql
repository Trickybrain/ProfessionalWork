USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Organizations_Insert_Batch]    Script Date: 1/24/2023 7:43:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Jacob Helton
-- Create date: 1/18/2023
-- Description: Batch insert of organizations
-- Code Reviewer: Colin Gibney

-- MODIFIED BY: 
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================

CREATE proc [dbo].[Organizations_Insert_Batch] @OrganizationsBatch dbo.BatchOrganization_UDT READONLY
										 ,@LocationsBatch dbo.BatchLocationV2 READONLY

as

/* ----- TEST CODE -----

	Declare @batchOrgs dbo.BatchOrganization_UDT
		   ,@batchLocs dbo.BatchLocationV2

	Insert into @batchOrgs (OrganizationTypeId
						   ,Name
						   ,Description
						   ,LogoUrl
						   ,BusinessPhone
						   ,SiteUrl
						   ,CreatedBy
						   ,ModifiedBy
						   ,ShopId)
	Values (12
		   ,'BatchTest3'
		   ,'OC govt'
		   ,'https://tinyurl.com/ycx2eyb8'
		   ,'18558865400'
		   ,'https://www.ocgov.com/'
		   ,90
		   ,90
		   ,'54321')

	Insert into @batchLocs (LocationTypeId
						   ,LineOne
						   ,LineTwo
						   ,City
						   ,Zip
						   ,State
						   ,Latitude
						   ,Longitude
						   ,CreatedBy
						   ,ModifiedBy
						   ,ShopId)
	Values (0
		   ,1
		   ,'123 Main St'
		   ,null
		   ,'Irvine'
		   ,'90210'
		   ,'CA'
		   ,31.123
		   ,-123.123
		   ,90
		   ,90
		   ,'54321')

	Execute dbo.Organizations_Insert_Batch @batchOrgs, @batchLocs

	Select *
	From dbo.Organizations

	Select * from dbo.locations
*/

BEGIN

	Insert into dbo.Locations (LocationTypeId
							  ,LineOne
							  ,LineTwo
							  ,City
							  ,Zip
							  ,StateId
							  ,Latitude
							  ,Longitude
							  ,CreatedBy
							  ,ModifiedBy
							  ,ShopId)

	Select lb.LocationTypeId
		  ,lb.LineOne
		  ,lb.LineTwo
		  ,lb.City
		  ,lb.Zip
		  ,s.Id
		  ,lb.Latitude
		  ,lb.Longitude
		  ,lb.CreatedBy
		  ,lb.ModifiedBy
		  ,lb.ShopId

	From @LocationsBatch lb inner join dbo.States s
		on lb.[State] = s.Code inner join dbo.Users u on
			lb.CreatedBy = u.Id
	Where NOT EXISTS (Select 1 From dbo.Locations l Where lb.ShopId = l.ShopId)

	Insert into dbo.Organizations (OrganizationTypeId
								  ,[Name]
								  ,[Description]
								  ,LogoUrl
								  ,BusinessPhone
								  ,PrimaryLocationId
								  ,SiteUrl
								  ,CreatedBy
								  ,ShopId)

	Select ob.OrganizationTypeId
		  ,ob.[Name]
		  ,ob.[Description]
		  ,ob.LogoUrl
		  ,ob.BusinessPhone
		  ,l.Id
		  ,ob.SiteUrl
		  ,ob.CreatedBy
		  ,ob.ShopId
	From @OrganizationsBatch ob inner join dbo.Locations l 
		on ob.ShopId = l.ShopId
	Where NOT EXISTS (Select 1 From dbo.Organizations o Where ob.ShopId = o.ShopId)

END
GO
