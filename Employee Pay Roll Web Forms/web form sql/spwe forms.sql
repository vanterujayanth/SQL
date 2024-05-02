create database webForms;
use webForms;
-- tabel creation 
create table Employee(
EmployeeId int primary key identity(1,1) ,
Name nvarchar(20),
Profile_Image nvarchar(255),
Gender nvarchar(6),
Department nvarchar(30),
Salary int,
Joining_Date dateTime
);
-- alter
ALTER TABLE Employee
ADD Notes nvarchar(max);

-- teable check
select * from Employee;
--Login procedure
create procedure spLoginModel
@id int,
@name varchar(max)
as
begin
begin try
select*from Employee 
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

--Insert or create 
alter Procedure InsertDetails_sp
(

@Name nvarchar(max),
@ProfileImage nvarchar(max),
@Gender nvarchar(max),
@Department nvarchar(max),
@Salary int,
@JoiningDate Datetime,
@notes nvarchar(max)
)
as 
begin
set nocount on;
BEGIN TRY
        INSERT INTO Employee (Name,Profile_Image,Gender,Department,Salary,Joining_Date,Notes)
		values(@Name,@ProfileImage,@Gender,@Department,@Salary,@JoiningDate,@notes);
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
-- Implementation
--GetAll employees
create procedure EmployeeList_sp

 as 
 begin
 begin try
 select * from Employee ;
 
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
	-- get by name
	create procedure spGetEmployeeByName
	@name nvarchar(max)
 as 
 begin
 begin try
 select * from Employee 
 where Name=@name;
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

	-- Update Details
	alter procedure updateDetails
@EmployeeId int,
@Name nvarchar(max),
@ProfileImage nvarchar(max),
@Gender nvarchar(max),
@Department nvarchar(max),
@Salary int,
@JoiningDate Datetime,
@notes nvarchar(max)
as
begin
begin try
update Employee set Name=@Name, Profile_Image=@ProfileImage,Gender=@Gender,Department=@Department,Salary=@Salary,Joining_Date=@JoiningDate,Notes=@notes
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



-- for search details by id

create procedure search_SP
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


--for delete
create procedure DeleteDetails
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


--- search by date 
create procedure SearchByDate
@Date DateTime,
@date1 Datetime
as
begin
begin try
select * from  Employee
where Joining_Date between @Date and @Date1;
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
execute SearchByDate '2024-04-30 00:00:00.000','2024-04-30 00:00:00.000'
select * from Employee