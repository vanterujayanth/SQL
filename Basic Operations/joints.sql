use EMPLOYEE
create schema hr
go
CREATE TABLE hr.candidates(
    id INT PRIMARY KEY IDENTITY,
    fullname VARCHAR(100) NOT NULL
);

CREATE TABLE hr.employees(
    id INT PRIMARY KEY IDENTITY,
    fullname VARCHAR(100) NOT NULL
);
INSERT INTO 
    hr.candidates(fullname)
VALUES
    ('John Doe'),
    ('Lily Bush'),
    ('Peter Drucker'),
    ('Jane Doe');


INSERT INTO 
    hr.employees(fullname)
VALUES

    ('John Doe'),
    ('Jane Doe'),
    ('Michael Scott'),
    ('Jack Sparrow');
-- inner joint
	SELECT  
    c.id candiate_id,
    c.fullname cantiate_fullName,
    e.id employee_id,
    e.fullname employee_name
FROM 
    hr.candidates c
    INNER JOIN hr.employees e 
        ON e.fullname = c.fullname;
		select * from hr.candidates;
		select * from hr.employees;
-- right joint
select 
h.id as candiate_id,
h.fullname as candiate_fullname,
e.id as employee_id,
e.fullname as employee_fullname
from hr.candidates h
right join 
hr.employees e
on h.fullname =e.fullname
where h.id is null;
-- left joint
select 
h.id as candiate_id,
h.fullname as candiate_fullname,
e.id as employee_id,
e.fullname as employee_fullname
from hr.candidates h
left join 
hr.employees e
on h.fullname =e.fullname
where e.id is null;
--
select * from hr.candidates
select * from hr.employees
--full joint
select 
c.id as candiate_id,
c.fullname as candiatefullname,
e.id as employee_id,
e.fullname as employeefullname
from hr.candidates as c
full join hr.employees e
on c.fullname =e.fullname
where 
e.id is null
or 
c.id is null
