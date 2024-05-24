use BookStoreDb
create table Admins
(Id int identity primary key,
FullName varchar(30),
EmailId varchar(50),
Password varchar(30),
Mobile  NVARCHAR(15))

INSERT INTO Admins(FullName, EmailId, Password, Mobile)
        VALUES ('Jayanth','vanterujayanth2001@gmail.com','Chinna123$','9390908957');

select * from Admins;

-- login procedure
alter PROCEDURE spLoginAdmin
(
    @EmailId NVARCHAR(100),
    @Password NVARCHAR(100)
	)
   
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
	SELECT * FROM Admins
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

exec spLoginAdmin
@EmailId ='vanterujayanth2001@gmail.com',
    @Password ='Chinna123$'
	select * from Admins