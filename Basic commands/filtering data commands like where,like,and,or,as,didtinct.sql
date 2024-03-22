use EMPLOYEE;
select distinct firstname from EMPLOYEES;
select * from EMPLOYEES;
select distinct email, firstname 
from EMPLOYEES;
select distinct firstname from EMPLOYEES 
order by firstname desc;
select distinct city,state from EMPLOYEES
order by state desc,city ;
select city ,state from EMPLOYEES 
group by city,state
order by state desc,city;

 select * from co_workers;
select firstname,lastname from co_workers
where department = 'hr' 
order by lastname;
select firstname,lastname from co_workers
where (department ='hr' and state ='ny');
select employeeid,firstname,lastname from co_workers 
where (salary>55000 and city ='houston');
select employeeid,firstname,lastname from co_workers
where (salary>55000 or city ='houston');
select employeeid,firstname,lastname ,salary from co_workers
where salary between 55000 and 70000 
order by salary desc
offset 5 rows
fetch next 17 rows only;
select employeeid,firstname,lastname,salary  from co_workers
where salary in (55000,62000,67000);
select employeeid,firstname,lastname,salary  from co_workers
where lastname like 'b%';
select firstname+' ' +lastname from co_workers;
select firstname+' ' +lastname  as 'full name'from co_workers;