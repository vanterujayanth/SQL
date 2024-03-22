use EMPLOYEE
select firstName from EMPLOYEES order by firstName;
select id,FIRSTname from EMPLOYEES order by firstName;
select id,email,password from EMPLOYEES order by id asc;
select city from EMPLOYEES order by id desc;
select id,city from EMPLOYEES order by id desc;
select id,city ,firstname from EMPLOYEES order by id,firstName;
select id,city ,firstname from EMPLOYEES order by firstName ,  id desc;
select * from EMPLOYEES
insert into EMPLOYEES values ('sony','sk','sony@gmail.com','sony@143','male',null,null,null);