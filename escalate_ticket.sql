CREATE OR ALTER PROCEDURE sp_EscalateTicket
AS
BEGIN
    SET NOCOUNT ON;
    SELECT
        t.TicketID, t.Title,
        p.PriorityName,
        sl.ResolutionHrs AS SLAHours,
        DATEDIFF(HOUR, t.CreatedDate, GETDATE()) AS ElapsedHours,
        DATEDIFF(HOUR, t.CreatedDate, GETDATE()) - sl.ResolutionHrs AS BreachedBy,
        u.FullName AS AssignedAgent
    FROM Ticket t
    JOIN Priority p  ON t.PriorityID   = p.PriorityID
    JOIN SLA     sl  ON t.PriorityID   = sl.PriorityID
    JOIN Status  s   ON t.StatusID     = s.StatusID
    LEFT JOIN Users u ON t.AssignedToID = u.UserID
    WHERE s.StatusName NOT IN ('Resolved','Closed')
      AND DATEDIFF(HOUR, t.CreatedDate, GETDATE()) > sl.ResolutionHrs
    ORDER BY BreachedBy DESC;
END;
