CREATE DATABASE EMPLOYEE;
use  EMPLOYEE;
select * from addresBook;
truncate table  addresBook;
CREATE TABLE EMPLOYEES(firstName varchar(20),lastName varchar(20),email varchar(40),password varchar(20));
insert into EMPLOYEES values('jayanth','vanteru','vanterujayanth2001gmail.com','Chinna12345');

select * from EMPLOYEES; 
ALTER table employees
drop column address;
--ADD address varchar;
truncate table employees;
create database addresbook;
use addresbook
--create a table
CREATE TABLE addresBook(
firstName varchar(20),
lastName varchar(20),
address varchar(40),
city varchar(29),
state varchar(20),
zip varchar(6),
phoneNumber varchar(20),
email varchar(40)
);
-- insert a values 
insert into addresBook values
('jayanth','vanteru','2-6,sivalayam street','kavali','andhre pradesh','521402','9390908957','vanterujayanth2001@gmail.com'),
('prakesh','k','2-6,sivalayam street','decan street','america','522402','5390908957','jayanth2001@gmail.com'),
('sony','sk','2-6,sivalayam street','neanbu','panjab','567402','8390908957','vanteru01@gmail.com'),
('somu','n','2-6,sivalayam street','korem','assam','678402','6390988957','vanterujayanth01@gmail.com'),
('janu','j','2-6,sivalayam street','nellore','andhre pradesh','651402','6390978957','jayanth01@gmail.com'),
('jabagar','vanteru','2-6,sivalayam street','taj street','delhi','603305','7390958957','vanterujayanth201@gmail.com'),
('anil','d','2-6,sivalayam street','kadapa','andhre pradesh','601402','8390948957','vanterujayanth21@gmail.com'),
('ramu','v','2-6,sivalayam street','chengalpatu',' tamil nadu','621402','9390938957','vanteru2001@gmail.com');
select * from addresbook;
-- for edit existing details
update  addresBook
set city = 'nellore'
where firstName ='jayanth';
select * from addresbook;
--to delete a detail of a persion
delete from addresBook where firstName ='somu';
-- to retive a persion name by using city 
select firstname from addresBook 
where city ='nellore';
-- count of  CITYS AND STATES
select COUNT('sizeof city''sizeof state') from addresBook  
where (city ='nellore'AND STATE='andhra pradesh');
-- retive all data in an alphabeticall order 
select * from addresBook
order by firstName;

-- new data base 
create database payroll;
use payroll;
create table employees_pay
(emp_id INT PRIMARY KEY IDENTITY(1,1)NOT NULL,
emp_name VARCHAR(20)NOT NULL,
emp_age INT NOT NULL
);
select * from employees_pay;
update employees_pay
SET emp_age =emp_age+10
where emp_age = 23;
--Modify an existing table by adding, modifying, or dropping columns or constraints.
use payroll
select* from employees_pay;
ALTER table employees_pay 
ADD addres varchar(40);
ALTER table employees_pay
drop column address;
--Deletes an existing table and all its data.
ALTER table employees_pay
drop employees_pay;
--Inserts new rows into a table.
insert into employees_pay values('ramu',34,'2-3sivs');
insert into employees_pay values('jayanth',34,'2-3sivs');
insert into employees_pay values('ram',34,'2-3sivs');
insert into employees_pay values('somu',34,'2-3sivs');

select* from employees_pay;
--Modifies existing rows in a table.
UPDATE employees_pay
SET emp_name='rajesh'
where emp_name ='jayanth';
--Removes rows from a table.
delete from employees_pay where emp_name ='somu';
--Deletes all rows from a table while keeping the table structure intact.
truncate table employees_pay;