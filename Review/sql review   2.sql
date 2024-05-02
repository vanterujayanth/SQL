use addresbook
create table students
(studentId int primary key,
fistName varchar(20),
lastName varchar(20)
);
insert into students values(1,'jayanth','v')
insert into students values(2,'ramya','b')
insert into students values(3,'somesh','v')
insert into students values(5,'lokesh','s')
insert into students values(4,'jaya','k')
create table coureses 
(couresid int primary key,
couresname varchar(20),
studentid int 
foreign key (studentid) references dbo.students(studentid)
);

select * from students
select * from coureses
insert into coureses values(114,'cse',1)
insert into coureses values(115,'ece',2)
insert into coureses values(116,'it',4)
insert into coureses values(118,'mech',3)
insert into coureses values(112,'eee',5)
--1
SELECT DISTINCT s.studentid, s.fistName
FROM students s
JOIN coureses e ON s.studentid = e.studentid;
--1.2
SELECT students.studentid, students.fistName
FROM students
LEFT JOIN coureses ON students.studentid =coureses.studentid
WHERE coureses.studentid IS NULL;
--Problem: Create a stored procedure that updates a 'Products' 
--table with the provided product name and price for the record that matches the provided product ID.
--
create procedure updated
(@firstName varchar(20),
@lastName nvarchar(20)
)
as begin
update addresBook
set lastName =@lastName
where firstName = @firstName
end;
execute updatedetails 'anil','s';
execute usp;
select * from addresbook
   
--3) create a function that takes input of 1 and 2. if user input is 1,
--it return east if user inputs 2, it returns west. if user gives 0 input. no values are returned.


