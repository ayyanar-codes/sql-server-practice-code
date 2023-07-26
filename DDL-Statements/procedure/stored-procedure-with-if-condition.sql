CREATE PROCEDURE usp_InsertOrUpdateRecord
    @Id INT,
    @Name NVARCHAR(50),
    @Age INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the record already exists
    IF EXISTS (SELECT 1 FROM YourTableName WHERE Id = @Id)
    BEGIN
        -- Record exists, perform an UPDATE
        UPDATE YourTableName
        SET Name = @Name,
            Age = @Age
        WHERE Id = @Id;
    END
    ELSE
    BEGIN
        -- Record doesn't exist, perform an INSERT
        INSERT INTO YourTableName (Id, Name, Age)
        VALUES (@Id, @Name, @Age);
    END
END
