use addresbook
-- for select command
CREATE PROCEDURE usp
as
begin
select 
* from addresbook
order by firstname ;
end;
-- for insert command
create procedure adddetails
(@firstName nvarchar(50),
@lastNAme nvarchar(20),
@city nvarchar(20)
)
as
begin
insert into addresBook (firstName,lastName,city)
values(@firstName,@lastName,@city)
end;
execute adddetails'thor','v','asghurd';

--update 
create procedure updatedetails
(@firstName varchar(20),
@lastName nvarchar(20)
)
as begin
update addresBook
set lastName =@lastName
where firstName = @firstName
end;
execute updatedetails 'anil','k';
execute usp;
--delete 
create procedure deletedetail
(@firstName varchar(20))
as begin 
delete from addresBook 
where firstName =@firstName
end;
execute deletedetail'anil';

--varibles 
declare @modelYear smallint;
set @modelYear = 2018;
select product_name,model_year,list_price from production.products
where model_year = @modelYear
order by product_name asc;
--Storing query result in a variable
declare @productCount int;
set @productCount=(select COUNT(*)from production.brands);
--print @productCount;
print 'the count of the total type of brands '+
cast(@productCount as varchar(max));    
set NOCOUNT OFF;
--Selecting a record into variables
DECLARE @NAME varchar(max),
@price decimal;
select
@NAME=product_name,
@price = list_price
from production.products
where product_id=100;
select @NAME,@price;
--The following stored procedure takes one parameter 
--and returns a list of products as a string:
create procedure upslist
(@year smallint)
as
begin
declare @product_list varchar(max) set @product_list ='';
select 
@product_list  = @product_list + product_name +CHAR(10)
from production.products
where model_year=@year
order by product_name;
print @product_list;
end;
execute upslist 2018;
