use BookStoreDb;
create table Books(
Id int identity primary key,
Title varchar(max),
Author varchar(max),
Ratting decimal (3,1),
NumberOfRattings int ,
Originalprice bigint,
Discountprice bigint,
Description varchar(max),
Quantity int,
Image varchar(max))

drop table Books


-- add  book
alter PROCEDURE spaddnotes
(
@Title varchar(max),
@Author varchar(max),
@Ratting decimal(3,1),
@NumberOfRattings int ,
@Originalprice bigint,
@Discountprice bigint,
@Description varchar(max),
@Quantity int,
@Image varchar(max)
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
	-- Check if the Title already exists in the table
	 IF EXISTS (SELECT 1 FROM Books WHERE Title = @Title)
        BEGIN
            RAISERROR('A book with this title already exists.', 16, 1);
            RETURN;
        END
        -- Insert new user
		
        INSERT INTO Books (Title,Author,Ratting,NumberOfRattings,Originalprice,Discountprice,Description,Quantity,Image)
        VALUES (@Title,@Author,@Ratting,@NumberOfRattings,@Originalprice,@Discountprice,@Description,@Quantity,@Image);
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

EXEC spaddnotes 

    @Title = '1985', 
    @Author = 'George Orwell', 
    @Ratting =14.0, 
    @NumberOfRattings = 5000, 
    @OriginalPrice = 1500, 
    @DiscountPrice = 1200, 
    @Description = 'A dystopian novel set in a totalitarian society.', 
    @Quantity = 100, 
    @Image = '1984.jpg';



	-- get all books
	CREATE PROCEDURE spGetAllBooks
(
    @Author NVARCHAR(100) = NULL,
    @MinRatting DECIMAL(3,1) = NULL,
    @MaxRatting DECIMAL(3,1) = NULL,
    @MinPrice BIGINT = NULL,
    @MaxPrice BIGINT = NULL,
    @InStock BIT = NULL,
    @SortColumn NVARCHAR(50) = 'Title',
    @SortDirection NVARCHAR(4) = 'ASC',
    @PageNumber INT = 1,
    @PageSize INT = 10
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Offset INT;
    SET @Offset = (@PageNumber - 1) * @PageSize;

    ;WITH BooksCTE AS
    (
        SELECT 
            Id,
            Title,
            Author,
            Ratting,
            NumberOfRattings,
            OriginalPrice,
            DiscountPrice,
            Description,
            Quantity,
            Image,
            ROW_NUMBER() OVER (
                ORDER BY 
                    CASE WHEN @SortColumn = 'Title' AND @SortDirection = 'ASC' THEN Title END ASC,
                    CASE WHEN @SortColumn = 'Title' AND @SortDirection = 'DESC' THEN Title END DESC,
                    CASE WHEN @SortColumn = 'Author' AND @SortDirection = 'ASC' THEN Author END ASC,
                    CASE WHEN @SortColumn = 'Author' AND @SortDirection = 'DESC' THEN Author END DESC,
                    CASE WHEN @SortColumn = 'Ratting' AND @SortDirection = 'ASC' THEN Ratting END ASC,
                    CASE WHEN @SortColumn = 'Ratting' AND @SortDirection = 'DESC' THEN Ratting END DESC,
                    CASE WHEN @SortColumn = 'OriginalPrice' AND @SortDirection = 'ASC' THEN OriginalPrice END ASC,
                    CASE WHEN @SortColumn = 'OriginalPrice' AND @SortDirection = 'DESC' THEN OriginalPrice END DESC,
                    CASE WHEN @SortColumn = 'DiscountPrice' AND @SortDirection = 'ASC' THEN DiscountPrice END ASC,
                    CASE WHEN @SortColumn = 'DiscountPrice' AND @SortDirection = 'DESC' THEN DiscountPrice END DESC
            ) AS RowNum
        FROM 
            Books
        WHERE
            (@Author IS NULL OR Author LIKE '%' + @Author + '%') AND
            (@MinRatting IS NULL OR Ratting >= @MinRatting) AND
            (@MaxRatting IS NULL OR Ratting <= @MaxRatting) AND
            (@MinPrice IS NULL OR OriginalPrice >= @MinPrice) AND
            (@MaxPrice IS NULL OR OriginalPrice <= @MaxPrice) AND
            (@InStock IS NULL OR (Quantity > 0 AND @InStock = 1) OR (Quantity = 0 AND @InStock = 0))
    )
    SELECT 
        Id,
        Title,
        Author,
        Ratting,
        NumberOfRattings,
        OriginalPrice,
        DiscountPrice,
        Description,
        Quantity,
        Image
    FROM 
        BooksCTE
    WHERE
        RowNum > @Offset AND RowNum <= @Offset + @PageSize
    ORDER BY
        RowNum;
END;
	

	EXEC spGetAllBooks


	--get book details by id

	alter PROCEDURE spGetBookById
    @Id INT 
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        
        -- Retrieve the book details
        SELECT *from books
        WHERE Id = @Id;

        
    END TRY
    BEGIN CATCH
        -- Handle errors
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
END;

-- Execute the Stored Procedure

EXEC spGetBookById 
    @Id = 1
  --Delete book
  
alter procedure DeleteDetails
@Id int 
as
begin
begin try
delete  books
where Id=@Id
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
    END CATCH;

end