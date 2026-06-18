CREATE OR ALTER PROCEDURE sp_CloseTicket
    @TicketID   INT,
    @ResolvedBy NVARCHAR(150)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;
        DECLARE @CurrentStatus NVARCHAR(50);
        SELECT @CurrentStatus = s.StatusName
        FROM Ticket t JOIN Status s ON t.StatusID = s.StatusID
        WHERE t.TicketID = @TicketID;

        IF @CurrentStatus IS NULL    THROW 50030, 'Ticket not found.', 1;
        IF @CurrentStatus = 'Closed' THROW 50031, 'Ticket is already closed.', 1;

        UPDATE Ticket
        SET StatusID     = (SELECT StatusID FROM Status WHERE StatusName = 'Closed'),
            ResolvedDate = GETDATE(),
            ClosedDate   = GETDATE(),
            ResolvedBy   = @ResolvedBy,
            UpdatedDate  = GETDATE()
        WHERE TicketID = @TicketID;

        SELECT DATEDIFF(HOUR, CreatedDate, GETDATE()) AS ResolutionTimeHours
        FROM Ticket WHERE TicketID = @TicketID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
