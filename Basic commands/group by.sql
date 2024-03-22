use EMPLOYEE
select * from EMPLOYEES
select firstName,lastName from EMPLOYEES
where id between 1 and 16
group by firstName,lastName
order by firstname desc ;
select distinct  lastName,firstName from EMPLOYEES
where id between 1 and 16
order by firstname asc;
select firstname, gender, count(*) as c from EMPLOYEES
where id between 1 and 16
group by gender
order by firstname asc;
insert into EMPLOYEES values ('jayanth','s',null,null,null,null,null,null);