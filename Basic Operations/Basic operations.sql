-- to create a data base
create database run;
use run;
drop database run;
--point to data base
use EMPLOYEE;
--to display data  or to retrive 
select * from EMPLOYEES;
--to insert the data
insert into EMPLOYEES values('sam','s','sam@gmail.com','ram@123');
('ram','r','ram@gmail.com','sam123'),
('janu','s','janu@gmail.com','janu123'),
('jagu','j','sam@gmail.com','jagu12345'),
('samantha','s','samantha@gmail.com','samantha123'),
('sony','sk','sony@gmail.com','sony@143');
-- ALTER THE TABLE SCHEMA OPERATIONS--
--adding and modifing record in a table
alter table EMPLOYEES add gender varchar(10)NOT NULL;
select * from EMPLOYEES;
-- to set the data for the newly added row  for all rows
update EMPLOYEES set gender ='male';
-- to set the data for the newly added row  for spefic row
update EMPLOYEES set gender ='male';
where firstName ='ram';
-- for modify the record in a table strecture
alter table EMPLOYEES alter column gender varchar(20);
-- for delete a spefic column in a table 
alter table EMPLOYEES drop column gender;
-- to delete a specific rows in a table 
 delete from  EMPLOYEES where firstName='SAM';
 --