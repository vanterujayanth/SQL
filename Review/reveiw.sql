use EMPLOYEE
create table  bi 
(name varchar(20) not null,
age int not null,
salary varchar(10) not null,
depratment varchar(20) not null
);
alter table bi
alter column salary int ; 
insert into bi values ('jayanth',23,'65000','hr'),
('jay',43,'45000','it'),
('janu',33,'65000','non it'),
('somu',13,'67000','hr'),
('teja',63,'61000','hr'),
('ramya',32,'67000','hr'),
('pavan',36,'78000','hr'),
('lokesh',28,'68000','hr'),
('nandu',29,'34000','hr');
--Select the names and ages of all employees 
--who are between the ages of 25 and 35
select name,age from bi
where age between 25 and 53;
--Select the names and salaries of all employees 
--who make more than $60,000 and work in the "IT" department:
select name,salary from bi
where salary >= 60000  and depratment ='it';
--Select the total salary of all employees:
select sum(salary) total from bi;

--Select the names of all employees who do not have a salary value:
select name  from  bi 
where salary = null;
--Select the names and ages of all employees, 
select name ,age from bi
order by age ;
--Select the top 2 departments with the highest total salary:
select top 2  depratment from bi 
group by depratment;




select * from bi;