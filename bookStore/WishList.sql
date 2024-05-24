create table WishList
(
 
 UserId int foreign key references Users(Id),

  BookId int foreign key references Books(Id)
);


insert into WishList values
(1,1);

select *
from WishList

create proc AddWishList
@UserId int,
@BookId int
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Insert new item
        Insert into UserOrder(UserId,BookId) values (@UserId,@BookId)
    END TRY
    BEGIN CATCH

       -- Error handling code
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        RETURN;
    END CATCH
END



alter proc GetWishListByUserId_sp
@UserId int
as
begin
begin try
select b.Id, b.Title, b.Discountprice, b.Author,b.Description, b.Image
from Books b
inner join WishList uo
on b.Id =uo.BookId where uo.UserId=@UserId
end try
BEGIN CATCH

       -- Error handling code
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        RETURN;
    END CATCH
end


create proc deleteWishList_sp
@UserId int,
@BookId int
as
begin 
begin try
delete from WishList 
where userId=@UserId and BookId=@BookId
end try
begin catch
-- Error handling code
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        RETURN;
end catch
end


