-- Report: Open Tickets by Department
SELECT
    d.DepartmentName,
    COUNT(t.TicketID) AS TotalOpen,
    SUM(CASE WHEN p.PriorityName = 'P1' THEN 1 ELSE 0 END) AS P1,
    SUM(CASE WHEN p.PriorityName = 'P2' THEN 1 ELSE 0 END) AS P2,
    SUM(CASE WHEN p.PriorityName = 'P3' THEN 1 ELSE 0 END) AS P3,
    SUM(CASE WHEN p.PriorityName = 'P4' THEN 1 ELSE 0 END) AS P4
FROM Ticket t
JOIN Users      u ON t.CreatedByID  = u.UserID
JOIN Department d ON u.DepartmentID = d.DepartmentID
JOIN Priority   p ON t.PriorityID   = p.PriorityID
JOIN Status     s ON t.StatusID     = s.StatusID
WHERE s.StatusName NOT IN ('Resolved','Closed')
GROUP BY d.DepartmentName
ORDER BY TotalOpen DESC;
