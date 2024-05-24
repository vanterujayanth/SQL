use BookStoreDb;
create table Cart(
cartid int identity primary key,
Quantity int,
BookId int foreign key references Books(Id),
UserId int foreign key references Users(Id))

--add cart
ALTER PROCEDURE AddCart_sp
    @Quantity int,
    @UserId int,
    @BookId int
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Users WHERE Id = @UserId) AND EXISTS (SELECT 1 FROM Books WHERE Id = @BookId)
    BEGIN
        INSERT INTO Cart (Quantity, UserId, BookId)
        VALUES (@Quantity, @UserId, @BookId);
    END
    ELSE
    BEGIN
        THROW 50001, 'Invalid UserId or BookId.', 1;
    END
END


-- update cart 
CREATE PROCEDURE UpdateCart_sp
    @UserId int,
    @Quantity int,
    @BookId int
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Cart WHERE UserId = @UserId AND BookId = @BookId)
    BEGIN
        UPDATE Cart
        SET Quantity = @Quantity
        WHERE UserId = @UserId AND BookId = @BookId;
    END
    ELSE
    BEGIN
        THROW 50002, 'Item not found in the cart.', 1;
    END
END


--delete cart
CREATE PROCEDURE DeleteCart_sp
    @UserId int,
    @BookId int
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Cart WHERE UserId = @UserId AND BookId = @BookId)
    BEGIN
        DELETE FROM Cart
        WHERE UserId = @UserId AND BookId = @BookId;
    END
    ELSE
    BEGIN
        THROW 50003, 'Item not found in the cart.', 1;
    END
END

--get all carts
create PROCEDURE GetAllCart
    @userId BIGINT
AS
BEGIN
    SELECT b.Id,
           b.Title,
           b.Author,
           b.Description,
           c.Quantity,
           b.price,
           b.image
    FROM Cart c
    INNER JOIN Books b ON c.BookId = b.Id
    WHERE c.UserId = @userId;
END;


EXEC GetAllCart
@userId=1