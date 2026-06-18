CREATE OR ALTER PROCEDURE sp_CreateTicket
    @Title       NVARCHAR(200),
    @Description NVARCHAR(MAX) = NULL,
    @CategoryID  INT,
    @PriorityID  INT,
    @CreatedByID INT,
    @NewTicketID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;
        IF @Title IS NULL OR LTRIM(RTRIM(@Title)) = ''
            THROW 50001, 'Ticket title cannot be empty.', 1;
        IF NOT EXISTS (SELECT 1 FROM Users    WHERE UserID     = @CreatedByID AND IsActive = 1)
            THROW 50002, 'Invalid or inactive user.', 1;
        IF NOT EXISTS (SELECT 1 FROM Category WHERE CategoryID = @CategoryID)
            THROW 50003, 'Invalid CategoryID.', 1;
        IF NOT EXISTS (SELECT 1 FROM Priority WHERE PriorityID = @PriorityID)
            THROW 50004, 'Invalid PriorityID.', 1;

        INSERT INTO Ticket (Title, Description, CategoryID, PriorityID, StatusID, CreatedByID, CreatedDate)
        VALUES (@Title, @Description, @CategoryID, @PriorityID, 1, @CreatedByID, GETDATE());

        SET @NewTicketID = SCOPE_IDENTITY();
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
