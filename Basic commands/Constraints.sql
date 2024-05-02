use EMPLOYEE
-- createing a table using constraints  that a table 
-- have to follow some rules those are id ,lastname,firstname 
-- should not be "null" at instialy
create table persons(
ID int NOT NULL,
LastName varchar(40)NOT NULL,
firstName varchar(40)not null,
Age int
);
alter table persons
add gmail varchar(30);
select * from persons;
insert into  persons values(1,'ramu','jayanth',23);
--here we are changeing the column "age" in to not "null" by 
--using alter command
ALTER TABLE persons
ALTER COLUMN Age int NOT NULL;

-- ==>UNIQUE
-- createing a table using constraints  that a table 
-- have to follow some rules those are id ,lastname,firstname 
-- should  be "unique" at instialy
create table workers
(id int unique,
lastname varchar(20),

);
insert into workers values(1,'j'),(2,'j'),(3,'h');
select * from workers;
UPDATE  WORKERS
SET lastname ='k'
where id =2;
-- ADD qnique
alter table workers
ADD UNIQUE(LASTNAME);
-- ==>PEIMARY KEY
update persons
set id =3
where LastName ='ramu';
alter table persons
add  primary key (id);
select * from persons;
-- ==> foreing key 
-- table 
create table orders
(orderid int not null primary key,
orderitem varchar(40) not null,
persionId int foreign key references persons(id)
);
select * from orders;
insert into orders values(1234,'jam',1);