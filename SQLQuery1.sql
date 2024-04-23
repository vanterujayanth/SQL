use bikeStore
-- SQL Server BEGIN END
--single execution
begin 
select * from production.products
where list_price>10000;
end
-- multiple execution
begin
declare @name varchar(max)
select 
@name = product_name
from production.products
if @@ROWCOUNT<>0
begin 
print 'the most expencive priduct is ' + @name 
end
else 
begin
print 'it is not founded';
end
end
--example first gets the sales amount from the
--sales.order_items table in the sample database and 
--then prints out a message 
--if the sales amount is greater than 1 million.

begin
declare @sales int ;
select 
@sales = sum(list_price*quantity)from sales.order_items as i
inner join sales.orders  as o
on i.order_id =  o.order_id
where year(order_date)=2018;
-- for print 
select @sales as totalSales;
if(@sales>1000000)
begin
print 'great! the sales amount of 2018 is '
+ char(10);
end 
else
begin 
print 'we need to sale more ';
end
end
-- while loop
begin 
declare @x int  =1;
while @x<=5
begin
print @x
set @x =@x +1;
end
end
-- 
begin 
declare @y int =1;
while @y<=5
begin
set @y=@y+1;
(
select top 1* from production.products
)
end
end
-- try and catch
begin try

end try
begin catch
end catch
