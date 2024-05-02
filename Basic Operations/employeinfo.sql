create database que;
use que;
create table employeinfo(name varchar(20),id int,location varchar(20),age int,gender varchar(10));
insert into employeinfo values('sam',23,'nellore',29,'famale');
insert into employeinfo values('tom',21,'us',23,'male');
insert into employeinfo values('lam',22,'uk',21,'male');
insert into employeinfo values('ram',24,'nellore',0,'male');
insert into employeinfo values('sam',25,'us',30,'famale');
#get the employe name from the nelore
select * from employeinfo
where location='nellore';
#get the employe name from the nelore where their age is graterthan 20
select name from employeinfo
where location='nellore'and age>=20;
#get the employe name from the nelore where their age is lessthan 30 or location is uk
select * from employeinfo
where (location='nellore' and age<30)or location='uk';
update employeinfo set age=30
where age=0;
select name from employeinfo
where age in (20,21,22,23,24,25,26);
# print employesname lessthan the 25
#conditions can write for this are 
#1 where age <25
#2 where age in (1,2,3,4,5,6,7,8,9,.....,25)
#3 where age between 1 and 25 
select *from employeinfo where age between 1 and 25; 
