use EMPLOYEE
alter table employees
add  city varchar(10),state varchar(20),id int identity(1,1);
select *  from employees;
insert into EMPLOYEES values('jayanth','m','jayanth@gmail.com','chinna123','male','sn street','kavali','ap'),
('jahanavi','k','jahanavi@gmail.com','jahanavi123','female','sj street','nellore','ap'),
('jayanth','m','jayanth@gmail.com','chinna123','male','sn street','kapam','up'),
('bala','b','jayanth bALA@gmail.com','cbnna123','male','paris street','trivandam','kerela'),
('jayanth','m','jayanth@gmail.com','chinna123','male','london  street','trupathi','ap'),
('baba','m','baba@gmail.com','cna123','male','txesas street','kavali','panjab'),
('teja','h','tejath@gmail.com','ctna123','male','sn street line','pampe','haryana');
select id from EMPLOYEES order by id;
select lastName from EMPLOYEES;
select email from EMPLOYEES;
select password from EMPLOYEES;
select firstName,gender from EMPLOYEES;
select street from EMPLOYEES;
select city from EMPLOYEES;
select state from EMPLOYEES;
select * from EMPLOYEES;
select email,password from EMPLOYEES;

