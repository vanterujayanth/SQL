create table EmployeTable(
EmployeeId int IDENTITY(1,1) NOT NULL,
 Name VARCHAR(20)NOT NULL,
ProfileImage VARCHAR(20)NOT NULL,
Gender VARCHAR(20) NOT NULL,
Department VARCHAR(20) NOT NULL,
Salary MONEY,
StartDate datetime,
Notes VARCHAR(200)NOT NULL
);
