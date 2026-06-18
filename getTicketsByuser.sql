CREATE OR ALTER PROCEDURE sp_GetTicketsByUser
    @UserID   INT,
    @StatusID INT = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF NOT EXISTS (SELECT 1 FROM Users WHERE UserID = @UserID)
        THROW 50040, 'User not found.', 1;

    SELECT
        t.TicketID, t.Title,
        c.CategoryName, p.PriorityName, s.StatusName,
        t.CreatedDate, t.UpdatedDate, t.ResolvedDate
    FROM Ticket t
    JOIN Category c ON t.CategoryID = c.CategoryID
    JOIN Priority p ON t.PriorityID = p.PriorityID
    JOIN Status   s ON t.StatusID   = s.StatusID
    WHERE t.CreatedByID = @UserID
      AND (@StatusID IS NULL OR t.StatusID = @StatusID)
    ORDER BY t.CreatedDate DESC;
END;
