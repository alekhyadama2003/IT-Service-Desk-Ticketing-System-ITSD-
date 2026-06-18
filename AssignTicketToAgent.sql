CREATE OR ALTER PROCEDURE sp_AssignTicketToAgent
    @TicketID INT,
    @AgentID  INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;
        IF NOT EXISTS (SELECT 1 FROM Ticket WHERE TicketID = @TicketID)
            THROW 50020, 'Ticket not found.', 1;
        IF NOT EXISTS (SELECT 1 FROM Users WHERE UserID = @AgentID AND Role = 'Agent' AND IsActive = 1)
            THROW 50021, 'Invalid or inactive agent.', 1;

        DECLARE @OpenCount INT;
        SELECT @OpenCount = COUNT(*)
        FROM Ticket t JOIN Status s ON t.StatusID = s.StatusID
        WHERE t.AssignedToID = @AgentID AND s.StatusName NOT IN ('Resolved','Closed');

        IF @OpenCount >= 10
            PRINT 'Warning: Agent already has ' + CAST(@OpenCount AS VARCHAR) + ' open tickets.';

        UPDATE Ticket
        SET AssignedToID = @AgentID, StatusID = 2, UpdatedDate = GETDATE()
        WHERE TicketID = @TicketID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
