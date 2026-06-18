CREATE OR ALTER VIEW vw_OpenTickets AS
SELECT
    t.TicketID,
    t.Title,
    c.CategoryName,
    p.PriorityName,
    s.StatusName,
    u_created.FullName  AS RaisedBy,
    u_agent.FullName    AS AssignedTo,
    t.CreatedDate,
    DATEDIFF(HOUR, t.CreatedDate, GETDATE()) AS AgeInHours
FROM Ticket t
JOIN Category c       ON t.CategoryID   = c.CategoryID
JOIN Priority p       ON t.PriorityID   = p.PriorityID
JOIN Status   s       ON t.StatusID     = s.StatusID
JOIN Users u_created  ON t.CreatedByID  = u_created.UserID
LEFT JOIN Users u_agent ON t.AssignedToID = u_agent.UserID
WHERE s.StatusName IN ('Open', 'In Progress');
