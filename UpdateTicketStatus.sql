CREATE OR ALTER PROCEDURE sp_UpdateTicketStatus
    @TicketID  INT,
    @StatusID  INT,
    @UpdatedBy INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;
        IF NOT EXISTS (SELECT 1 FROM Ticket WHERE TicketID = @TicketID)
            THROW 50010, 'Ticket not found.', 1;
        IF NOT EXISTS (SELECT 1 FROM Status WHERE StatusID = @StatusID)
            THROW 50011, 'Invalid StatusID.', 1;

        UPDATE Ticket
        SET StatusID = @StatusID, UpdatedDate = GETDATE()
        WHERE TicketID = @TicketID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
