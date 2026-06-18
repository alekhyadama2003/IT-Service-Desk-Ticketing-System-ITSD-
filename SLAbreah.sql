CREATE OR ALTER VIEW vw_SLABreach AS
SELECT
    t.TicketID,
    t.Title,
    p.PriorityName,
    sl.ResolutionHrs  AS SLAHours,
    DATEDIFF(HOUR, t.CreatedDate, GETDATE()) AS ElapsedHours,
    DATEDIFF(HOUR, t.CreatedDate, GETDATE()) - sl.ResolutionHrs AS BreachedByHours,
    u.FullName        AS AssignedTo,
    t.CreatedDate
FROM Ticket t
JOIN Priority p  ON t.PriorityID   = p.PriorityID
JOIN SLA     sl  ON t.PriorityID   = sl.PriorityID
JOIN Status  s   ON t.StatusID     = s.StatusID
LEFT JOIN Users u ON t.AssignedToID = u.UserID
WHERE s.StatusName NOT IN ('Resolved','Closed')
  AND DATEDIFF(HOUR, t.CreatedDate, GETDATE()) > sl.ResolutionHrs;
