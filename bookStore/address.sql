use BookStoreDb;
create table Address
(AddressId int identity(1,1) primary key,
FullAddress nvarchar(200) not null,
City nvarchar(200) not null,
State nvarchar(200) not null,
Type nvarchar(100),
Pincode int,
UserId int Foreign key references Users(Id)
);

select *
from Address

CREATE procedure AddAddress_sp
@UserId int,
@FullAddress nvarchar(200),
@City nvarchar(200),
@State nvarchar(200),
@Type nvarchar(100),
@Pincode int
as
begin
IF EXISTS (SELECT 1 FROM Users WHERE Id = @UserId)
begin
insert into Address(FullAddress, City, State, Type,Pincode,UserId) 
values (@FullAddress, @City, @State,@Type,@Pincode, @UserId)
end
ELSE
    BEGIN
        THROW 50001, 'Invalid UserId or BookId.', 1;
    END
	END
create procedure GetAddressByUserId_sp
@UserId int
as
begin 
select *
from Address 
where UserId=@UserId
end

create proc UpdateAddressByUserId_sp
@UserId int,
@AddressId int,
@FullAddress nvarchar(200),
@City nvarchar(200),
@State nvarchar(200),
@Type nvarchar(100),
@Pincode int
as
begin
update Address 
set FullAddress=@FullAddress, City=@City, State=@State, Type=@Type,Pincode=@Pincode
where UserId=@UserId and AddressId=@AddressId
end



