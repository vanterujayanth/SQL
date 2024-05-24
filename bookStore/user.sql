create database BookStoreDb;
use BookStoreDb;

create table Users
(Id int identity primary key,
FullName varchar(30),
EmailId varchar(50),
Password varchar(30),
Mobile  NVARCHAR(15))

drop table Users
select * from Users

ALTER PROCEDURE spRegisterUser
(
    @FullName NVARCHAR(100),
    @EmailId NVARCHAR(100),
    @Password NVARCHAR(100),
    @Mobile NVARCHAR(15)
	)
   
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Insert new user
        INSERT INTO Users (FullName, EmailId, Password, Mobile)
        VALUES (@FullName, @EmailId, @Password, @Mobile);
    END TRY
    BEGIN CATCH

       -- Error handling code
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        RETURN;
    END CATCH
END

-- loging 
ALTER PROCEDURE spLoginUser
(
    @EmailId NVARCHAR(100),
    @Password NVARCHAR(100)
	)
   
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
	SELECT * FROM Users
where (EmailId =@EmailId and Password=@Password);
 END TRY

begin catch
-- Error handling code
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        RETURN;   
    
    END CATCH
END



--- forgot password
ALTER PROCEDURE spForgotPassword
    @EmailId NVARCHAR(100)
   
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        
         SELECT * FROM Users WHERE EmailId = @EmailId
       
    END TRY
    BEGIN CATCH
	-- Error handling code
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        RETURN;   
       
    END CATCH
END
  -- reset password
  CREATE PROCEDURE spResetPassword
(
    @EmailId VARCHAR(50),
    @NewPassword VARCHAR(30),
    @StatusMessage VARCHAR(255) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;

    -- Variable to store the hashed password
    DECLARE @HashedPassword VARBINARY(64);
    -- Variable to check if the email exists
    DECLARE @UserId INT;

    -- Check if the email exists
    SELECT @UserId = Id
    FROM Users
    WHERE EmailId = @EmailId;

    IF @UserId IS NULL
    BEGIN
        -- Email does not exist
        SET @StatusMessage = 'Email address not found.';
        RETURN;
    END

    -- Hash the password (assuming a function fn_HashPassword exists)
    SET @HashedPassword = dbo.fn_HashPassword(@NewPassword);

    -- Update the user's password
    UPDATE Users
    SET Password = @HashedPassword
    WHERE EmailId = @EmailId;

    -- Log the password reset attempt (assuming a table PasswordResetLogs exists)
    INSERT INTO PasswordResetLogs (UserId, EmailId, ResetDate)
    VALUES (@UserId, @EmailId, GETDATE());

    -- Set the status message to success
    SET @StatusMessage = 'Password reset successfully.';

END;
GO







--CREATE PROCEDURE spRegisterUser
--    @FullName NVARCHAR(100),
--    @EmailId NVARCHAR(100),
--    @Password NVARCHAR(100),
--    @Mobile NVARCHAR(15)
--AS
--BEGIN
--    INSERT INTO Users (FullName, EmailId, Password, Mobile)
--    VALUES (@FullName, @EmailId, @Password, @Mobile);
--END