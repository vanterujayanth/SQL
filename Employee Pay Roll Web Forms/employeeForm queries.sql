use EmployeDb
create table Employee(
EmployeeId int primary key ,
Name nvarchar(20),
Profile_Image nvarchar(255),
Gender nvarchar(6),
Department nvarchar(30),
Salary int,
Joining_Date dateTime
);
ALTER TABLE EMployee
ALTER COLUMN Joining_Date datetime;
drop table EMployee
ALTER TABLE EMployee
ALTER COLUMN EmployeeId int PRIMARY KEY ;

select * from EMployee
--Insert or create 
create Procedure InsertData
(
@EmployeeId int,
@Name nvarchar(max),
@ProfileImage nvarchar(max),
@Gender nvarchar(max),
@Deartment nvarchar(max),
@Salary int,
@JoiningDate Datetime
)
as 
begin
set nocount on;
BEGIN TRY
        INSERT INTO Employee (EmployeeId,Name,Profile_Image,Gender,Department,Salary,Joining_Date)
		values(@EmployeeId,@Name,@ProfileImage,@Gender,@Deartment,@Salary,@JoiningDate);
		end try
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
    END CATCH;
end;
-- get employee list 
 alter procedure EmployeeList
 as 
 begin
 begin try
 select * from EMployee ;
 end try
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
    END CATCH;
	end;
	-- for update the details
create procedure updateDetails
@EmployeeId int,
@Name nvarchar(max),
@ProfileImage nvarchar(max),
@Gender nvarchar(max),
@Deartment nvarchar(max),
@Salary int,
@JoiningDate Datetime
as
begin
begin try
update EMployee set Name=@Name, Profile_Image=@ProfileImage,Gender=@Gender,Department=@Deartment,Salary=@Salary,Joining_Date=@JoiningDate
where EmployeeId=@EmployeeId;
end try
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
    END CATCH;

end

--for Delete details 

alter procedure DeleteDetails
@EmployeeId int 
as
begin
begin try
delete  EMployee
where EmployeeId=@EmployeeId
end try
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
    END CATCH;

end

-- for search details

alter procedure SearchDetails
@EmployeeId int
as
begin
begin try
select * from  EMployee
where EmployeeId=@EmployeeId
end try
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
    END CATCH;

end

-- login
create procedure spLoginModel
@id int,
@name varchar(max)
as
begin
begin try
select*from EMployee 
where (EmployeeId=@id and Name=@name);
end try
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
    END CATCH;
	end
	-- get details by employee id 
	alter procedure GetDetails
	(@id int ,
	@name nvarchar
	)
	as
	begin
	begin try
	select*from EMployee 
where (EmployeeId=@id and Name=@name);
end try
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
    END CATCH;
	end
	exec GetDetails 1,'jayanth'
exec spLoginModel 1,'jayanth'
	EXEC InsertData 
   @EmployeeId = 1,
   @Name = 'John Doe',
   @ProfileImage = 'profile_pic.jpg',
   @Gender = 'Male',
   @Department = 'IT',
   @Salary = 50000,
   @JoiningDate = '2024-04-26';
	exec InsertData 1,'jayanth','png','male','hr',233,'6-4-2024';
	exec EmployeeList

	select * from Employee;
	select * from EMployee;
	Drop table EMployee