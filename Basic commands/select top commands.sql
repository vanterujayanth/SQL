use EMPLOYEE
select top 50 percent  firstname from EMPLOYEES
order by id;
select * from EMPLOYEES;
select top 2 id from EMPLOYEES
order by firstName;
select top 2 with ties email from EMPLOYEES
where firstname ='jayanth'
order by id;
select top 5  email from EMPLOYEES
where firstname ='jayanth'
order by firstname;

