USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Users_Insert]    Script Date: 12/16/2022 12:52:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Darryl Yeargin
-- Create date: 12/15/2022
-- Description:	insert statement for new users
-- Code Reviewer: Jacob Helton


-- MODIFIED BY: author
-- MODIFIED DATE:12/1/2020
-- Code Reviewer: 
-- Note: 
-- =============================================
CREATE	proc [dbo].[Users_Insert]
			@Email nvarchar(255)
			,@FirstName nvarchar(100)
			,@LastName nvarchar(100)
			,@Mi nvarchar(2)
			,@AvatarUrl varchar(255)
			,@Password varchar(100)
			,@StatusTypeId int
			,@Id int OUTPUT

as

/*---------------TEST CODE------------------

	DECLARE	@Id int = 0;
	DECLARE	@Email nvarchar(255) = 'testEmail3@test.com'
			,@FirstName nvarchar(100) = 'Test User First'
			,@LastName nvarchar(100) = 'Test User Last'
			,@Mi nvarchar(2) = 'T'
			,@AvatarUrl varchar(255) = 'test_image.jpeg'
			,@Password varchar(100) = 'testpass1234!'
			,@StatusTypeId int = '1'
	
	EXECUTE	dbo.Users_Insert
				@Email
				,@FirstName
				,@LastName
				,@Mi
				,@AvatarUrl
				,@Password
				,@StatusTypeId
				,@Id OUTPUT

	EXECUTE	dbo.Users_SelectById
				@Id

*/

BEGIN

	INSERT INTO	[dbo].[Users]
				([Email]
				,[FirstName]
				,[LastName]
				,[Mi]
				,[AvatarUrl]
				,[Password]
				,[StatusTypeId])
	VALUES
			   (@Email
			   ,@FirstName
			   ,@LastName
			   ,@Mi
			   ,@AvatarUrl
			   ,@Password
			   ,@StatusTypeId)

	SET	@Id = SCOPE_IDENTITY()

END

GO
