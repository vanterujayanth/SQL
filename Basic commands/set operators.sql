use EMPLOYEE
select firstname from EMPLOYEES
union all
select firstname from persons;
select firstname from EMPLOYEES
union 
select firstname from persons;
select firstname from EMPLOYEES
union all
select firstname from persons
order by firstname;
select firstname from EMPLOYEES
intersect 
select firstname from persons
order by firstname;
select gmail from persons
intersect 
select email from EMPLOYEES
order by gmail;
select firstname from EMPLOYEES
except
select firstname from persons;