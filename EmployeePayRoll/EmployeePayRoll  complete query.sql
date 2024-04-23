use EmployeePayRoll
create database EmployeePayRoll 

create table tblEmployee(
EmployeeId int IDENTITY(1,1) NOT NULL,
 Name VARCHAR(20)NOT NULL,
ProfileImage VARCHAR(20)NOT NULL,
Gender VARCHAR(20) NOT NULL,
Department VARCHAR(20) NOT NULL,
Salary MONEY,
StartDate datetime,
Notes VARCHAR(200)NOT NULL
)
-- STORE PROCEDURE

Create procedure spAddEmployee         
(        
@Name VARCHAR(MAX),                
@ProfileImage VARCHAR(MAX),
@Gender VARCHAR(MAX) ,
@Department VARCHAR(MAX),
@Salary MONEY ,
@StartDate DATETIME,
@Notes VARCHAR(MAX)
)        
as         
Begin         
    Insert into tblEmployee (Name,ProfileImage, Gender,Department,Salary,StartDate,Notes)         
    Values (@Name,@ProfileImage,@Gender,@Department,@Salary,@StartDate,@Notes)         
End 
-- to updte an employee record
ctrate procedure spUpdateEmployee          
(  
@EmployeId int,
@Name VARCHAR(MAX),                
@ProfileImage VARCHAR(MAX),
@Gender VARCHAR(MAX) ,
@Department VARCHAR(MAX),
@Salary MONEY ,
@StartDate DATETIME,
@Notes VARCHAR(MAX)        
)          
as          
begin          
   Update tblEmployee           
   set Name=@Name, 
   ProfileImage =@ProfileImage,
   Gender=@Gender ,
   Department=@Department,        
   Salary=@Salary,
   StartDate =@StartDate,
   Notes=@Notes
   where EmployeeId=@EmployeId        
End     
exec spUpdateEmployee 3,
-- to delete the details of the employee
Create procedure spDeleteEmployee         
(          
   @EmpId int          
)          
as           
begin          
   Delete from tblEmployee where EmployeeId=@EmpId          
End  
-- GET ALL DETAILS
Create procedure spGetAllEmployees      
as      
Begin      
    select *      
    from tblEmployee      
End 
---- procedure for get details by id
create PROCEDURE getEmpById
    @EmpID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM tblEmployee
    WHERE EmployeeId =@EmpID;
END;
DROP PROCEDURE GetEmployeeDetails;
-- login
create procedure espLoginModel
@id int ,
@name VARCHAR(MAX),                
@profileImage VARCHAR(MAX),
@gender VARCHAR(MAX) ,
@department VARCHAR(MAX),
@salary MONEY ,
@startDate DATETIME,
@notes VARCHAR(MAX)  
as
begin
if exists(select * from tblEmployee where EmployeeId=@id)
begin
update tblEmployee
set Name=@name, ProfileImage=@profileimage, Gender=@gender, Department=@department, Salary=@salary, StartDate=@startdate, Notes=@notes
where EmployeeId=@id
end
else

begin
insert into tblEmployee values
(@id, @name, @profileimage, @gender, @department, @salary, @startdate, @notes)
end
end
-- login
create procedure spLoginModel
@id int,
@name varchar(max)
as
begin
select*from tblEmployee 
where (EmployeeId=@id and Name=@name);
end
SELECT * FROM tblEmployee;
--Customer
alter procedure spCustomerModel
@Name varchar(max)
as
begin
select*from tblEmployee 
where  Name=@Name;
end
exec spCustomerModel 'Jayanth'
SELECT * FROM tblEmployee;