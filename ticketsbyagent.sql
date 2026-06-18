CREATE OR ALTER VIEW vw_TicketsByAgent AS
SELECT
    u.UserID,
    u.FullName        AS AgentName,
    d.DepartmentName,
    COUNT(t.TicketID) AS OpenTicketCount,
    SUM(CASE WHEN p.PriorityName = 'P1' THEN 1 ELSE 0 END) AS P1Count,
    SUM(CASE WHEN p.PriorityName = 'P2' THEN 1 ELSE 0 END) AS P2Count
FROM Users u
JOIN Department d  ON u.DepartmentID = d.DepartmentID
LEFT JOIN Ticket   t ON u.UserID     = t.AssignedToID
LEFT JOIN Status   s ON t.StatusID   = s.StatusID AND s.StatusName NOT IN ('Resolved','Closed')
LEFT JOIN Priority p ON t.PriorityID = p.PriorityID
WHERE u.Role = 'Agent' AND u.IsActive = 1
GROUP BY u.UserID, u.FullName, d.DepartmentName;
