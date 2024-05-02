use EmployeDb
SELECT * FROM [PRODUCT -SETUP];
CREATE PROCEDURE InsertProduct
(
    @ProductId INT,
    @ItemName VARCHAR(MAX),
    @Specification VARCHAR(MAX),
    @Unit VARCHAR(MAX),
    @Status VARCHAR(MAX),
    @CreateDate DATE
)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        INSERT INTO [PRODUCT -SETUP]([PRODUCT iD], [ITEM _NAME], Specification, Unit, Status, [CREATION DATE])
        VALUES (@ProductId, @ItemName, @Specification, @Unit, @Status, @CreateDate);
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
    END CATCH;
END;

SELECT * FROM [PRODUCT -SETUP]
EXEC InsertProduct 
    @ProductId = 2,
    @ItemName = 'Example Item',
    @Specification = 'Example Specification',
    @Unit = 'Pieces',
    @Status = 'Active',
    @CreateDate = '2024-04-26';

