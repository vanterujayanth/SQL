use EMPLOYEE
select * from EMPLOYEES;
select id ,firstname from EMPLOYEES 
order by id, city asc
OFFSET 2 ROWS;
select id ,email from EMPLOYEES
order by firstName desc 
offset 3 rows
fetch next 5 rows only;
select   password  from EMPLOYEES
order by password asc
offset 3 rows
fetch next 5 rows only;
select id,lastname from EMPLOYEES
order by id 
offset 0 rows 
fetch next 10 rows only;