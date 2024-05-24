create table UserOrder
(
  Quantity int,

  UserId int foreign key references Users(Id),

  BookId int foreign key references Books(Id)

);



create procedure AddOrder_sp
@Quantity int,
@UserId int,
@BookId int
as
begin 
insert into UserOrder(Quantity,UserId,BookId) values (@Quantity,@UserId,@BookId)
end

--insert into UserOrder values
--(2,1,1);

select * from Books;
select * from UserOrder;
select * from Users;

create procedure GetOrderByUserId_sp
@UserId int
as
begin
select b.Id, b.Title, b.discountprice, b.Author,b.Description, uo.Quantity, b.Image
from Books b
inner join UserOrder uo
on b.Id =uo.BookId where uo.UserId=@UserId
end

drop procedure GetOrderByUserId_sp
exec GetOrderByUserId_sp
@UserId=1
